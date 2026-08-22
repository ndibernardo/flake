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
(setq-default show-trailing-whitespace t)

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
      '(("\\*\\(compilation\\|eshell\\|xref\\|vterm\\|system-shell\\|cider-repl\\)\\*"
         (display-buffer-reuse-mode-window
          display-buffer-below-selected)
         (window-height . 20))))
(setq display-line-numbers-width 3)
(setq split-height-threshold 80)
(setq temp-buffer-max-height 15)
(temp-buffer-resize-mode 1)
(setq window-divider-default-right-width 1)

(global-auto-revert-mode t)

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

;;(set-face-attribute 'default nil :font "Fira Code Retina-13")
(set-face-attribute 'default nil :font "JetBrains Mono-13")

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

(setq custom-safe-themes t)
(setq auto-dark-themes '((tomorrow-night) (photopic)))
(auto-dark-mode 1)

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
              '(line-spacing 0.20 line-height 1.20)))
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

;; Rainbow delimiters
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

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

;; Elfeed
;; Feed list lives outside the repo, see elfeed-feeds.el.
(defvar elfeed-feeds-file (expand-file-name "elfeed-feeds.el" user-emacs-directory)
  "File holding the feed list, kept outside the repository.")

(load elfeed-feeds-file 'noerror)
(setq elfeed-search-filter "@6-months-ago +unread -mastodon")

(defun elfeed-edit-feeds ()
  "Visit `elfeed-feeds-file'."
  (interactive)
  (find-file elfeed-feeds-file))

(defun elfeed-reload-feeds ()
  "Re-read `elfeed-feeds-file', then fetch every feed.
Picks up feeds added since Emacs started without a restart."
  (interactive)
  (load elfeed-feeds-file 'noerror)
  (elfeed-update))

(defun elfeed-content-title (entry)
  "Return a one-line title built from ENTRY's content, or nil.
The content is stripped of HTML tags, whitespace-collapsed and
truncated to 80 columns."
  (let* ((content (elfeed-deref (elfeed-entry-content entry)))
         (text (and content
                    (string-trim
                     (replace-regexp-in-string
                      "[ \t\n\r]+" " "
                      (replace-regexp-in-string "<[^>]+>" " " content))))))
    (when (and text (not (string-empty-p text)))
      (truncate-string-to-width text 80 nil nil "…"))))

(defun elfeed-fix-entry-title (entry)
  "Give ENTRY a title derived from its content when it has none.
Some RSS entries carry no title, only the post link; fall back to a
snippet of the body so the search list shows content instead of URLs.
`elfeed-entry-title' is a `cl-defstruct' accessor and gets inlined into
elfeed's own byte-compiled callers, so advising it has no effect there;
entry metadata (`elfeed-meta') is checked first by elfeed's title lookup
and isn't inlined, so the fallback title is set there instead."
  (when (or (null (elfeed-entry-title entry))
            (string-empty-p (elfeed-entry-title entry)))
    (when-let ((title (elfeed-content-title entry)))
      (elfeed-meta--put entry :title title))))

(add-hook 'elfeed-new-entry-hook #'elfeed-fix-entry-title)

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
Fira Code runs larger than Noto Sans at the same height, so
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
              show-trailing-whitespace nil
              visual-fill-column-center-text t)
  (visual-fill-column-mode 1)
  (prose-keep-faces-fixed-pitch))

(add-hook 'markdown-mode-hook 'prose-mode-setup)
(add-hook 'org-mode-hook 'prose-mode-setup)

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

;; Common Lisp
(require 'slime)
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy))
(add-hook 'lisp-mode-hook 'paredit-mode)

;; Docker
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; Docker Compose
(add-to-list 'auto-mode-alist '("docker-compose\\'" . docker-compose-mode))

;; Elixir
(require 'elixir-mode)
(add-to-list 'auto-mode-alist '("\\.\\(ex\\|exs\\|heex\\)\\'" . elixir-mode))
(add-hook 'elixir-mode-hook 'lsp)

;; F#
(require 'fsharp-mode)
(add-to-list 'auto-mode-alist '("\\.\\(fs\\|fsi\\|fsx\\)\\'" . fsharp-mode))
(add-hook 'fsharp-mode-hook 'lsp)

;; Go
(require 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook 'lsp)

;; Nix
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(add-hook 'nix-mode-hook 'lsp)

;; Python
(require 'lsp-pyright)
(add-hook 'python-mode-hook 'lsp)

;; Rust
(setq lsp-rust-features "all")
(setq lsp-rust-analyzer-cargo-target-dir "target/rust-analyzer")

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

;; Elfeed
(defvar elfeed-prefix-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "e") 'elfeed)
    (define-key map (kbd "f") 'elfeed-edit-feeds)
    (define-key map (kbd "u") 'elfeed-reload-feeds)
    map)
  "Keymap for elfeed commands, bound to \\`C-c e'.")

(global-set-key (kbd "C-c e") elfeed-prefix-map)
(which-key-add-key-based-replacements "C-c e" "elfeed")

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
  (diminish 'git-gutter-mode)
  (diminish 'rainbow-mode)
  (diminish 'which-key-mode)
  (diminish 'yas-minor-mode))

(add-hook 'emacs-startup-hook 'diminish-modes)

;;; init.el ends here
