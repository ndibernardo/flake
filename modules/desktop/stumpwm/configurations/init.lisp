(in-package :stumpwm)

(load (merge-pathnames ".stumpwm.d/settings.lisp" (user-homedir-pathname)))

(let ((pkg (find-package "SWM-GAPS")))
  (when pkg
    (setf (symbol-value (find-symbol "*INNER-GAPS-SIZE*" pkg)) 4
          (symbol-value (find-symbol "*OUTER-GAPS-SIZE*" pkg)) 0
          (symbol-value (find-symbol "*HEAD-GAPS-SIZE*" pkg)) 0)
    (funcall (find-symbol "TOGGLE-GAPS-ON" pkg))))

(defun rc-symbol (package-name symbol-name)
  "Return SYMBOL-NAME interned in PACKAGE-NAME, or NIL when the package is absent."
  (let ((package (find-package package-name)))
    (when package
      (find-symbol symbol-name package))))

(defun rc-function (package-name symbol-name)
  "Return the function named by SYMBOL-NAME in PACKAGE-NAME, or NIL."
  (let ((symbol (rc-symbol package-name symbol-name)))
    (and symbol (fboundp symbol) (symbol-function symbol))))

(defun rc-value (package-name symbol-name)
  "Return the value of SYMBOL-NAME in PACKAGE-NAME, or NIL when unbound."
  (let ((symbol (rc-symbol package-name symbol-name)))
    (and symbol (boundp symbol) (symbol-value symbol))))

(defun rc-set-value (package-name symbol-name value)
  "Set SYMBOL-NAME in PACKAGE-NAME to VALUE when that variable exists."
  (let ((symbol (rc-symbol package-name symbol-name)))
    (when (and symbol (boundp symbol))
      (setf (symbol-value symbol) value))))

(defun rc-screen-formatter-segment (character)
  "Return a separated mode-line token only when CHARACTER is registered."
  (when (assoc character *screen-mode-line-formatters*)
    (list "  " (format nil "%~c" character))))

(defparameter *rc-swank-interface* "127.0.0.1")
(defparameter *rc-swank-port* 4005)
(defvar *rc-swank-server* nil
  "Port of the Swank server started by this configuration, or NIL.")

