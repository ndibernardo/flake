;;; init.el --- Init File  -*- lexical-binding: t; no-byte-compile: t-*-
;;; Commentary:
;;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Init-File.html

;;; Code:
(require 'cl-lib)

;; y-or-n prompt
(defalias 'yes-or-no-p 'y-or-n-p)

;; Utf-8
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; No tabs
(setq-default indent-tabs-mode nil)
;; Tab width
(setq-default tab-width 2)

;; Remove whitespaces
(defun show-trailing-whitespace-setup ()
  "Highlight trailing whitespace in the current buffer."
  (setq-local show-trailing-whitespace t))

(add-hook 'prog-mode-hook 'show-trailing-whitespace-setup)

(defun delete-trailing-whitespace-except-current-line ()
  "Delete trailing whitespace everywhere but on the line point is on.
Skipping that line keeps autosaves (see `auto-save-visited-mode') from
eating the space just typed."
  (let ((line-start (line-beginning-position))
        (line-end (line-end-position)))
    (delete-trailing-whitespace (point-min) line-start)
    (delete-trailing-whitespace line-end (point-max))))

(add-hook 'before-save-hook 'delete-trailing-whitespace-except-current-line)

(setq compilation-scroll-output t)
(setq compilation-window-height 15)
(setq display-buffer-alist
      '(("\\*\\(compilation\\|eshell\\|xref\\|vterm\\|system-shell\\)\\*"
         (display-buffer-reuse-mode-window
          display-buffer-below-selected)
         (window-height . 20))))
(setq display-line-numbers-width 3)
(setq display-line-numbers-type 'relative)
(setq split-height-threshold 80)
(setq temp-buffer-max-height 15)
(temp-buffer-resize-mode 1)
(setq window-divider-default-right-width 1)

(global-auto-revert-mode t)
(setq vc-follow-symlinks t)

(setq auto-save-visited-interval 5)
(setq auto-save-visited-predicate
      (lambda () (not (bound-and-true-p vterm-mode))))
(auto-save-visited-mode 1)

;; No menubar
(menu-bar-mode -1)
;; No scrollbar
(scroll-bar-mode -1)
;; No toolbar
(tool-bar-mode -1)
;; No tooltips
(tooltip-mode -1)

(set-face-attribute 'default nil :family "Berkeley Mono" :weight 'medium :height 120)
(set-face-attribute 'fixed-pitch nil :family "Berkeley Mono" :weight 'medium)

;; No startup screen
(setq inhibit-splash-screen t)
;; No scratch message
(setq initial-scratch-message "")
;; No echo area message
(setq inhibit-startup-echo-area-message t)

;; Show column number
(column-number-mode 1)
;; Show matching parens
(show-paren-mode 1)
;; Display dividers between windows
(window-divider-mode 1)
;; Delete selection
(delete-selection-mode 1)

(setq-default fill-column 100)

(load-theme 'base16-tomorrow-night t)

;; Ligatures
(ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
(add-hook 'prog-mode-hook 'ligature-mode)

;; Git  Gutter
(setq git-gutter:update-interval 0.02)
(setq git-gutter:diff-option "HEAD")

(add-hook 'prog-mode-hook 'git-gutter-mode)

(require 'git-gutter-fringe)
(define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom)

;; Line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Line spacing
(defun set-line-spacing ()
  "Configure text display properties for better readability."
  (setq-local default-text-properties
              '(line-spacing 0.10 line-height 1.10)))
(add-hook 'prog-mode-hook 'set-line-spacing)
(add-hook 'text-mode-hook 'set-line-spacing)

;; Cursor
(setq-default cursor-type 'bar)
(blink-cursor-mode 0)

;; Evil
(setq evil-want-integration t
      evil-want-keybinding nil
      evil-want-C-g-bindings t
      evil-want-C-u-scroll t
      evil-want-C-u-delete t
      evil-want-C-w-delete t
      evil-want-Y-yank-to-eol t
      evil-want-abbrev-expand-on-insert-exit nil
      evil-undo-system 'undo-fu
      evil-search-module 'evil-search
      evil-ex-search-vim-style-regexp t
      evil-ex-visual-char-range t
      evil-ex-interactive-search-highlight 'selected-window
      evil-symbol-word-search t
      evil-mode-line-format nil
      evil-kbd-macro-suppress-motion-error t
      evil-visual-update-x-selection-p nil
      evil-split-window-below t
      evil-vsplit-window-right t
      evil-normal-state-cursor 'box
      evil-insert-state-cursor 'bar
      evil-visual-state-cursor 'hollow
      evil-emacs-state-cursor 'box)

(setq undo-limit 400000
      undo-strong-limit 3000000
      undo-outer-limit 48000000
      undo-fu-allow-undo-in-region t
      undo-fu-session-incompatible-files '("\\.gpg\\'" "/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
(undo-fu-session-global-mode)

(setq evil-collection-want-find-usages-bindings nil)

(evil-mode 1)
(evil-collection-init)
(evil-define-key 'normal emacs-lisp-mode-map "gz" nil)
(evil-define-key 'normal lisp-interaction-mode-map "gz" nil)

(setq evil-escape-key-sequence "jk"
      evil-escape-delay 0.15
      evil-escape-excluded-states '(normal visual multiedit emacs motion)
      evil-escape-excluded-major-modes '(treemacs-mode vterm-mode))
(evil-escape-mode 1)

(setq evil-snipe-smart-case t
      evil-snipe-scope 'line
      evil-snipe-repeat-scope 'visible
      evil-snipe-char-fold t)
(evil-snipe-mode 1)
(evil-snipe-override-mode 1)

(setq evil-goggles-duration 0.1
      evil-goggles-pulse nil
      evil-goggles-enable-delete nil
      evil-goggles-enable-change nil)
(evil-goggles-mode 1)

(global-evil-surround-mode 1)
(global-evil-visualstar-mode 1)
(evil-lion-mode 1)
(evil-exchange-install)
(evil-indent-plus-default-bindings)
(evilem-default-keybindings "gs")
(define-key evilem-map (kbd "SPC") #'evil-avy-goto-char-timer)

(defvar evil-mc-key-map (make-sparse-keymap))
(global-evil-mc-mode 1)

(defun escape-clear-cursors ()
  "Remove every evil-mc cursor, if there are any.
Returns non-nil when there were cursors, so `escape-dwim' stops there:
the first ESC brings all cursors back to normal state, the next one
removes them, as in Doom."
  (when (evil-mc-has-cursors-p)
    (evil-mc-undo-all-cursors)
    t))

(add-hook 'escape-hook 'escape-clear-cursors)

(general-define-key
 :states '(normal visual)
 :prefix "gz"
 "" '(:ignore t :which-key "multiple cursors")
 "d" #'evil-mc-make-and-goto-next-match
 "D" #'evil-mc-make-and-goto-prev-match
 "s" #'evil-mc-skip-and-goto-next-match
 "S" #'evil-mc-skip-and-goto-prev-match
 "c" #'evil-mc-skip-and-goto-next-cursor
 "C" #'evil-mc-skip-and-goto-prev-cursor
 "j" #'evil-mc-make-cursor-move-next-line
 "k" #'evil-mc-make-cursor-move-prev-line
 "m" #'evil-mc-make-all-cursors
 "n" #'evil-mc-make-and-goto-next-cursor
 "N" #'evil-mc-make-and-goto-last-cursor
 "p" #'evil-mc-make-and-goto-prev-cursor
 "P" #'evil-mc-make-and-goto-first-cursor
 "q" #'evil-mc-undo-all-cursors
 "t" #'toggle-frozen-cursors
 "u" #'evil-mc-undo-last-added-cursor
 "z" #'toggle-cursor-here)

(general-define-key
 :states 'visual
 :prefix "gz"
 "I" #'evil-mc-make-cursor-in-visual-selection-beg
 "A" #'evil-mc-make-cursor-in-visual-selection-end)

(defun toggle-frozen-cursors ()
  "Freeze the cursors so they stop following, or let them follow again.
While frozen, the main cursor moves alone, to be placed somewhere else
before the others resume mirroring it.  Doom's
`+multiple-cursors/evil-mc-toggle-cursors'."
  (interactive)
  (if evil-mc-frozen
      (evil-mc-resume-cursors)
    (evil-mc-pause-cursors)))

(defun toggle-cursor-here ()
  "Add a cursor at point, or remove the one already there.
The new cursor starts frozen, so further cursors can be placed by moving
and pressing gzz again; gzt then lets them all follow.  Doom's
`+multiple-cursors/toggle-cursor-here'."
  (interactive)
  (let ((cursor (cl-find-if (lambda (cursor)
                              (= (evil-mc-get-cursor-start cursor) (point)))
                            evil-mc-cursor-list)))
    (if cursor
        (evil-mc-undo-cursor cursor)
      (evil-mc-make-cursor-here)
      (evil-mc-pause-cursors))))

(general-define-key
 :states 'normal
 "M-d" #'evil-multiedit-match-symbol-and-next
 "M-D" #'evil-multiedit-match-symbol-and-prev)

(general-define-key
 :states 'visual
 "M-d" #'evil-multiedit-match-and-next
 "M-D" #'evil-multiedit-match-and-prev
 "R" #'evil-multiedit-match-all)

(general-define-key
 :states '(normal visual)
 "C-M-d" #'evil-multiedit-restore)

(with-eval-after-load 'evil-multiedit
  (general-define-key
   :keymaps 'evil-multiedit-mode-map
   :states '(normal visual)
   "M-d" #'evil-multiedit-match-and-next
   "M-D" #'evil-multiedit-match-and-prev
   "RET" #'evil-multiedit-toggle-or-restrict-region)
  (general-define-key
   :keymaps 'evil-multiedit-mode-map
   "C-n" #'evil-multiedit-next
   "C-p" #'evil-multiedit-prev))

(define-key evil-inner-text-objects-map "a" #'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" #'evil-outer-arg)
(define-key evil-inner-text-objects-map "B" #'evil-textobj-anyblock-inner-block)
(define-key evil-outer-text-objects-map "B" #'evil-textobj-anyblock-a-block)
(define-key evil-inner-text-objects-map "c" #'evilnc-inner-comment)
(define-key evil-outer-text-objects-map "c" #'evilnc-outer-commenter)

(winner-mode 1)
(define-key evil-window-map "u" #'winner-undo)
(define-key evil-window-map (kbd "C-r") #'winner-redo)

(defvar escape-hook nil
  "Hook run by `escape-dwim' before it falls back to `keyboard-quit'.
Each function is called with no arguments; the first one to return
non-nil counts as having handled the escape, and the rest are skipped.")

(defun escape-dwim ()
  "Get out of whatever is going on, one layer at a time.
Doom's `doom/escape': abort an active minibuffer, else let `escape-hook'
handle it (clearing search highlights, for example), else quit.  Does
nothing while a keyboard macro is being recorded or run, so escaping
inside a macro doesn't abort it."
  (interactive)
  (cond ((minibuffer-window-active-p (minibuffer-window))
         (abort-recursive-edit))
        ((run-hook-with-args-until-success 'escape-hook))
        ((or defining-kbd-macro executing-kbd-macro) nil)
        (t (keyboard-quit))))

(defun escape-clear-search-highlight ()
  "Remove the highlight left by the last search, if any.
Returns non-nil when there was one, so `escape-dwim' stops there and the
next escape quits as usual."
  (when (evil-ex-hl-active-p 'evil-ex-search)
    (evil-ex-nohighlight)
    t))

(add-hook 'escape-hook 'escape-clear-search-highlight)
(global-set-key [remap keyboard-quit] #'escape-dwim)
(defun escape-after-normal-state (&rest _)
  "Run `escape-dwim' after an interactive `evil-force-normal-state'.
ESC in normal state is bound to `evil-force-normal-state', which on its
own leaves search highlights and other transient state behind.  Calls
from Lisp are left alone, since they are not the user pressing ESC."
  (when (called-interactively-p 'any)
    (call-interactively #'escape-dwim)))

(advice-add 'evil-force-normal-state :after #'escape-after-normal-state)

(defun lookup-documentation ()
  "Show documentation for the thing at point, used by evil's K.
Asks the language server when one is attached, racket-xp when it is
running, `describe-symbol' in Emacs Lisp, and falls back to man pages,
which is evil's own default."
  (interactive)
  (cond ((bound-and-true-p lsp-mode) (lsp-describe-thing-at-point))
        ((bound-and-true-p racket-xp-mode) (racket-xp-describe))
        ((derived-mode-p 'emacs-lisp-mode)
         (describe-symbol (or (symbol-at-point) (user-error "No symbol at point"))))
        (t (call-interactively #'man))))

(setq evil-lookup-func #'lookup-documentation)

(evil-define-operator eval-operator (beg end)
  "Evaluate the text between BEG and END, bound to gr like Doom's.
Racket buffers send the text to the REPL; Emacs Lisp buffers evaluate it
in this Emacs.  Other modes have no evaluator and signal an error."
  :move-point nil
  (cond ((derived-mode-p 'racket-mode 'racket-hash-lang-mode)
         (racket-send-region beg end))
        ((derived-mode-p 'emacs-lisp-mode)
         (eval-region beg end))
        (t (user-error "No evaluator for %s" major-mode))))

(defun eval-buffer-dwim ()
  "Evaluate the whole buffer with `eval-operator', bound to gR."
  (interactive)
  (eval-operator (point-min) (point-max)))

(defun search-project-for-symbol ()
  "Search the current project for the symbol at point.
Starts `consult-ripgrep' with the symbol as input, so it can still be
edited before the results narrow."
  (interactive)
  (consult-ripgrep nil (thing-at-point 'symbol t)))

(defun search-buffer-for-symbol ()
  "Search the current buffer for the symbol at point.
Starts `consult-line' with the symbol as input, so it can still be
edited before the results narrow."
  (interactive)
  (consult-line (thing-at-point 'symbol t)))

(defun delete-visited-file ()
  "Delete the file visited by the current buffer, then kill the buffer.
Asks first.  The file goes to the trash, since `delete-by-moving-to-trash'
is on."
  (interactive)
  (let ((file (or (buffer-file-name) (user-error "Buffer is not visiting a file"))))
    (when (y-or-n-p (format "Delete %s? " file))
      (delete-file file t)
      (kill-buffer))))

(defun yank-buffer-path ()
  "Copy the absolute path of the file visited by the current buffer.
The path goes on the kill ring, and from there to the system clipboard."
  (interactive)
  (let ((file (or (buffer-file-name) (user-error "Buffer is not visiting a file"))))
    (kill-new file)
    (message "Copied %s" file)))

(defun find-config-file ()
  "Find a file in the Emacs configuration of `nixos-flake-directory'.
The flake checkout rather than ~/.config/emacs, whose files are only
links into it."
  (interactive)
  (let ((default-directory (file-name-concat nixos-flake-directory "configuration" "emacs/")))
    (call-interactively #'find-file)))

(add-hook 'minibuffer-setup-hook #'vertico-repeat-save)

(with-eval-after-load 'vertico
  (define-key vertico-map (kbd "C-j") #'vertico-next)
  (define-key vertico-map (kbd "C-k") #'vertico-previous)
  (define-key vertico-map (kbd "C-M-j") #'vertico-next-group)
  (define-key vertico-map (kbd "C-M-k") #'vertico-previous-group))

(with-eval-after-load 'treemacs
  (require 'treemacs-evil))

(require 'general)

(general-create-definer leader-def
  :states '(normal visual motion insert emacs)
  :keymaps 'override
  :prefix "SPC"
  :non-normal-prefix "M-SPC")

(general-create-definer local-leader-def
  :states '(normal visual motion insert emacs)
  :prefix "SPC m"
  :non-normal-prefix "M-SPC m")

(general-define-key
 :states '(normal visual)
 "gc" #'evilnc-comment-operator
 "gr" #'eval-operator
 "gD" #'xref-find-references
 "g=" #'evil-numbers/inc-at-pt
 "g-" #'evil-numbers/dec-at-pt)

(general-define-key
 :states 'normal
 "gR" #'eval-buffer-dwim
 "]d" #'git-gutter:next-hunk
 "[d" #'git-gutter:previous-hunk)

(general-define-key
 :states 'insert
 "C-a" #'smart-beginning-of-line
 "C-e" #'move-end-of-line)

(evil-define-motion smart-beginning-of-line-motion ()
  "Motion form of `smart-beginning-of-line', so operators like d0 use it.
Exclusive, like evil's own `evil-beginning-of-line'."
  :type exclusive
  (smart-beginning-of-line))

(evil-define-command smart-digit-argument-or-beginning-of-line ()
  "Bound to 0: a count digit after other digits, else a smart line start.
Mirrors `evil-digit-argument-or-evil-beginning-of-line', redirecting to
`smart-beginning-of-line-motion' instead.  The first 0 goes to the first
non-blank character, a second one to column 0, and so on back and forth."
  :digit-argument-redirection smart-beginning-of-line-motion
  :keep-visual t
  :repeat nil
  (interactive)
  (if current-prefix-arg
      (progn
        (setq this-command #'digit-argument)
        (call-interactively #'digit-argument))
    (setq this-command #'smart-beginning-of-line-motion)
    (call-interactively #'smart-beginning-of-line-motion)))

(general-define-key
 :states 'motion
 "0" #'smart-digit-argument-or-beginning-of-line)

(leader-def
  ":" '(execute-extended-command :which-key "M-x")
  ";" '(pp-eval-expression :which-key "eval expression")
  "u" '(universal-argument :which-key "universal argument")
  "w" `(,evil-window-map :which-key "window")
  "h" '(help-command :which-key "help")
  "x" '(scratch-buffer :which-key "scratch buffer")
  "." '(find-file :which-key "find file")
  "," '(consult-buffer :which-key "switch buffer")
  "<" '(switch-to-buffer :which-key "switch to buffer")
  "`" '(evil-switch-to-windows-last-buffer :which-key "last buffer")
  "'" '(vertico-repeat :which-key "resume last search")
  "/" '(consult-ripgrep :which-key "search project")
  "*" '(search-project-for-symbol :which-key "search project for symbol")
  "SPC" '(project-find-file :which-key "find file in project")
  "RET" '(bookmark-jump :which-key "jump to bookmark")

  "b" '(:ignore t :which-key "buffer")
  "bb" '(consult-buffer :which-key "switch buffer")
  "bB" '(switch-to-buffer :which-key "switch to buffer")
  "bd" '(kill-current-buffer :which-key "kill buffer")
  "bk" '(kill-current-buffer :which-key "kill buffer")
  "bi" '(ibuffer :which-key "ibuffer")
  "bl" '(evil-switch-to-windows-last-buffer :which-key "last buffer")
  "bm" '(bookmark-set :which-key "set bookmark")
  "bM" '(bookmark-delete :which-key "delete bookmark")
  "bn" '(next-buffer :which-key "next buffer")
  "bp" '(previous-buffer :which-key "previous buffer")
  "b]" '(next-buffer :which-key "next buffer")
  "b[" '(previous-buffer :which-key "previous buffer")
  "bN" '(evil-buffer-new :which-key "new empty buffer")
  "br" '(revert-buffer :which-key "revert buffer")
  "bs" '(basic-save-buffer :which-key "save buffer")
  "bS" '(save-some-buffers :which-key "save all buffers")
  "bx" '(scratch-buffer :which-key "scratch buffer")
  "bz" '(bury-buffer :which-key "bury buffer")

  "c" '(:ignore t :which-key "code")
  "ca" '(lsp-execute-code-action :which-key "code action")
  "cc" '(compile :which-key "compile")
  "cC" '(recompile :which-key "recompile")
  "cd" '(xref-find-definitions :which-key "jump to definition")
  "cD" '(xref-find-references :which-key "jump to references")
  "cf" '(lsp-format-buffer :which-key "format buffer")
  "ci" '(lsp-find-implementation :which-key "find implementations")
  "ck" '(lookup-documentation :which-key "documentation")
  "cr" '(lsp-rename :which-key "rename")
  "ct" '(lsp-find-type-definition :which-key "type definition")
  "cw" '(delete-trailing-whitespace :which-key "delete trailing whitespace")
  "cx" '(flycheck-list-errors :which-key "list errors")

  "f" '(:ignore t :which-key "file")
  "fd" '(dired :which-key "dired")
  "fD" '(delete-visited-file :which-key "delete this file")
  "ff" '(find-file :which-key "find file")
  "fp" '(find-config-file :which-key "find in configuration")
  "fr" '(consult-recent-file :which-key "recent files")
  "fR" '(rename-visited-file :which-key "rename this file")
  "fs" '(save-buffer :which-key "save file")
  "fS" '(write-file :which-key "save file as")
  "fy" '(yank-buffer-path :which-key "yank file path")

  "g" '(:ignore t :which-key "git")
  "g[" '(git-gutter:previous-hunk :which-key "previous hunk")
  "g]" '(git-gutter:next-hunk :which-key "next hunk")
  "gb" '(magit-branch-checkout :which-key "checkout branch")
  "gB" '(magit-blame-addition :which-key "blame")
  "gC" '(magit-clone :which-key "clone")
  "gD" '(magit-file-delete :which-key "delete file")
  "gg" '(magit-status :which-key "status")
  "gG" '(magit-status-here :which-key "status here")
  "gL" '(magit-log-buffer-file :which-key "log of file")
  "gr" '(git-gutter:revert-hunk :which-key "revert hunk")
  "gR" '(vc-revert :which-key "revert file")
  "gs" '(git-gutter:stage-hunk :which-key "stage hunk")
  "gS" '(magit-stage-file :which-key "stage file")
  "gU" '(magit-unstage-file :which-key "unstage file")
  "gc" '(:ignore t :which-key "create")
  "gcb" '(magit-branch-and-checkout :which-key "branch")
  "gcc" '(magit-commit-create :which-key "commit")
  "gf" '(:ignore t :which-key "find")
  "gff" '(magit-find-file :which-key "find file")

  "i" '(:ignore t :which-key "insert")
  "ie" '(emoji-search :which-key "emoji")
  "is" '(yas-insert-snippet :which-key "snippet")
  "iu" '(insert-char :which-key "unicode")
  "iy" '(consult-yank-pop :which-key "from kill ring")

  "o" '(:ignore t :which-key "open")
  "o-" '(dired-jump :which-key "dired")
  "oe" '(eshell :which-key "eshell")
  "op" '(treemacs :which-key "project sidebar")
  "oP" '(treemacs-find-file :which-key "find file in sidebar")
  "ot" '(project-shell :which-key "terminal")
  "oT" '(vterm :which-key "terminal here")

  "p" '(:ignore t :which-key "project")
  "p!" '(project-shell-command :which-key "run command")
  "p&" '(project-async-shell-command :which-key "run async command")
  "pb" '(project-switch-to-buffer :which-key "switch buffer")
  "pc" '(project-compile :which-key "compile")
  "pd" '(project-forget-project :which-key "forget project")
  "pD" '(project-dired :which-key "dired")
  "pf" '(project-find-file :which-key "find file")
  "pk" '(project-kill-buffers :which-key "kill buffers")
  "pp" '(project-switch-project :which-key "switch project")

  "q" '(:ignore t :which-key "quit")
  "qf" '(delete-frame :which-key "delete frame")
  "qK" '(save-buffers-kill-emacs :which-key "kill emacs")
  "qq" '(save-buffers-kill-terminal :which-key "quit")
  "qQ" '(evil-quit-all-with-error-code :which-key "quit without saving")

  "s" '(:ignore t :which-key "search")
  "sb" '(consult-line :which-key "search buffer")
  "sB" '(consult-line-multi :which-key "search all buffers")
  "sf" '(consult-find :which-key "locate file")
  "si" '(consult-imenu :which-key "imenu")
  "sI" '(consult-imenu-multi :which-key "imenu across buffers")
  "sj" '(evil-collection-consult-jump-list :which-key "jump list")
  "sm" '(bookmark-jump :which-key "bookmark")
  "sp" '(consult-ripgrep :which-key "search project")
  "sr" '(evil-collection-consult-mark :which-key "marks")
  "ss" '(consult-line :which-key "search buffer")
  "sS" '(search-buffer-for-symbol :which-key "search buffer for symbol")
  "su" '(vundo :which-key "undo history")

  "t" '(:ignore t :which-key "toggle")
  "tf" '(flycheck-mode :which-key "syntax checker")
  "tF" '(toggle-frame-fullscreen :which-key "frame fullscreen")
  "tg" '(evil-goggles-mode :which-key "evil goggles")
  "tl" '(display-line-numbers-mode :which-key "line numbers")
  "tr" '(read-only-mode :which-key "read-only mode")
  "ts" '(flyspell-mode :which-key "spell checker")
  "tv" '(visible-mode :which-key "visible mode")
  "tw" '(visual-line-mode :which-key "soft line wrapping"))

(local-leader-def
  :keymaps '(emacs-lisp-mode-map lisp-interaction-mode-map)
  "d" '(:ignore t :which-key "debug")
  "df" '(edebug-defun :which-key "instrument defun")
  "e" '(:ignore t :which-key "eval")
  "eb" '(eval-buffer :which-key "buffer")
  "ed" '(eval-defun :which-key "defun")
  "ee" '(eval-last-sexp :which-key "last sexp")
  "el" '(load-library :which-key "load library")
  "er" '(eval-region :which-key "region")
  "g" '(:ignore t :which-key "goto")
  "gf" '(find-function :which-key "function")
  "gl" '(find-library :which-key "library")
  "gv" '(find-variable :which-key "variable")
  "h" '(:ignore t :which-key "help")
  "ha" '(apropos :which-key "apropos")
  "hf" '(describe-function :which-key "function")
  "hv" '(describe-variable :which-key "variable"))

(with-eval-after-load 'racket-mode
  (local-leader-def
    :keymaps '(racket-mode-map racket-hash-lang-mode-map)
    "h" '(racket-xp-documentation :which-key "documentation")
    "l" '(racket-logger :which-key "logger")
    "o" '(racket-profile :which-key "profile")
    "p" '(racket-cycle-paren-shapes :which-key "cycle paren shapes")
    "r" '(racket-run :which-key "run")
    "R" '(racket-run-and-switch-to-repl :which-key "run and switch to repl")
    "t" '(racket-test :which-key "test")
    "y" '(racket-insert-lambda :which-key "insert lambda")
    "e" '(:ignore t :which-key "eval")
    "ed" '(racket-send-definition :which-key "definition")
    "el" '(racket-send-last-sexp :which-key "last sexp")
    "er" '(racket-send-region :which-key "region")
    "g" '(:ignore t :which-key "goto")
    "gb" '(racket-unvisit :which-key "back")
    "gd" '(racket-xp-visit-definition :which-key "definition")
    "gm" '(racket-visit-module :which-key "module")
    "gr" '(racket-open-require-path :which-key "require path")))

;; Corfu
(setq corfu-auto t)
(setq corfu-cycle t)
(setq corfu-quit-at-boundary nil)
(setq corfu-quit-no-match t)
(global-corfu-mode)

;; Flycheck
(setq flycheck-emacs-lisp-load-path 'inherit)
(add-hook 'prog-mode-hook 'flycheck-mode)

(defun enable-scratch-buffer-flycheck ()
  "Trust user-authored code in `*scratch*' so Flycheck can compile it."
  (when (string= (buffer-name) "*scratch*")
    (setq-local trusted-content :all)
    (flycheck-reset-enabled-checker 'emacs-lisp)))

(add-hook 'lisp-interaction-mode-hook 'enable-scratch-buffer-flycheck)

(setq flycheck-mode-line '(:eval (replace-regexp-in-string
                                  "FlyC" "φ"
                                  (flycheck-mode-line-status-text))))
;; LSP
(setq lsp-ui-doc-enable nil)
(setq lsp-completion-provider :none)
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-modeline-code-actions-enable nil)
(setq lsp-semantic-tokens-enable t)
(setq lsp-semantic-tokens-allow-ranged-requests nil)
(setq lsp-semantic-tokens-honor-refresh-requests t)
(setq lsp-default-create-error-handler-fn
      (lambda (method)
        (lambda (error)
          (unless (memq (lsp-get error :code) '(-32800 -32801))
            (lsp--warn "%s" (or (lsp--error-string error)
                                (format "%s Request has failed" method)))))))
(setq lsp-inlay-hint-enable t)

(defun corfu-lsp-setup ()
  "Lsp setup for corfu completion."
  (setq-local completion-styles '(orderless)
              completion-category-defaults nil))

(add-hook 'lsp-completion-mode-hook 'corfu-lsp-setup)

(advice-add 'lsp :before (lambda (&rest _) (direnv-update-environment)))

;; Marginalia
(add-hook 'after-init-hook 'marginalia-mode)

;; Orderless
(setq completion-styles '(orderless basic))
(setq completion-category-overrides
      '((file (styles basic partial-completion))))

;; Rainbows
(add-hook 'prog-mode-hook 'rainbow-mode)
(add-hook 'text-mode-hook 'rainbow-mode)

;; Savehist
(add-hook 'after-init-hook 'savehist-mode)

;; Treemacs
(setq treemacs-expand-after-init t)
(setq treemacs-no-png-images t)
(setq treemacs-position 'right)
(setq treemacs-text-scale -0.1)
(setq treemacs-user-mode-line-format 'none)
(with-eval-after-load 'treemacs
    (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
    (treemacs-filewatch-mode 1)
    (treemacs-follow-mode 1)
    (treemacs-hide-gitignored-files-mode 0)
    (treemacs-git-mode 'deferred)
    (treemacs-git-commit-diff-mode 1))

;; Ask for confirmation before a mouse drag moves a file or directory.
(with-eval-after-load 'treemacs
    (define-advice treemacs--drag-move-files
        (:around (fn source-pos target-pos) confirm)
      (let* ((source-key (-some-> (treemacs--button-in-line source-pos)
                                  (treemacs-button-get :key)))
             (target-key (-some-> (treemacs--button-in-line target-pos)
                                  (treemacs-button-get :key)))
             (target-dir (and (stringp target-key)
                              (if (file-directory-p target-key)
                                  target-key
                                (treemacs--parent-dir target-key)))))
        (when (and (stringp source-key) target-dir
                   (not (string= source-key target-key))
                   (not (treemacs-is-path source-key :directly-in target-dir))
                   (yes-or-no-p (format "Move %s to %s? "
                                        (treemacs--filename source-key)
                                        target-dir)))
          (funcall fn source-pos target-pos)))))

(with-eval-after-load 'magit
  (require 'treemacs-magit))

(defun treemacs-open-for-frame ()
  "Show Treemacs in the current frame without stealing focus.
Runs for each new client frame because `window-setup-hook' only fires
once, when the daemon starts and no frame exists yet."
  (when (and (display-graphic-p)
             (not (seq-find (lambda (window)
                              (eq (buffer-local-value 'major-mode (window-buffer window))
                                  'treemacs-mode))
                            (window-list))))
    (save-selected-window (treemacs))))

(add-hook 'server-after-make-frame-hook #'treemacs-open-for-frame)
(add-hook 'window-setup-hook #'treemacs-open-for-frame 'append)

;; Yasnippets
(add-hook 'after-init-hook 'yas-global-mode)

;; Vertico
(add-hook 'after-init-hook 'vertico-mode)

;; Which key
(setq which-key-idle-delay 0.7)
(which-key-mode)

(direnv-mode)

;; System rebuild
(defvar nixos-flake-directory (file-name-concat (expand-file-name "~") "flake")
  "Directory of the flake that builds this system.")

(defun nixos-switch ()
  "Rebuild the system from the flake in `nixos-flake-directory'.
Works from any buffer.  The build runs in an interactive compilation
buffer, so sudo's password prompt is picked up by
`comint-watch-for-password-prompt' and answered in the minibuffer.
`switch-detached' puts the build in its own systemd scope so that
restarting the Emacs daemon cannot kill it."
  (interactive)
  (let ((default-directory (expand-file-name nixos-flake-directory)))
    (unless (file-directory-p default-directory)
      (user-error "No flake directory at %s" default-directory))
    (compile "make switch-detached" t)))

(global-set-key (kbd "C-c n") 'nixos-switch)

;; Terminal
(defun vterm-project-shell ()
  "Start an inferior shell in the current project's root directory.
If a buffer already exists for running a shell in the project's root,
switch to it.  Otherwise, create a new shell buffer.
With \\[universal-argument] prefix arg, create a new inferior shell buffer even
if one already exists."
  (interactive)
  (require 'comint)
  (let* ((default-directory (project-root (project-current t)))
         (default-project-shell-name (project-prefixed-buffer-name "shell"))
         (shell-buffer (get-buffer default-project-shell-name)))
    (if (and shell-buffer (not current-prefix-arg))
        (if (comint-check-proc shell-buffer)
            (pop-to-buffer shell-buffer (bound-and-true-p display-comint-buffer-action))
          (vterm shell-buffer))
      (vterm (generate-new-buffer-name default-project-shell-name)))))

(advice-add 'project-shell :override #'vterm-project-shell)

;;; Prose
(set-face-attribute 'variable-pitch nil :family "Noto Sans" :height 145)

(defvar prose-fixed-pitch-faces
  '(markdown-code-face
    markdown-inline-code-face
    markdown-language-keyword-face
    markdown-pre-face
    markdown-table-face
    org-block
    org-block-begin-line
    org-block-end-line
    org-checkbox
    org-code
    org-document-info-keyword
    org-drawer
    org-meta-line
    org-property-value
    org-special-keyword
    org-table
    org-verbatim)
  "Faces kept monospaced while `variable-pitch-mode' is on.
Code, tables and markup keywords only line up in a fixed-width font.")

(defvar prose-fixed-pitch-height 0.98
  "Height of `prose-fixed-pitch-faces', as a fraction of `default'.
Atkinson Hyperlegible Mono runs larger than Noto Sans at the same height, so
code blocks need scaling down to sit level with the surrounding prose.")

(defun prose-keep-faces-fixed-pitch (&rest _)
  "Make `prose-fixed-pitch-faces' inherit `fixed-pitch'.
Loading a theme resets the faces to the theme's own specs and drops this
inherit, so this also runs on `enable-theme-functions' for the light and
dark themes `auto-dark-mode' swaps between."
  (dolist (face prose-fixed-pitch-faces)
    (when (facep face)
      (set-face-attribute face nil
                          :inherit 'fixed-pitch
                          :height prose-fixed-pitch-height))))

(add-hook 'enable-theme-functions 'prose-keep-faces-fixed-pitch)

(defun prose-mode-setup ()
  "Display the current buffer as prose.
`visual-line-mode' breaks lines between words rather than at the window
edge, and leaves the file's own line endings untouched."
  (variable-pitch-mode 1)
  (visual-line-mode 1)
  (setq-local fill-column 90
              word-wrap-by-category t
              visual-fill-column-center-text t)
  (visual-fill-column-mode 1)
  (prose-keep-faces-fixed-pitch))

(add-hook 'markdown-mode-hook 'prose-mode-setup)
(add-hook 'org-mode-hook 'prose-mode-setup)

;;; Programming Modes

(add-to-list 'auto-mode-alist '("\\.scrbl\\'" . racket-hash-lang-mode))
(add-to-list 'auto-mode-alist '("\\.rhm\\'" . racket-hash-lang-mode))
(add-hook 'racket-mode-hook 'racket-xp-mode)
(add-hook 'racket-hash-lang-mode-hook 'racket-xp-mode)

(add-hook 'racket-mode-hook (lambda () (flycheck-mode -1)))
(add-hook 'racket-hash-lang-mode-hook (lambda () (flycheck-mode -1)))

(setq lispyville-key-theme
      '((operators normal)
        c-w
        (prettify insert)
        (atom-movement t)
        slurp/barf-lispy
        additional
        additional-insert))

(dolist (hook '(lisp-data-mode-hook
                scheme-mode-hook
                racket-mode-hook
                racket-repl-mode-hook))
  (add-hook hook 'paredit-mode)
  (add-hook hook 'lispyville-mode)
  (add-hook hook 'rainbow-delimiters-mode))

;; Docker
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; Compose .yml/.yaml files use yaml-mode's filename associations.
(add-to-list 'auto-mode-alist '("docker-compose\\'" . yaml-mode))

;; Elixir
(require 'elixir-mode)
(add-to-list 'auto-mode-alist '("\\.\\(ex\\|exs\\|heex\\)\\'" . elixir-mode))
(add-hook 'elixir-mode-hook 'lsp)

;; Nix
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-hook 'nix-mode-hook 'lsp)

;; Rust
(setq lsp-rust-features "all")
(setq lsp-rust-analyzer-cargo-target-dir "target/rust-analyzer")

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook 'lsp)

;; Scala
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))
(add-hook 'scala-mode-hook 'lsp)

;; TypeScript
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
(add-hook 'typescript-mode-hook 'lsp)

;;;; Keys
;;; Move lines
(defun move-selected-lines (n)
  "Move the lines spanned by the visual selection N lines down.
A negative N moves them up.  The moved lines stay selected linewise, so
J and K can be pressed repeatedly, as with vim's `:m'>+1<CR>gv'.  A move
that would push the lines past either end of the buffer does nothing.
A buffer without a final newline gets one, otherwise its last line could
not swap places with the one above it."
  (let* ((start (marker-position evil-visual-beginning))
         (end (marker-position evil-visual-end))
         (first (line-number-at-pos start))
         (last (line-number-at-pos
                (if (and (> end start)
                         (save-excursion (goto-char end) (bolp)))
                    (1- end)
                  end))))
    (save-excursion
      (goto-char (point-max))
      (unless (bolp) (insert "\n")))
    (when (and (>= (+ first n) 1)
               (<= (+ last n) (count-lines (point-min) (point-max))))
      (goto-char (point-min))
      (forward-line (1- first))
      (let* ((beg (point))
             (text (delete-and-extract-region
                    beg (progn (forward-line (1+ (- last first))) (point)))))
        (goto-char beg)
        (forward-line n)
        (let ((new-beg (point)))
          (insert text)
          (evil-visual-make-selection new-beg (1- (point)) 'line))))
    (setq deactivate-mark nil)))

(defun move-selected-lines-down (count)
  "Move the selected lines COUNT lines down."
  (interactive "*p")
  (move-selected-lines count))

(defun move-selected-lines-up (count)
  "Move the selected lines COUNT lines up."
  (interactive "*p")
  (move-selected-lines (- count)))

(general-define-key
 :states 'visual
 "J" #'move-selected-lines-down
 "K" #'move-selected-lines-up)

(defun select-line ()
  "Select current line.  If region is active, extend selection downward by line.
If `visual-line-mode' is on, consider line as visual line.
URL `http://xahlee.info/emacs/emacs/emacs_select_line.html'"
  (interactive)
  (if (region-active-p)
      (if visual-line-mode
          (let ((xp1 (point)))
            (end-of-visual-line 1)
            (when (eq xp1 (point))
              (end-of-visual-line 2)))
        (progn
          (forward-line 1)
          (end-of-line)))
    (if visual-line-mode
        (progn (beginning-of-visual-line)
               (push-mark (point) t t)
               (end-of-visual-line))
      (progn
        (push-mark (line-beginning-position) t t)
        (end-of-line)))))

;; Smart C-a
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.
Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive "^")
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key (kbd "<s-left>") 'smart-beginning-of-line)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)

;; Beginning of next word
(defun beginning-of-next-word ()
  "Move point to the beginning of the next word."
  (interactive)
  (forward-word)
  (forward-word)
  (backward-word))

(global-set-key (kbd "M-f") 'beginning-of-next-word)
(global-set-key (kbd "<M-right>") 'beginning-of-next-word)

;; Duplicate line
(defun duplicate-line ()
  "Duplicate current line."
  (interactive)
  (beginning-of-line)
  (kill-line)
  (yank)
  (newline)
  (yank))

(global-set-key (kbd "C-c d") 'duplicate-line)

;; Avy
(global-set-key (kbd "C-.") 'avy-goto-word-1)

;; Treemacs
(global-set-key (kbd "<f8>") 'treemacs)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'magit-status)

;; Vundo
(global-set-key (kbd "C-x u") 'vundo)

(global-set-key (kbd "<escape>") 'escape-dwim)
(global-set-key (kbd "<M-up>") 'backward-paragraph)
(global-set-key (kbd "<M-down>") 'forward-paragraph)
(global-set-key (kbd "<mouse-8>") 'xref-go-back)
(global-set-key (kbd "<mouse-9>") 'xref-go-forward)

(global-set-key (kbd "M-<backspace>") 'backward-kill-word)
(global-set-key (kbd "M-<down-mouse-1>") 'xref-find-definitions)

;; Unbind
(global-set-key (kbd "M-c") nil)
(global-set-key (kbd "s-x") nil)

;;; Diminish modes
(defun diminish-modes ()
  "Diminish modes."
  (diminish 'auto-dark-mode)
  (diminish 'eldoc-mode)
  (diminish 'evil-collection-unimpaired-mode)
  (diminish 'evil-escape-mode)
  (diminish 'evil-goggles-mode)
  (diminish 'evil-mc-mode)
  (diminish 'evil-snipe-local-mode)
  (diminish 'git-gutter-mode)
  (diminish 'lispyville-mode)
  (diminish 'rainbow-mode)
  (diminish 'which-key-mode)
  (diminish 'yas-minor-mode))

(add-hook 'emacs-startup-hook 'diminish-modes)

;;; init.el ends here
