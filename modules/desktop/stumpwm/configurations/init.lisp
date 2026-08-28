;;;; StumpWM configuration.

(in-package :stumpwm)

(load (merge-pathnames ".stumpwm.d/settings.lisp" (user-homedir-pathname)))

(let ((pkg (find-package "SWM-GAPS")))
  (when pkg
    (setf (symbol-value (find-symbol "*INNER-GAPS-SIZE*" pkg)) 4
          (symbol-value (find-symbol "*OUTER-GAPS-SIZE*" pkg)) 0
          (symbol-value (find-symbol "*HEAD-GAPS-SIZE*" pkg)) 0)
    (funcall (find-symbol "TOGGLE-GAPS-ON" pkg))))

(defparameter *rc-swank-interface* "127.0.0.1")
(defparameter *rc-swank-port* 4005)
(defvar *rc-swank-server* nil
  "Port of the Swank server started by this configuration, or NIL.")

(defun rc-swank-function (name)
  "Return the Swank function named NAME, or NIL when Swank is unavailable."
  (let ((package (find-package "SWANK")))
    (when package
      (let ((symbol (find-symbol name package)))
        (and symbol (fboundp symbol) (symbol-function symbol))))))

(defcommand rc-swank-start () ()
  "Start a loopback-only Swank server once."
  (cond
    (*rc-swank-server*
     (message "SWANK // already running on ~a:~d"
              *rc-swank-interface* *rc-swank-server*))
    ((null (rc-swank-function "CREATE-SERVER"))
     (message "SWANK // unavailable in this StumpWM image"))
    (t
     (handler-case
         (setf *rc-swank-server*
               (funcall (rc-swank-function "CREATE-SERVER")
                        :port *rc-swank-port*
                        :interface *rc-swank-interface*
                        :dont-close t))
       (error (e)
         (message "SWANK // start failed: ~a" e)))
     (when *rc-swank-server*
       (message "SWANK // listening on ~a:~d"
                *rc-swank-interface* *rc-swank-server*)))))

(defcommand rc-swank-stop () ()
  "Stop the Swank server started by this configuration."
  (cond
    ((null *rc-swank-server*)
     (message "SWANK // not running"))
    ((null (rc-swank-function "STOP-SERVER"))
     (message "SWANK // stop function unavailable"))
    (t
     (handler-case
         (let ((port *rc-swank-server*))
           (funcall (rc-swank-function "STOP-SERVER") port)
           (setf *rc-swank-server* nil)
           (message "SWANK // stopped on ~a:~d" *rc-swank-interface* port))
       (error (e)
         (message "SWANK // stop failed: ~a" e))))))

(defcommand rc-swank-status () ()
  "Report whether this configuration has started a Swank server."
  (if *rc-swank-server*
      (message "SWANK // listening on ~a:~d"
               *rc-swank-interface* *rc-swank-server*)
      (message "SWANK // not running")))

