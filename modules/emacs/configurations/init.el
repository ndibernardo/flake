;;; init.el --- Init File  -*- lexical-binding: t; no-byte-compile: t-*-
;;; Commentary:
;;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Init-File.html

;;; Code:
(require 'cl-lib)

(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")

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
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq compilation-scroll-output t)
(setq compilation-window-height 15)
(setq display-buffer-alist
      '(("\\*\\(compilation\\|eshell\\|xref\\|cider-repl\\)\\*"
         (display-buffer-reuse-mode-window
          display-buffer-below-selected)
         (window-height . 20))))
(setq display-line-numbers-width 3)
(setq split-height-threshold 80)
(setq temp-buffer-max-height 15)
(setq temp-buffer-resize-mode t)
(setq window-divider-default-right-width 1)

(global-auto-revert-mode t)

;; No menubar
(menu-bar-mode -1)
;; No scrollbar
(scroll-bar-mode -1)
;; No toolbar
(tool-bar-mode -1)
;; No tooltips
(tooltip-mode -1)

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

;; Appearance
(load-theme 'kaolin-dark t)

(custom-set-faces
 '(default
   ((t (:family "Berkeley Mono"
                :foundry "USGC"
                :slant normal
                :weight medium
                :height 120
                :width semi-condensed)))))

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
(global-ligature-mode t)

(setq git-gutter:update-interval 0.02)
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

;; Corfu
(setq corfu-auto t)
(setq corfu-cycle t)
(setq corfu-quit-at-boundary nil)
(setq corfu-quit-no-match t)
(global-corfu-mode)

;; Flycheck
(setq flycheck-emacs-lisp-load-path 'inherit)
(add-hook 'prog-mode-hook 'flycheck-mode)

(setq flycheck-mode-line '(:eval (replace-regexp-in-string
                                  "FlyC" "φ"
                                  (flycheck-mode-line-status-text))))
;; LSP
(setq lsp-ui-doc-enable nil)
(setq lsp-completion-provider :none)
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-modeline-code-actions-enable nil)
(setq lsp-semantic-tokens-enable t)
(setq lsp-inlay-hint-enable t)
(setq lsp-inlay-hints-mode t)

(defun corfu-lsp-setup ()
  "Lsp setup for corfu completion."
  (setq-local completion-styles '(orderless)
              completion-category-defaults nil))

(add-hook 'lsp-completion-mode-hook 'corfu-lsp-setup)

;; Marginalia
(add-hook 'after-init-hook 'marginalia-mode)