(defcommand rc-swank-start () ()
  "Start a loopback-only Swank server once."
  (cond
    (*rc-swank-server*
     (message "SWANK // already running on ~a:~d"
              *rc-swank-interface* *rc-swank-server*))
    ((null (rc-function "SWANK" "CREATE-SERVER"))
     (message "SWANK // unavailable in this StumpWM image"))
    (t
     (handler-case
         (setf *rc-swank-server*
               (funcall (rc-function "SWANK" "CREATE-SERVER")
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
    ((null (rc-function "SWANK" "STOP-SERVER"))
     (message "SWANK // stop function unavailable"))
    (t
     (handler-case
         (let ((port *rc-swank-server*))
           (funcall (rc-function "SWANK" "STOP-SERVER") port)
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

(defun rc-set-screen-dpi (dpi)
  "Pin the DPI clx-truetype resolves point sizes against."
  (let ((symbol (rc-symbol "XFT" "SCREEN-DPI")))
    (when (and symbol (fboundp (list 'setf symbol)))
      (funcall (fdefinition (list 'setf symbol))
               dpi (screen-number (current-screen))))))

(defun rc-truetype-font ()
  "A font object for *rc-ttf-file*, or NIL without TrueType support."
  (let ((cache (rc-function "XFT" "CACHE-FONT-FILE"))
        (class (rc-symbol "XFT" "FONT"))
        (file (probe-file *rc-ttf-file*)))
    (when (and cache class file)
      (funcall cache file)
      (rc-set-screen-dpi *rc-ttf-dpi*)
      (handler-case
          (make-instance class
                         :family *rc-ttf-family*
                         :subfamily *rc-ttf-subfamily*
                         :size *rc-ttf-size*)
        (error (e)
          (format *error-output* "font: ~a: ~a~%" *rc-ttf-file* e)
          nil)))))

(defun rc-set-first-font (fonts)
  "Install the first font in FONTS that the X server can actually open."
  (dolist (font fonts)
    (when (and (font-exists-p font)
               (handler-case (progn (set-font font) t)
                 (error (e)
                   (format *error-output* "font: ~a: ~a~%" font e)
                   nil)))
      (return font))))

(let ((truetype (rc-truetype-font)))
  (rc-set-first-font (if truetype (cons truetype *rc-fonts*) *rc-fonts*)))

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

(let ((pixel (parse-integer *rc-bg* :start 1 :radix 16)))
  (setf *default-bg-color* pixel)
  (let ((root (screen-root (current-screen))))
    (setf (xlib:window-background root) pixel)
    (xlib:clear-area root)))

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
  "Parse the signed integer at the front of STRING, or NIL."
  (ignore-errors (parse-integer string :junk-allowed t)))

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

(defun rc-clickable (string id &rest arguments)
  "Wrap STRING in a mode-line click action identified by ID."
  (apply #'format-with-on-click-id string id arguments))

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
                  collect (rc-clickable
                           (if (eq g (current-group))
                               (rc-accent (rc-escape (group-name g)))
                               (rc-muted (rc-escape (group-name g))))
                           :ml-on-click-switch-to-group
                           (group-name g)))))

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
                         (rc-clickable
                          (if (eq w current)
                              (rc-accent label)
                              (rc-muted label))
                          :ml-on-click-focus-window
                          (window-id w))))
                     windows))))

(defvar *rc-volume-text* "")
(defvar *rc-volume-timer* nil)

(defun rc-update-volume ()
  "Refresh the cached volume text outside the mode-line redraw path."
  (setf *rc-volume-text*
        (handler-case
            (let ((out (string-trim '(#\Space #\Newline)
                                    (run-shell-command *rc-volume-command* t))))
              (cond ((string= out "") "")
                    ((string= out "MUTE") (rc-muted "VOL // MUTE"))
                    (t (format nil "VOL // ~a%%" out))))
          (error () ""))))

(defun rc-reset-volume-timer ()
  "Refresh volume now and leave exactly one repeating refresh timer."
  (when (timer-p *rc-volume-timer*)
    (cancel-timer *rc-volume-timer*))
  (rc-update-volume)
  (setf *rc-volume-timer* (run-with-timer 5 5 #'rc-update-volume)))

(defun rc-volume ()
  *rc-volume-text*)

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

(defun rc-proc-wifi-percent ()
  "Legacy Wireless Extensions quality for *rc-interface*, or zero."
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

(defun rc-dbm-percent (dbm)
  "Map a Wi-Fi signal in DBM linearly from -100..-50 to 0..100 percent."
  (max 0 (min 100 (* 2 (+ dbm 100)))))

(defun rc-iw-output-percent (output)
  "Extract and convert the first signal value from iw link OUTPUT."
  (let* ((marker "signal:")
         (start (search marker output :test #'char-equal)))
    (if start
        (let ((dbm (rc-leading-integer
                    (string-left-trim '(#\Space #\Tab)
                                      (subseq output (+ start (length marker)))))))
          (if dbm (rc-dbm-percent dbm) 0))
        0)))

(defun rc-iw-wifi-percent ()
  "Read link signal through iw/nl80211, or return zero when unavailable."
  (handler-case
      (rc-iw-output-percent
       (run-shell-command
        (format nil "~a dev ~a link" *rc-iw* *rc-interface*) t))
    (error () 0)))

(defun rc-wifi-percent ()
  "Wi-Fi quality, preferring procfs and falling back to iw/nl80211."
  (let ((legacy (rc-proc-wifi-percent)))
    (if (plusp legacy) legacy (rc-iw-wifi-percent))))

(defvar *rc-network-text* "")
(defvar *rc-network-timer* nil)

(defun rc-update-network ()
  "Refresh cached network text outside the mode-line redraw path."
  (setf *rc-network-text*
        (handler-case
            (if (equal "up" (rc-read-line
                             (concat "/sys/class/net/" *rc-interface* "/operstate")))
                (format nil "WIFI // ~d%%" (rc-wifi-percent))
                (rc-accent "OFFLINE"))
          (error () (rc-accent "OFFLINE")))))

(defun rc-reset-network-timer ()
  "Refresh network state now and leave exactly one repeating timer."
  (when (timer-p *rc-network-timer*)
    (cancel-timer *rc-network-timer*))
  (rc-update-network)
  (setf *rc-network-timer* (run-with-timer 5 5 #'rc-update-network)))

(defun rc-network ()
  *rc-network-text*)

(rc-reset-volume-timer)
(rc-reset-network-timer)

(setf *mode-line-position* :top
      *mode-line-border-width* 0
      *mode-line-pad-x* 10
      *mode-line-pad-y* 8
      *mode-line-background-color* *rc-bg*
      *mode-line-foreground-color* *rc-fg*
      *mode-line-border-color* *rc-bg*
      *mode-line-timeout* 5
      *time-modeline-string* "TIME // %H:%M")

(defparameter *rc-mode-line-tail*
  (list '(:eval (rc-volume))
        "  "
        '(:eval (rc-bluetooth))
        "  "
        '(:eval (rc-network))
        "  "
        (rc-color *rc-accent-color* "%d"))
  "Status text drawn to the right of the tray. rc-tray-position measures it.")

(setf *screen-mode-line-format*
      (append (list '(:eval (rc-groups))
                    "  "
                    '(:eval (rc-windows))
                    "^>")
              (rc-screen-formatter-segment #\T)
              (list "  ")
              *rc-mode-line-tail*))

(unless (find-group (current-screen) "1")
  (grename "1"))
(loop for n from 2 to 10
      do (let ((name (format nil "~d" n)))
           (unless (find-group (current-screen) name)
             (gnewbg name))))

(unless (find-group (current-screen) ".scratchpad")
  (gnewbg ".scratchpad"))

(unless (find-group (current-screen) "dyn")
  (gnewbg-dynamic "dyn"))

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

(dolist (variable '("*TRAY-WIN-BACKGROUND*"
                    "*TRAY-VIWIN-BACKGROUND*"
                    "*TRAY-HIWIN-BACKGROUND*"))
  (rc-set-value "STUMPTRAY" variable *rc-bg*))

(defparameter *rc-tray-icon-height* 18
  "Tray icon side in pixels.")

(defparameter *rc-tray-gap* 20
  "Pixels between the last tray icon and the status text.")

(defun rc-tray-fit-icons (mode-line)
  "Set stumptray's cursor gap so MODE-LINE icons are *rc-tray-icon-height* tall."
  (let ((height (xlib:drawable-height (mode-line-window mode-line)))
        (thickness (or (rc-value "STUMPTRAY" "*TRAY-CURSOR-THICKNESS*") 2)))
    (rc-set-value "STUMPTRAY" "*TRAY-CURSOR-ICON-DISTANCE*"
                  (max 1 (- height thickness *rc-tray-icon-height*)))))

(defun rc-tray-position (tray)
  "Return TRAY's x, *rc-tray-gap* pixels left of *rc-mode-line-tail*."
  (let* ((ml (funcall (rc-function "STUMPTRAY" "TRAY-MODE-LINE") tray))
         (width (funcall (rc-function "STUMPTRAY" "TRAY-WIDTH") tray))
         (spacing (or (rc-value "STUMPTRAY" "*TRAY-ICON-SPACING*") 0))
         (*current-mode-line-formatters* *screen-mode-line-formatters*)
         (*current-mode-line-formatter-args* (list ml))
         (tail (mode-line-format-elt *rc-mode-line-tail*)))
    (max 0 (- (xlib:drawable-width (mode-line-window ml))
              *mode-line-pad-x*
              (rendered-string-size tail (mode-line-cc ml))
              width
              (- *rc-tray-gap* spacing)))))

(rc-set-value "STUMPTRAY" "*TRAY-ICON-SPACING*" 8)
(when (rc-symbol "STUMPTRAY" "*TRAY-POSITION-FUNCTION*")
  (rc-set-value "STUMPTRAY" "*TRAY-POSITION-FUNCTION*" #'rc-tray-position))

(defun rc-tray-placeholder (mode-line)
  "Reposition the tray for MODE-LINE, then return stumptray's placeholder."
  (let* ((current (rc-function "STUMPTRAY" "CURRENT-TRAY"))
         (tray (and current (funcall current)))
         (reposition (rc-function "STUMPTRAY" "UPDATE-MAIN-WINDOW-GEOMETRY"))
         (placeholder (rc-function "STUMPTRAY" "MODE-LINE-TRAY-PLACEHOLDER")))
    (when (and tray reposition)
      (ignore-errors (funcall reposition tray)))
    (if placeholder (funcall placeholder mode-line) "")))

(when (rc-function "STUMPTRAY" "MODE-LINE-TRAY-PLACEHOLDER")
  (add-screen-mode-line-formatter #\T 'rc-tray-placeholder))

(defun rc-tray-start ()
  "Create the XEmbed tray, unless one is already embedded."
  (let* ((tray (rc-function "STUMPTRAY" "STUMPTRAY"))
         (current (rc-function "STUMPTRAY" "CURRENT-TRAY"))
         (screen-mode-line (rc-function "STUMPTRAY" "SCREEN-MODE-LINE"))
         (ml (and screen-mode-line (funcall screen-mode-line (current-screen)))))
    (cond
      ((null tray)
       (message "TRAY // stumptray unavailable in this StumpWM image"))
      ((and current (funcall current))
       nil)
      ((null ml)
       (message "TRAY // no mode line to embed into"))
      (t
       (rc-tray-fit-icons ml)
       (handler-case (funcall tray)
         (error (e) (message "TRAY // start failed: ~a" e)))))))

(rc-set-value "NOTIFY" "*NOTIFY-SERVER-TITLE-COLOR*"
              (format nil "^(:fg ~s)" *rc-accent-color*))
(rc-set-value "NOTIFY" "*NOTIFY-SERVER-BODY-COLOR*"
              (format nil "^(:fg ~s)" *rc-fg*))

(defun rc-notify-listening-p ()
  "True when notify's flag is set and its DBus thread is still alive."
  (let ((thread (rc-value "NOTIFY" "*NOTIFY-SERVER-THREAD*"))
        (alive (rc-function "BORDEAUX-THREADS" "THREAD-ALIVE-P")))
    (and (rc-value "NOTIFY" "*NOTIFY-SERVER-IS-ON*")
         thread
         (or (null alive) (funcall alive thread))
         t)))

(defcommand rc-notify-start () ()
  "Claim org.freedesktop.Notifications, replacing a dead listener."
  (let ((start (rc-function "NOTIFY" "NOTIFY-SERVER-ON")))
    (cond
      ((null start)
       (message "NOTIFY // unavailable in this StumpWM image"))
      ((rc-notify-listening-p)
       (message "NOTIFY // already listening"))
      (t
       (rc-set-value "NOTIFY" "*NOTIFY-SERVER-IS-ON*" nil)
       (handler-case (funcall start)
         (error (e) (message "NOTIFY // start failed: ~a" e)))))))

(defcommand rc-notify-stop () ()
  "Release org.freedesktop.Notifications."
  (let ((stop (rc-function "NOTIFY" "NOTIFY-SERVER-OFF")))
    (cond
      ((null stop)
       (message "NOTIFY // unavailable in this StumpWM image"))
      ((not (rc-notify-listening-p))
       (rc-set-value "NOTIFY" "*NOTIFY-SERVER-IS-ON*" nil)
       (message "NOTIFY // not listening"))
      (t
       (handler-case (funcall stop)
         (error (e) (message "NOTIFY // stop failed: ~a" e)))))))

(defcommand rc-notify-status () ()
  "Report whether a live listener owns the notification bus name."
  (if (rc-notify-listening-p)
      (message "NOTIFY // listening")
      (message "NOTIFY // not listening")))

(define-interactive-keymap (window-mode tile-group)
    (:on-enter (lambda () (message "WINDOW // hjkl move, HJKL swap")))
  ((kbd "h") "move-focus left")
  ((kbd "j") "move-focus down")
  ((kbd "k") "move-focus up")
  ((kbd "l") "move-focus right")
  ((kbd "H") "move-window left")
  ((kbd "J") "move-window down")
  ((kbd "K") "move-window up")
  ((kbd "L") "move-window right"))

(defun rc-urgent-window (window)
  "Announce WINDOW when it sets the urgency hint."
  (message "URGENT // ~a" (rc-escape (or (window-title window) ""))))

(add-hook *urgent-window-hook* 'rc-urgent-window)

(defun rc-winner-snapshot (command)
  "Dump the frame layout when COMMAND is one of winner-mode's."
  (let ((commands (rc-value "WINNER-MODE" "*DEFAULT-COMMANDS*"))
        (dump (rc-function "WINNER-MODE" "DUMP-GROUP-TO-FILE")))
    (when (and dump (member command commands))
      (funcall dump))))

(add-hook *post-command-hook* 'rc-winner-snapshot)

(handler-case
    (progn
      (add-to-load-path (concat *rc-contrib-dir* "/util/command-history/"))
      (load-module "command-history"))
  (error (e)
    (format *error-output* "command-history: ~a~%" e)))

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
            ("s-m"            "window-mode")
            ("s-u"            "winner-undo")
            ("s-U"            "winner-redo")
            ("s-W"            "global-windowlist")
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
  (mode-line))

(rc-tray-start)
(rc-notify-start)

(when *initializing*
  (switch-to-group (find-group (current-screen) "1")))