(let ((font (find-if #'font-exists-p *rc-fonts*)))
  (when font
    (handler-case (set-font font)
      (error (e) (format *error-output* "font: ~a~%" e)))))

(setf *normal-border-width* 1
      *maxsize-border-width* 1
      *transient-border-width* 1
      *window-border-style* :thin)

(set-win-bg-color *rc-bg*)
(set-focus-color *rc-fg*)
(set-unfocus-color *rc-unfocused-color*)
(set-float-focus-color *rc-fg*)
(set-float-unfocus-color *rc-unfocused-color*)

(set-fg-color *rc-fg*)
(set-bg-color *rc-bg*)
(set-border-color *rc-bg*)
(set-msg-border-width 0)
(setf *message-window-padding* 10
      *message-window-y-padding* 6
      *message-window-gravity* :center
      *input-window-gravity* :center
      *timeout-wait* 3
      *suppress-frame-indicator* t
      *mouse-focus-policy* :sloppy)


(defun rc-read-line (path)
  "First line of PATH, or NIL when it cannot be read."
  (handler-case
      (with-open-file (s path :if-does-not-exist nil)
        (and s (read-line s nil nil)))
    (error () nil)))

(defun rc-leading-integer (string)
  "Parse the digits at the front of STRING, or NIL."
  (when string
    (let ((end (or (position-if-not #'digit-char-p string) (length string))))
      (when (plusp end)
        (parse-integer string :end end :junk-allowed t)))))

(defun rc-escape (s)
  "Neutralise format and colour codes in text we do not control."
  (with-output-to-string (out)
    (loop for ch across s
          do (case ch
               (#\% (write-string "%%" out))
               (#\^ (write-string "^^" out))
               (t (write-char ch out))))))

(defun rc-color (color s)
  "Wrap S in a mode-line colour code, restoring the default afterwards."
  (format nil "^(:fg ~s)~a^(:fg ~s)" color s *rc-fg*))

(defun rc-muted (s)
  (rc-color *rc-muted-color* s))

(defun rc-accent (s)
  (rc-color *rc-accent-color* s))

(defun rc-join (separator strings)
  (with-output-to-string (out)
    (loop for rest on strings
          do (write-string (car rest) out)
          when (cdr rest) do (write-string separator out))))

(defun rc-shorten (s n)
  (if (> (length s) n) (concat (subseq s 0 n) "...") s))

(defun rc-groups ()
  (format nil "~{~a~^ ~}"
          (loop for g in (non-hidden-groups (sort-groups (current-screen)))
                when (or (eq g (current-group)) (group-windows g))
                  collect (if (eq g (current-group))
                              (rc-accent (rc-escape (group-name g)))
                              (rc-muted (rc-escape (group-name g)))))))

(defun rc-windows ()
  (let ((current (current-window))
        (windows (sort1 (head-windows (current-group) (current-head))
                        #'< :key #'window-number)))
    (rc-join (rc-muted " | ")
             (mapcar (lambda (w)
                       (let ((label (rc-escape
                                     (format nil "~d ~a"
                                             (window-number w)
                                             (rc-shorten (or (window-title w) "") 20)))))
                         (if (eq w current)
                             (rc-accent label)
                             (rc-muted label))))
                     windows))))

(defun rc-volume ()
  (handler-case
      (let ((out (string-trim '(#\Space #\Newline)
                              (run-shell-command *rc-volume-command* t))))
        (cond ((string= out "") "")
              ((string= out "MUTE") (rc-muted "VOL // MUTE"))
              (t (format nil "VOL // ~a%%" out))))
    (error () "")))

(defun rc-bluetooth ()
  (handler-case
      (let* ((blocked
               (some (lambda (d)
                       (and (equal "bluetooth" (rc-read-line (merge-pathnames "type" d)))
                            (equal "1" (rc-read-line (merge-pathnames "soft" d)))))
                     (directory "/sys/class/rfkill/*/")))
             (present (directory "/sys/class/bluetooth/*/"))
             (links (count-if (lambda (d)
                                (find #\: (car (last (pathname-directory d)))))
                              present)))
        (cond ((null present) "")
              (blocked (rc-muted "BT // OFF"))
              ((plusp links) (format nil "BT // ~d" links))
              (t (rc-muted "BT // ON"))))
    (error () "")))

(defun rc-wifi-percent ()
  "Link quality for *rc-interface*, from /proc/net/wireless, as a percentage."
  (handler-case
      (with-open-file (s "/proc/net/wireless" :if-does-not-exist nil)
        (if (null s)
            0
            (let ((tag (concat *rc-interface* ":")))
              (loop for line = (read-line s nil nil)
                    while line
                    do (let ((hit (search tag line)))
                         (when hit
                           (let* ((fields (remove ""
                                                  (split-string (subseq line (+ hit (length tag))) " ")
                                                  :test #'string=))
                                  (quality (rc-leading-integer (second fields))))
                             (return (if quality (round (* 100 quality) 70) 0)))))
                    finally (return 0)))))
    (error () 0)))

(defun rc-network ()
  (handler-case
      (if (equal "up" (rc-read-line (concat "/sys/class/net/" *rc-interface* "/operstate")))
          (format nil "WIFI // ~d%%" (rc-wifi-percent))
          (rc-accent "OFFLINE"))
    (error () (rc-accent "OFFLINE"))))

(setf *mode-line-position* :top
      *mode-line-border-width* 0
      *mode-line-pad-x* 10
      *mode-line-pad-y* 8
      *mode-line-background-color* *rc-bg*
      *mode-line-foreground-color* *rc-fg*
      *mode-line-border-color* *rc-bg*
      *mode-line-timeout* 5
      *time-modeline-string* "TIME // %H:%M")

(setf *screen-mode-line-format*
      (list '(:eval (rc-groups))
            "  "
            '(:eval (rc-windows))
            "^>"
            '(:eval (rc-volume))
            "  "
            '(:eval (rc-bluetooth))
            "  "
            '(:eval (rc-network))
            "  "
            (rc-color *rc-accent-color* "%d")))


(unless (find-group (current-screen) "1")
  (grename "1"))
(loop for n from 2 to 10
      do (let ((name (format nil "~d" n)))
           (unless (find-group (current-screen) name)
             (gnewbg name))))

(unless (find-group (current-screen) ".scratchpad")
  (gnewbg ".scratchpad"))

(defun rc-scratchpad ()
  (find-group (current-screen) ".scratchpad"))

(defcommand scratchpad-send () ()
  "Move the current window to the scratchpad."
  (let ((w (current-window)))
    (if w
        (move-window-to-group w (rc-scratchpad))
        (message "No window"))))

(defcommand scratchpad-show () ()
  "Pull the next scratchpad window into the current group."
  (let ((w (first (group-windows (rc-scratchpad)))))
    (if w
        (progn (move-window-to-group w (current-group))
               (focus-window w))
        (message "Scratchpad empty"))))

(defcommand run-program-prompt () ()
  "Prompt for a program and run it."
  (let ((cmd (completing-read (current-screen) "RUN // " (programs-in-path))))
    (when (and cmd (plusp (length cmd)))
      (run-shell-command cmd))))

(defcommand toggle-float () ()
  "Float the current window, or return it to the tiling layout."
  (let ((w (current-window)))
    (when w
      (if (float-window-p w)
          (unfloat-this)
          (float-this)))))

(dolist (binding
         (append
          '(("s-Q"          "delete-window")
            ("s-d"          "run-program-prompt")
            ("s-C"          "loadrc")
            ("s-E"          "quit-confirm")

            ("s-h"          "move-focus left")
            ("s-j"          "move-focus down")
            ("s-k"          "move-focus up")
            ("s-l"          "move-focus right")
            ("s-H"          "move-window left")
            ("s-J"          "move-window down")
            ("s-K"          "move-window up")
            ("s-L"          "move-window right")

            ("s-1"          "gselect 1")
            ("s-2"          "gselect 2")
            ("s-3"          "gselect 3")
            ("s-4"          "gselect 4")
            ("s-5"          "gselect 5")
            ("s-6"          "gselect 6")
            ("s-7"          "gselect 7")
            ("s-8"          "gselect 8")
            ("s-9"          "gselect 9")
            ("s-0"          "gselect 10")

            ("s-exclam"          "gmove 1")
            ("s-at"              "gmove 2")
            ("s-numbersign"      "gmove 3")
            ("s-dollar"          "gmove 4")
            ("s-percent"         "gmove 5")
            ("s-dead_circumflex" "gmove 6")
            ("s-ampersand"       "gmove 7")
            ("s-asterisk"        "gmove 8")
            ("s-parenleft"       "gmove 9")
            ("s-parenright"      "gmove 10")

            ("s-b"            "hsplit")
            ("s-v"            "vsplit")
            ("s-s"            "only")
            ("s-w"            "windowlist")
            ("s-e"            "balance-frames")
            ("s-f"            "fullscreen")
            ("s-SPC"          "pull-hidden-next")
            ("s-S-SPC"        "toggle-float")
            ("s-TAB"          "next")
            ("s-ISO_Left_Tab" "prev")
            ("s-a"            "fother")
            ("s-r"            "iresize")
            ("s-minus"        "scratchpad-show")
            ("s-underscore"   "scratchpad-send"))

          (list
           (list "s-RET" (concat "exec " *rc-terminal*))
           (list "XF86AudioMute"
                 (concat "exec " *rc-pactl* " set-sink-mute @DEFAULT_SINK@ toggle"))
           (list "XF86AudioLowerVolume"
                 (concat "exec " *rc-pactl* " set-sink-volume @DEFAULT_SINK@ -5%"))
           (list "XF86AudioRaiseVolume"
                 (concat "exec " *rc-pactl* " set-sink-volume @DEFAULT_SINK@ +5%"))
           (list "XF86AudioMicMute"
                 (concat "exec " *rc-pactl* " set-source-mute @DEFAULT_SOURCE@ toggle"))
           (list "XF86MonBrightnessDown"
                 (concat "exec " *rc-brightnessctl* " set 5%-"))
           (list "XF86MonBrightnessUp"
                 (concat "exec " *rc-brightnessctl* " set 5%+"))
           (list "Print"
                 (concat "exec " *rc-maim* " \"$HOME/$(date +%Y%m%d_%H%M%S).png\"")))))
  (define-key *top-map* (kbd (first binding)) (second binding)))

(define-key *root-map* (kbd "C-s") "rc-swank-start")

(when *initializing*
  (mode-line)
  (switch-to-group (find-group (current-screen) "1")))