;; Orderless
(setq completion-styles '(orderless basic))
(setq completion-category-overrides
      '((file (styles basic partial-completion))))

;; Rainbows
(add-hook 'prog-mode-hook 'rainbow-mode)
(add-hook 'text-mode-hook 'rainbow-mode)

;; Rainbow delimiters
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

;; Savehist
(add-hook 'after-init-hook 'savehist-mode)

;; Treemacs
(setq treemacs-expand-after-init t)
(setq treemacs-filewatch-mode t)
(setq treemacs-follow-mode t)
(setq treemacs-hide-gitignored-files-mode t)
(setq treemacs-no-png-images t)
(setq treemacs-text-scale -0.2)
(setq treemacs-user-mode-line-format 'none)
(with-eval-after-load 'treemacs
    (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

;; Yasnippets
(add-hook 'after-init-hook 'yas-global-mode)

;; Vertico
(add-hook 'after-init-hook 'vertico-mode)

;; Which key
(setq which-key-idle-delay 0.7)
(which-key-mode)

(direnv-mode)

;;; Programming Modes

;; C
(add-to-list 'auto-mode-alist '("\\.\\(c\\|h\\)\\'" . c-mode))
(add-hook 'c-mode-hook 'lsp)

;; Clojure
(require 'clojure-mode)
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)

(with-eval-after-load 'clojure-mode
  (define-key clojure-mode-map (kbd "<s-return>") 'cider-eval-last-sexp)
  (define-key clojure-mode-map (kbd "<S-s-return>") 'cider-eval-defun-at-point)
  (define-key clojure-mode-map (kbd "<C-s-return>") 'cider-eval-buffer)
  (define-key clojure-mode-map (kbd "<M-.>") 'cider-find-var))

(require 'cider)
(setq cider-repl-use-clojure-font-lock t)
(setq cider-overlays-use-font-lock t)
(setq cider-prompt-save-file-on-load 'always-save)
(setq cider-font-lock-dynamically '(macro core function var deprecated))
(setq cider-use-overlays t)
(setq cider-repl-pop-to-buffer-on-connect 'display-only)
(setq cider-repl-use-pretty-printing t)
(setq nrepl-hide-special-buffers t)
(setq nrepl-log-messages t)
(setq nrepl-use-ssh-fallback-for-remote-hosts t)

(add-hook 'cider-repl-mode-hook 'cider-mode)
(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'cider-interaction-mode-hook 'eldoc-mode)

(require 'cider-eval-sexp-fu)
(setq cider-eval-sexp-fu-flash-duration 0.2)

(require 'clj-refactor)
(add-hook 'cider-mode-hook 'clj-refactor-mode)
(with-eval-after-load 'clj-refactor
  (cljr-add-keybindings-with-prefix "C-c C-m"))

;; Docker
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; Docker Compose
(add-to-list 'auto-mode-alist '("docker-compose\\'" . docker-compose-mode))

;; Nix
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-hook 'nix-mode-hook 'lsp)

;; Rust
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook 'lsp)

;; Zig
(add-to-list 'auto-mode-alist '("\\.\\(zig\\|zon\\)\\'" . zig-mode))
(add-hook 'zig-mode-hook 'lsp)

;;;; Keys
;;; Move lines
(defun move-lines (n)
  "Move the line(s) spanned by the active region by N lines."
  (let ((beg) (end) (keep))
    (if mark-active
        (save-excursion
          (setq keep t)
          (setq beg (region-beginning)
                end (region-end))
          (goto-char beg)
          (setq beg (line-beginning-position))
          (goto-char end)
          (setq end (line-beginning-position 2)))
      (setq beg (line-beginning-position)
            end (line-beginning-position 2)))
    (let ((offset (if (and (mark t)
                           (and (>= (mark t) beg)
                                (< (mark t) end)))
                      (- (point) (mark t))))
          (rewind (- end (point))))
      (goto-char (if (< n 0) beg end))
      (forward-line n)
      (insert (delete-and-extract-region beg end))
      (backward-char rewind)
      (if offset (set-mark (- (point) offset))))
    (if keep
        (setq mark-active t
              deactivate-mark nil))))

(defun move-lines-up (n)
  "Move the line(s) spanned by the active region up by N lines."
  (interactive "*p")
  (move-lines (- (or n 1))))

(defun move-lines-down (n)
  "Move the line(s) spanned by the active region down by N lines."
  (interactive "*p")
  (move-lines (or n 1)))

(global-set-key (kbd "C-s-n") 'move-lines-down)
(global-set-key (kbd "C-s-p") 'move-lines-up)

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

;; Multiple cursors
(global-set-key (kbd "C-,") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "<s-up>") 'beginning-of-buffer)
(global-set-key (kbd "<s-down>") 'end-of-buffer)
(global-set-key (kbd "<s-right>") 'move-end-of-line)
(global-set-key (kbd "s-+") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "<M-up>") 'backward-paragraph)
(global-set-key (kbd "<M-down>") 'forward-paragraph)
(global-set-key (kbd "s-w") 'kill-this-buffer)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "S-s") 'save-buffer)
(global-set-key (kbd "s-l") 'goto-line)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
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
  (diminish 'eldoc-mode)
  (diminish 'git-gutter-mode)
  (diminish 'rainbow-mode)
  (diminish 'which-key-mode)
  (diminish 'yas-minor-mode))

(add-hook 'emacs-startup-hook 'diminish-modes)

;;; init.el ends here
