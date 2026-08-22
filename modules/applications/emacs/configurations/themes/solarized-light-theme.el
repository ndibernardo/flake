;;; solarized-light-theme.el --- Light theme with the high contrast Solarized palette  -*- lexical-binding:t -*-

;;; Commentary:
;; Light theme with the high contrast Solarized palette.

;;; Code:

;;;###theme-autoload
(deftheme solarized-light
  "Light theme with the high contrast Solarized palette."
  :background-mode 'light
  :kind 'color-scheme
  :family 'solarized)

(custom-theme-set-faces
 'solarized-light

 '(default ((t (:background "#fdf6e3" :foreground "#56676d"))))
 '(cursor ((t (:background "#006eb1"))))
 '(region ((t (:background "#eee8d5" :distant-foreground "#6b7a7b" :extend t))))
 '(highlight ((t (:background "#006eb1" :foreground "#eee8d5" :distant-foreground "#79898a"))))
 '(hl-line ((t (:background "#f7f0dd" :extend t))))
 '(fringe ((t (:inherit default :foreground "#7d8b93" :background unspecified))))
 '(vertical-border ((t (:background "#e3dcc6" :foreground "#e3dcc6"))))
 '(minibuffer-prompt ((t (:foreground "#006eb1"))))
 '(isearch ((t (:inherit lazy-highlight :weight bold))))
 '(lazy-highlight ((t (:background "#72abc7" :foreground "#79898a" :distant-foreground "#eee8d5" :weight bold))))
 '(link ((t (:foreground "#006eb1" :underline t :weight bold))))
 '(link-visited ((t (:foreground "#686dbf" :underline t))))
 '(button ((t (:inherit link))))
 '(header-line ((t (:inherit mode-line))))
 '(tooltip ((t (:background "#f7f0dd" :foreground "#56676d"))))
 '(secondary-selection ((t (:background "#7d8b93" :extend t))))

 '(font-lock-builtin-face ((t (:foreground "#006eb1" :slant normal))))
 '(font-lock-comment-face ((t (:foreground "#728488" :slant normal))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-constant-face ((t (:foreground "#006eb1" :weight bold))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground "#00736b"))))
 '(font-lock-function-name-face ((t (:foreground "#006eb1"))))
 '(font-lock-keyword-face ((t (:foreground "#526900" :weight bold))))
 '(font-lock-negation-char-face ((t (:inherit bold :foreground "#d04e1a"))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#e13833"))))
 '(font-lock-string-face ((t (:foreground "#526900"))))
 '(font-lock-type-face ((t (:foreground "#7e5a00" :slant normal))))
 '(font-lock-variable-name-face ((t (:foreground unspecified))))
 '(font-lock-warning-face ((t (:inherit warning))))

 '(font-lock-operator-face ((t (:foreground "#d04e1a"))))
 '(font-lock-punctuation-face ((t (:foreground "#6b5a4f"))))
 '(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit bold :foreground "#d04e1a"))))
 '(font-lock-regexp-grouping-construct ((t (:inherit bold :foreground "#d04e1a"))))

 '(mode-line ((t (:background "#f7f0dd" :box nil))))
 '(mode-line-inactive ((t (:background "#e9e5d4" :foreground "#728488" :box nil))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:foreground "#006eb1"))))
 '(mode-line-highlight ((t (:inherit highlight :distant-foreground "#fdf6e3"))))

 '(line-number ((t (:inherit default :foreground "#7d8b93" :weight normal :slant normal :background unspecified))))
 '(line-number-current-line ((t (:inherit (hl-line default) :foreground "#56676d" :weight normal :slant normal))))

 '(show-paren-match ((t (:foreground "#e13833" :background "#eee8d5" :weight ultra-bold))))
 '(show-paren-mismatch ((t (:foreground "#eee8d5" :background "#e13833" :weight ultra-bold))))

 '(match ((t (:foreground "#526900" :background "#eee8d5" :weight bold))))
 '(query-replace ((t (:inherit isearch))))

 '(diff-added ((t (:inherit hl-line :foreground "#526900"))))
 '(diff-removed ((t (:foreground "#e13833" :background "#ede8d6"))))
 '(diff-changed ((t (:foreground "#686dbf"))))
 '(diff-header ((t (:foreground "#006c64"))))
 '(diff-file-header ((t (:foreground "#006eb1"))))

 '(compilation-error ((t (:inherit error :weight bold))))
 '(compilation-warning ((t (:inherit warning :slant normal))))
 '(compilation-info ((t (:inherit success))))
 '(compilation-line-number ((t (:foreground "#006eb1"))))

 '(org-todo ((t (:foreground "#526900" :bold inherit))))
 '(org-done ((t (:inherit org-headline-done :weight bold))))
 '(org-headline-done ((t (:foreground "#728488"))))
 '(org-date ((t (:foreground "#7e5a00"))))
 '(org-link ((t (:inherit link :foreground "#006eb1"))))
 '(org-block ((t (:background "#eee8d5" :extend t))))
 '(org-block-begin-line ((t (:inherit org-block :foreground "#728488" :background "#eee8d5"))))
 '(org-block-end-line ((t (:inherit org-block-begin-line))))
 '(org-code ((t (:inherit org-block :foreground "#d04e1a"))))
 '(org-verbatim ((t (:foreground "#526900"))))

 '(outline-1 ((t (:foreground "#006eb1" :weight bold :extend t))))
 '(outline-2 ((t (:foreground "#526900" :weight bold :extend t))))
 '(outline-3 ((t (:foreground "#00736b" :weight bold :extend t))))
 '(outline-4 ((t (:foreground "#2a75af" :weight bold :extend t))))
 '(outline-5 ((t (:foreground "#687700" :weight bold :extend t))))
 '(outline-6 ((t (:foreground "#217d75" :weight bold :extend t))))
 '(outline-7 ((t (:foreground "#afb6af" :weight bold :extend t))))
 '(outline-8 ((t (:foreground "#a5aea9" :weight bold :extend t))))

 '(dired-directory ((t (:foreground "#006eb1"))))
 '(dired-symlink ((t (:foreground "#006c64" :weight bold))))
 '(dired-header ((t (:foreground "#006eb1" :weight bold))))

 '(eshell-prompt ((t (:foreground "#006eb1" :weight bold))))
 '(eshell-ls-directory ((t (:foreground "#006eb1"))))
 '(eshell-ls-executable ((t (:foreground "#526900"))))
 '(eshell-ls-symlink ((t (:foreground "#006c64"))))

 '(company-tooltip ((t (:inherit tooltip))))
 '(company-tooltip-selection ((t (:background "#e2e8d6"))))
 '(company-tooltip-common ((t (:foreground "#006eb1" :distant-foreground "#eee8d5" :weight bold))))
 '(company-scrollbar-fg ((t (:background "#006eb1"))))
 '(company-scrollbar-bg ((t (:inherit tooltip))))

 '(corfu-default ((t (:inherit tooltip))))
 '(corfu-current ((t (:background "#fdf6e3" :foreground "#56676d"))))
 '(corfu-bar ((t (:background "#728488"))))
 '(corfu-border ((t (:background "#7d8b93"))))
 '(corfu-annotations ((t (:foreground "#728488"))))
 '(corfu-deprecated ((t (:foreground "#728488" :strike-through t))))
 '(corfu-echo ((t (:foreground "#728488"))))
 '(corfu-popupinfo ((t (:background "#f7f0dd" :foreground "#56676d"))))

 '(flycheck-error ((t (:underline (:style wave :color "#e13833")))))
 '(flycheck-warning ((t (:underline (:style wave :color "#7e5a00")))))
 '(flycheck-info ((t (:underline (:style wave :color "#526900")))))

 '(git-gutter:added ((t (:inherit fringe :foreground "#00842c"))))
 '(git-gutter:deleted ((t (:inherit fringe :foreground "#e13833"))))
 '(git-gutter:modified ((t (:inherit fringe :foreground "#006eb1"))))

 '(magit-branch-current ((t (:foreground "#006eb1"))))
 '(magit-branch-local ((t (:foreground "#006c64"))))
 '(magit-branch-remote ((t (:foreground "#526900"))))
 '(magit-branch-upstream ((t (:foreground "#526900"))))
 '(magit-tag ((t (:foreground "#7e5a00"))))
 '(magit-hash ((t (:foreground "#728488"))))
 '(magit-section-heading ((t (:foreground "#006eb1" :weight bold :extend t))))
 '(magit-section-highlight ((t (:inherit hl-line))))
 '(magit-section-heading-selection ((t (:foreground "#d04e1a" :weight bold :extend t))))
 '(magit-diff-file-heading ((t (:foreground "#56676d" :weight bold :extend t))))
 '(magit-diff-file-heading-highlight ((t (:background "#ede8d6" :foreground "#56676d"))))
 '(magit-diff-hunk-heading ((t (:foreground "#fdf6e3" :background "#d5d2d9" :extend t))))
 '(magit-diff-hunk-heading-highlight ((t (:foreground "#fdf6e3" :background "#686dbf" :weight bold :extend t))))
 '(magit-diff-context ((t (:foreground "#7f8a8b" :background "#fdf6e3" :extend t))))
 '(magit-diff-context-highlight ((t (:foreground "#56676d" :background "#f7f0dd" :extend t))))
 '(magit-diff-added ((t (:foreground "#138138" :background "#e8edd4" :extend t))))
 '(magit-diff-added-highlight ((t (:foreground "#00842c" :background "#d1e2c3" :weight bold :extend t))))
 '(magit-diff-removed ((t (:foreground "#97a3a1" :background "#dcd5c3" :extend t))))
 '(magit-diff-removed-highlight ((t (:foreground "#e13833" :background "#d6cfbd" :weight bold :extend t))))
 '(magit-diffstat-added ((t (:foreground "#00842c"))))
 '(magit-diffstat-removed ((t (:foreground "#e13833"))))
 '(magit-log-author ((t (:foreground "#d04e1a"))))
 '(magit-log-date ((t (:foreground "#006eb1"))))
 '(magit-log-graph ((t (:foreground "#728488"))))
 '(magit-process-ok ((t (:inherit success))))
 '(magit-process-ng ((t (:inherit error))))

 '(vertico-current ((t (:background "#eee8d5" :extend t))))
 '(vertico-group-title ((t (:foreground "#728488" :weight bold))))
 '(vertico-group-separator ((t (:foreground "#7d8b93" :strike-through t))))
 '(vertico-multiline ((t (:foreground "#728488"))))
 '(vertico-quick1 ((t (:background "#f7f0dd" :foreground "#006eb1" :weight bold))))
 '(vertico-quick2 ((t (:background "#f7f0dd" :foreground "#526900" :weight bold))))

 '(orderless-match-face-0 ((t (:weight bold :foreground "#3377a1" :background "#e7eadf"))))
 '(orderless-match-face-1 ((t (:weight bold :foreground "#a85380" :background "#f9e5db"))))
 '(orderless-match-face-2 ((t (:weight bold :foreground "#5f7221" :background "#eeead0"))))
 '(orderless-match-face-3 ((t (:weight bold :foreground "#7c6b22" :background "#f2e8cf"))))

 '(marginalia-documentation ((t (:inherit font-lock-doc-face))))
 '(marginalia-key ((t (:foreground "#526900"))))
 '(marginalia-type ((t (:foreground "#686dbf"))))
 '(marginalia-char ((t (:foreground "#006eb1"))))
 '(marginalia-lighter ((t (:foreground "#686dbf"))))
 '(marginalia-on ((t (:foreground "#526900"))))
 '(marginalia-off ((t (:foreground "#e13833"))))

 '(consult-file ((t (:foreground "#56676d"))))
 '(consult-bookmark ((t (:foreground "#006eb1"))))
 '(consult-async-running ((t (:foreground "#006eb1"))))
 '(consult-async-finished ((t (:foreground "#526900"))))
 '(consult-async-failed ((t (:foreground "#e13833"))))
 '(consult-preview-line ((t (:background "#ede8d6"))))
 '(consult-preview-match ((t (:background "#29779b"))))

 '(ivy-current-match ((t (:background "#eee8d5" :extend t))))
 '(ivy-minibuffer-match-face-1 ((t (:foreground "#6e7f88" :weight light))))
 '(helm-selection ((t (:inherit bold :background "#29779b" :distant-foreground "#fdf6e3" :extend t))))
 '(helm-match ((t (:inherit bold :foreground "#006eb1" :distant-foreground "#79898a"))))

 '(term-color-black ((t (:background "#eee8d5" :foreground "#eee8d5"))))
 '(term-color-red ((t (:background "#e13833" :foreground "#e13833"))))
 '(term-color-green ((t (:background "#526900" :foreground "#526900"))))
 '(term-color-yellow ((t (:background "#7e5a00" :foreground "#7e5a00"))))
 '(term-color-blue ((t (:background "#006eb1" :foreground "#006eb1"))))
 '(term-color-magenta ((t (:background "#d53884" :foreground "#d53884"))))
 '(term-color-cyan ((t (:background "#006c64" :foreground "#006c64"))))
 '(term-color-white ((t (:background "#79898a" :foreground "#79898a"))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#006eb1"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#7e5a00"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#d04e1a"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#526900"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#006c64"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#686dbf"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#d53884"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#526900"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#686dbf"))))

 '(lsp-face-highlight-textual ((t (:weight bold :background "#ede8d6" :foreground "#eee8d5" :distant-foreground "#79898a"))))
 '(lsp-face-highlight-read ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-face-highlight-write ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-ui-doc-background ((t (:inherit tooltip))))
 '(lsp-ui-peek-selection ((t (:foreground "#fdf6e3" :background "#006eb1" :bold t))))
 '(lsp-ui-sideline-code-action ((t (:foreground "#1176b3"))))

 '(which-key-key-face ((t (:foreground "#526900"))))
 '(which-key-command-description-face ((t (:foreground "#006eb1"))))

 '(web-mode-html-tag-face ((t (:foreground "#006c64"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#7e5a00"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#526900"))))
 '(web-mode-css-property-name-face ((t (:foreground "#7e5a00"))))

 '(js2-function-param ((t (:foreground "#56676d"))))
 '(js2-function-call ((t (:foreground "#006eb1"))))
 '(js2-object-property ((t (:foreground "#686dbf"))))
 '(js2-jsdoc-tag ((t (:foreground "#00736b"))))
 '(js2-external-variable ((t (:foreground "#d04e1a"))))

 '(markdown-bold-face ((t (:inherit bold :foreground "#56676d"))))
 '(markdown-italic-face ((t (:inherit italic :foreground "#748689"))))
 '(markdown-link-face ((t (:foreground "#006eb1"))))
 '(markdown-url-face ((t (:foreground "#00736b" :weight normal))))
 '(markdown-code-face ((t (:background "#ede8d6" :extend t))))
 '(markdown-blockquote-face ((t (:inherit italic :foreground "#00736b"))))

 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))
 '(treemacs-directory-face ((t (:foreground "#56676d"))))
 '(treemacs-file-face ((t (:foreground "#56676d"))))
 '(treemacs-tags-face ((t (:foreground "#006eb1"))))
 '(treemacs-fringe-indicator-face ((t (:foreground "#006eb1"))))
 '(treemacs-git-added-face ((t (:foreground "#00842c"))))
 '(treemacs-git-modified-face ((t (:foreground "#7e5a00"))))
 '(treemacs-git-conflict-face ((t (:foreground "#e13833"))))
 '(treemacs-git-untracked-face ((t (:foreground "#00842c"))))
 '(treemacs-git-renamed-face ((t (:foreground "#7e5a00"))))
 '(treemacs-git-ignored-face ((t (:foreground "#728488"))))
 '(treemacs-on-success-pulse-face ((t (:foreground "#eee8d5" :background "#526900" :extend t))))
 '(treemacs-on-failure-pulse-face ((t (:foreground "#eee8d5" :background "#e13833" :extend t))))

 '(window-divider ((t (:inherit vertical-border))))
 '(window-divider-first-pixel ((t (:inherit window-divider))))
 '(window-divider-last-pixel ((t (:inherit window-divider))))

 '(error ((t (:foreground "#e13833"))))
 '(warning ((t (:foreground "#7e5a00"))))
 '(success ((t (:foreground "#526900"))))

 ;; Man
 '(Man-overstrike ((t (:inherit bold :foreground "#d04e1a"))))
 '(Man-underline ((t (:inherit underline :foreground "#526900"))))

 ;; ansi
 '(ansi-color-black ((t (:foreground "#fdf6e3" :background "#fdf6e3"))))
 '(ansi-color-blue ((t (:foreground "#006eb1" :background "#006eb1"))))
 '(ansi-color-bright-black ((t (:foreground "#7d8b93" :background "#7d8b93"))))
 '(ansi-color-bright-blue ((t (:foreground "#006ca4" :background "#006ca4"))))
 '(ansi-color-bright-cyan ((t (:foreground "#006a63" :background "#006a63"))))
 '(ansi-color-bright-green ((t (:foreground "#516500" :background "#516500"))))
 '(ansi-color-bright-magenta ((t (:foreground "#c13d7e" :background "#c13d7e"))))
 '(ansi-color-bright-red ((t (:foreground "#c93d3b" :background "#c93d3b"))))
 '(ansi-color-bright-white ((t (:foreground "#79898a" :background "#79898a"))))
 '(ansi-color-bright-yellow ((t (:foreground "#775a00" :background "#775a00"))))
 '(ansi-color-cyan ((t (:foreground "#006c64" :background "#006c64"))))
 '(ansi-color-green ((t (:foreground "#526900" :background "#526900"))))
 '(ansi-color-magenta ((t (:foreground "#d53884" :background "#d53884"))))
 '(ansi-color-red ((t (:foreground "#e13833" :background "#e13833"))))
 '(ansi-color-white ((t (:foreground "#56676d" :background "#56676d"))))
 '(ansi-color-yellow ((t (:foreground "#7e5a00" :background "#7e5a00"))))

 ;; avy
 '(avy-background-face ((t (:foreground "#728488"))))
 '(avy-lead-face ((t (:background "#006eb1" :foreground "#fdf6e3" :distant-foreground "#56676d" :weight bold))))
 '(avy-lead-face-0 ((t (:inherit avy-lead-face :background "#005f8c"))))
 '(avy-lead-face-1 ((t (:inherit avy-lead-face :background "#88b7cc"))))
 '(avy-lead-face-2 ((t (:inherit avy-lead-face :background "#dfe6dd"))))

 ;; bold
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:inherit (bold italic)))))

 ;; bookmark
 '(bookmark-face ((t (:background "#e7eadf" :extend t))))

 ;; cider
 '(cider-debug-code-overlay-face ((t (:background "#ede8d6"))))
 '(cider-deprecated-face ((t (:background "#e6daba"))))
 '(cider-enlightened-face ((t (:inherit cider-result-overlay-face :box (:color "#d04e1a" :line-width -1)))))
 '(cider-enlightened-local-face ((t (:foreground "#d04e1a" :weight bold))))
 '(cider-error-highlight-face ((t (:underline (:style wave :color "#e13833")))))
 '(cider-fringe-good-face ((t (:foreground "#526900"))))
 '(cider-instrumented-face ((t (:background "#dfd8c6"))))
 '(cider-result-overlay-face ((t (:background "#ede8d6" :box (:line-width -1 :color "#728488")))))
 '(cider-test-error-face ((t (:background "#d04e1a"))))
 '(cider-test-failure-face ((t (:background "#f6c3b4"))))
 '(cider-test-success-face ((t (:foreground "#eee8d5" :background "#526900"))))
 '(cider-traced-face ((t (:background "#ccddcc"))))
 '(cider-warning-highlight-face ((t (:underline (:style wave :color "#7e5a00")))))

 ;; compilation
 '(compilation-column-number ((t (:inherit font-lock-comment-face))))
 '(compilation-mode-line-exit ((t (:inherit compilation-info))))
 '(compilation-mode-line-fail ((t (:inherit compilation-error))))

 ;; custom
 '(custom-button ((t (:foreground "#006eb1" :background "#fdf6e3" :box (:line-width 1 :style nil)))))
 '(custom-button-mouse ((t (:foreground "#fdf6e3" :background "#006eb1" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed ((t (:foreground "#fdf6e3" :background "#006eb1" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed-unraised ((t (:foreground "#fdf6e3" :background "#686dbf" :box (:line-width 1 :style nil)))))
 '(custom-button-unraised ((t (:foreground "#686dbf" :background "#fdf6e3" :box (:line-width 1 :style nil)))))
 '(custom-changed ((t (:foreground "#006eb1" :background "#fdf6e3"))))
 '(custom-comment ((t (:foreground "#56676d" :background "#eee8d5"))))
 '(custom-comment-tag ((t (:foreground "#7d8b93"))))
 '(custom-group-subtitle ((t (:foreground "#e13833"))))
 '(custom-group-tag ((t (:foreground "#686dbf"))))
 '(custom-group-tag-1 ((t (:foreground "#006eb1"))))
 '(custom-invalid ((t (:foreground "#e13833" :background "#dfd8c6"))))
 '(custom-modified ((t (:foreground "#006eb1" :background "#d0deda"))))
 '(custom-saved ((t (:foreground "#526900" :background "#dfddbb" :bold t))))
 '(custom-set ((t (:foreground "#7e5a00" :background "#fdf6e3"))))
 '(custom-state ((t (:foreground "#526900" :background "#dfddbb"))))
 '(custom-themed ((t (:foreground "#7e5a00" :background "#fdf6e3"))))
 '(custom-variable-button ((t (:foreground "#526900" :underline t))))
 '(custom-variable-obsolete ((t (:foreground "#7d8b93" :background "#fdf6e3"))))
 '(custom-variable-tag ((t (:foreground "#d53884"))))
 '(custom-visibility ((t (:foreground "#006eb1"))))

 ;; diff
 '(diff-context ((t (:foreground "#65767a"))))
 '(diff-hl-change ((t (:foreground "#006eb1" :background "#006eb1"))))
 '(diff-hl-delete ((t (:foreground "#e13833" :background "#e13833"))))
 '(diff-hl-insert ((t (:foreground "#00842c" :background "#00842c"))))
 '(diff-hunk-header ((t (:foreground "#686dbf"))))
 '(diff-indicator-added ((t (:foreground "#00842c"))))
 '(diff-indicator-changed ((t (:foreground "#006eb1"))))
 '(diff-indicator-removed ((t (:foreground "#e13833"))))
 '(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
 '(diff-refine-changed ((t (:inherit diff-changed :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-removed :inverse-video t))))

 ;; dired
 '(dired-flagged ((t (:foreground "#e13833"))))
 '(dired-ignored ((t (:foreground "#728488"))))
 '(dired-k-added ((t (:foreground "#00842c" :weight bold))))
 '(dired-k-commited ((t (:foreground "#526900" :weight bold))))
 '(dired-k-directory ((t (:foreground "#006eb1" :weight bold))))
 '(dired-k-ignored ((t (:foreground "#728488" :weight bold))))
 '(dired-k-modified ((t (:foreground "#006eb1" :weight bold))))
 '(dired-k-untracked ((t (:foreground "#00736b" :weight bold))))
 '(dired-mark ((t (:foreground "#d04e1a" :weight bold))))
 '(dired-marked ((t (:foreground "#d53884" :weight bold :inverse-video t))))
 '(dired-perm-write ((t (:foreground "#56676d" :underline t))))
 '(dired-subtree-depth-1-face ((t (:background "#e2dfd0"))))
 '(dired-subtree-depth-2-face ((t (:background "#e0dece"))))
 '(dired-subtree-depth-3-face ((t (:background "#e0ddce"))))
 '(dired-subtree-depth-4-face ((t (:background "#dedccd"))))
 '(dired-subtree-depth-5-face ((t (:background "#dbdacb"))))
 '(dired-subtree-depth-6-face ((t (:background "#dbdacb"))))
 '(dired-warning ((t (:foreground "#7e5a00"))))

 ;; ediff
 '(ediff-current-diff-A ((t (:foreground "#e13833" :background "#d6cfbd" :extend t))))
 '(ediff-current-diff-B ((t (:foreground "#00842c" :background "#d1e2c3" :extend t))))
 '(ediff-current-diff-C ((t (:inherit ediff-current-diff-A))))
 '(ediff-even-diff-A ((t (:inherit hl-line))))
 '(ediff-even-diff-B ((t (:inherit ediff-even-diff-A))))
 '(ediff-even-diff-C ((t (:inherit ediff-even-diff-A))))
 '(ediff-fine-diff-A ((t (:inherit diff-refine-removed))))
 '(ediff-fine-diff-B ((t (:inherit diff-refine-added))))
 '(ediff-fine-diff-C ((t (:inherit ediff-fine-diff-A))))
 '(ediff-odd-diff-A ((t (:inherit ediff-even-diff-A))))
 '(ediff-odd-diff-B ((t (:inherit ediff-odd-diff-A))))
 '(ediff-odd-diff-C ((t (:inherit ediff-odd-diff-A))))

 ;; elfeed
 '(elfeed-log-debug-level-face ((t (:foreground "#728488"))))
 '(elfeed-log-error-level-face ((t (:inherit error))))
 '(elfeed-log-info-level-face ((t (:inherit success))))
 '(elfeed-log-warn-level-face ((t (:inherit warning))))
 '(elfeed-search-date-face ((t (:foreground "#686dbf"))))
 '(elfeed-search-feed-face ((t (:foreground "#006eb1"))))
 '(elfeed-search-filter-face ((t (:foreground "#686dbf"))))
 '(elfeed-search-tag-face ((t (:foreground "#728488"))))
 '(elfeed-search-title-face ((t (:foreground "#728488"))))
 '(elfeed-search-unread-count-face ((t (:foreground "#7e5a00"))))
 '(elfeed-search-unread-title-face ((t (:foreground "#56676d" :weight bold))))

 ;; elixir
 '(elixir-atom-face ((t (:foreground "#29779b"))))
 '(elixir-attribute-face ((t (:foreground "#686dbf"))))

 ;; escape
 '(escape-glyph ((t (:foreground "#006c64"))))

 ;; eshell
 '(eshell-git-prompt-powerline-clean-face ((t (:background "foreset green" :foreground "#fdf6e3"))))
 '(eshell-git-prompt-powerline-dir-face ((t (:background "steel blue" :foreground "#fdf6e3"))))
 '(eshell-git-prompt-powerline-not-clean-face ((t (:background "indian red" :foreground "#fdf6e3"))))
 '(eshell-ls-archive ((t (:foreground "#d53884"))))
 '(eshell-ls-backup ((t (:foreground "#7e5a00"))))
 '(eshell-ls-clutter ((t (:foreground "#e13833"))))
 '(eshell-ls-missing ((t (:foreground "#e13833"))))
 '(eshell-ls-product ((t (:foreground "#d04e1a"))))
 '(eshell-ls-readonly ((t (:foreground "#d04e1a"))))
 '(eshell-ls-special ((t (:foreground "#686dbf"))))
 '(eshell-ls-unreadable ((t (:foreground "#728488"))))

 ;; flycheck
 '(flycheck-fringe-error ((t (:inherit fringe :foreground "#e13833"))))
 '(flycheck-fringe-info ((t (:inherit fringe :foreground "#526900"))))
 '(flycheck-fringe-warning ((t (:inherit fringe :foreground "#7e5a00"))))
 '(flycheck-posframe-background-face ((t (:background "#f7f0dd"))))
 '(flycheck-posframe-error-face ((t (:inherit flycheck-posframe-face :foreground "#e13833"))))
 '(flycheck-posframe-face ((t (:inherit default))))
 '(flycheck-posframe-info-face ((t (:inherit flycheck-posframe-face :foreground "#526900"))))
 '(flycheck-posframe-warning-face ((t (:inherit flycheck-posframe-face :foreground "#7e5a00"))))

 ;; flymake
 '(flymake-error ((t (:underline (:style wave :color "#e13833")))))
 '(flymake-note ((t (:underline (:style wave :color "#526900")))))
 '(flymake-warning ((t (:underline (:style wave :color "#d04e1a")))))

 ;; font
 '(font-latex-bold-face ((t (:inherit bold))))
 '(font-latex-italic-face ((t (:inherit italic))))
 '(font-latex-math-face ((t (:foreground "#006eb1"))))
 '(font-latex-script-char-face ((t (:foreground "#29779b"))))
 '(font-latex-sectioning-0-face ((t (:foreground "#006eb1" :weight ultra-bold))))
 '(font-latex-sectioning-1-face ((t (:foreground "#d53884" :weight semi-bold))))
 '(font-latex-sectioning-2-face ((t (:foreground "#686dbf" :weight semi-bold))))
 '(font-latex-sectioning-3-face ((t (:foreground "#005f8c" :weight semi-bold))))
 '(font-latex-sectioning-4-face ((t (:foreground "#a84074" :weight semi-bold))))
 '(font-latex-sectioning-5-face ((t (:foreground "#555b90" :weight semi-bold))))
 '(font-latex-sedate-face ((t (:inherit font-lock-keyword-face))))
 '(font-latex-string-face ((t (:inherit font-lock-string-face))))
 '(font-latex-underline-face ((t (:inherit underline))))
 '(font-latex-verbatim-face ((t (:inherit fixed-pitch :foreground "#686dbf" :slant normal))))
 '(font-latex-warning-face ((t (:inherit font-lock-warning-face))))
 '(font-lock-escape-face ((t (:inherit font-lock-regexp-grouping-backslash))))
 '(font-lock-function-call-face ((t (:inherit font-lock-function-name-face :slant normal :foreground "#2777a8"))))
 '(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-number-face ((t (:foreground "#686dbf"))))
 '(font-lock-preprocessor-char-face ((t (:inherit bold :foreground "#d04e1a"))))
 '(font-lock-property-name-face ((t (:foreground "#5f7221" :weight bold))))
 '(font-lock-property-use-face ((t (:inherit font-lock-property-name-face :weight regular))))
 '(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face :foreground unspecified))))

 ;; git
 '(git-commit-comment-branch-local ((t (:foreground "#d53884"))))
 '(git-commit-comment-branch-remote ((t (:foreground "#526900"))))
 '(git-commit-comment-detached ((t (:foreground "#d04e1a"))))
 '(git-commit-comment-file ((t (:foreground "#686dbf"))))
 '(git-commit-comment-heading ((t (:foreground "#526900"))))
 '(git-commit-keyword ((t (:foreground "#006c64" :slant normal))))
 '(git-commit-known-pseudo-header ((t (:foreground "#00736b" :weight bold :slant normal))))
 '(git-commit-nonempty-second-line ((t (:inherit git-commit-overlong-summary))))
 '(git-commit-overlong-summary ((t (:inherit error :background "#eee8d5" :slant normal :weight bold))))
 '(git-commit-pseudo-header ((t (:foreground "#00736b" :slant normal))))
 '(git-commit-summary ((t (:foreground "#526900"))))
 '(git-gutter+-added ((t (:inherit fringe :foreground "#00842c"))))
 '(git-gutter+-deleted ((t (:inherit fringe :foreground "#e13833"))))
 '(git-gutter+-modified ((t (:inherit fringe :foreground "#006eb1"))))
 '(git-gutter-fr:added ((t (:inherit fringe :foreground "#00842c"))))
 '(git-gutter-fr:deleted ((t (:inherit fringe :foreground "#e13833"))))
 '(git-gutter-fr:modified ((t (:foreground "#006eb1"))))

 ;; header
 '(header-line-highlight ((t (:inherit mode-line-highlight))))

 ;; hi
 '(hi-blue ((t (:background "#006eb1"))))
 '(hi-blue-b ((t (:foreground "#006eb1" :weight bold))))
 '(hi-green ((t (:background "#526900"))))
 '(hi-green-b ((t (:foreground "#526900" :weight bold))))
 '(hi-pink ((t (:background "#d53884"))))
 '(hi-red-b ((t (:foreground "#e13833" :weight bold))))
 '(hi-yellow ((t (:background "#7e5a00"))))

 ;; highlight
 '(highlight-indentation-current-column-face ((t (:background "#f5eedb"))))
 '(highlight-indentation-face ((t (:inherit hl-line))))
 '(highlight-indentation-guides-even-face ((t (:inherit highlight-indentation-face))))
 '(highlight-indentation-guides-odd-face ((t (:inherit highlight-indentation-face))))
 '(highlight-numbers-number ((t (:inherit bold :foreground "#686dbf"))))
 '(highlight-quoted-quote ((t (:foreground "#d04e1a"))))
 '(highlight-quoted-symbol ((t (:foreground "#7e5a00"))))
 '(highlight-symbol-face ((t (:background "#d5d4c7" :distant-foreground "#748689"))))
 '(highlight-thing ((t (:background "#d5d4c7" :distant-foreground "#748689"))))

 ;; hl
 '(hl-fill-column-face ((t (:inherit (hl-line shadow)))))
 '(hl-todo ((t (:foreground "#e13833" :weight bold))))

 ;; imenu
 '(imenu-list-entry-face-0 ((t (:foreground "#006eb1"))))
 '(imenu-list-entry-face-1 ((t (:foreground "#526900"))))
 '(imenu-list-entry-face-2 ((t (:foreground "#7e5a00"))))
 '(imenu-list-entry-subalist-face-0 ((t (:inherit imenu-list-entry-face-0 :weight bold))))
 '(imenu-list-entry-subalist-face-1 ((t (:inherit imenu-list-entry-face-1 :weight bold))))
 '(imenu-list-entry-subalist-face-2 ((t (:inherit imenu-list-entry-face-2 :weight bold))))

 ;; indent
 '(indent-guide-face ((t (:inherit hl-line))))

 ;; isearch
 '(isearch-fail ((t (:background "#e13833" :foreground "#eee8d5" :weight bold))))

 ;; italic
 '(italic ((t (:slant normal))))

 ;; lsp
 '(lsp-headerline-breadcrumb-separator-face ((t (:inherit shadow))))
 '(lsp-ui-peek-filename ((t (:inherit mode-line-buffer-id))))
 '(lsp-ui-peek-header ((t (:foreground "#56676d" :background "#e4e1d1" :bold t))))
 '(lsp-ui-peek-highlight ((t (:inherit isearch :box t))))
 '(lsp-ui-peek-line-number ((t (:foreground "#526900"))))
 '(lsp-ui-peek-list ((t (:background "#e9e5d4"))))
 '(lsp-ui-peek-peek ((t (:background "#e9e5d4"))))
 '(lsp-ui-sideline-current-symbol ((t (:inherit highlight))))
 '(lsp-ui-sideline-symbol-info ((t (:foreground "#77878c" :background "#f7f0dd" :extend t))))

 ;; magit
 '(magit-bisect-bad ((t (:foreground "#e13833"))))
 '(magit-bisect-good ((t (:foreground "#526900"))))
 '(magit-bisect-skip ((t (:foreground "#d04e1a"))))
 '(magit-blame-date ((t (:foreground "#e13833"))))
 '(magit-blame-hash ((t (:foreground "#006c64"))))
 '(magit-blame-heading ((t (:foreground "#d04e1a" :background "#ede8d6" :extend t))))
 '(magit-cherry-equivalent ((t (:foreground "#686dbf"))))
 '(magit-cherry-unmatched ((t (:foreground "#006c64"))))
 '(magit-diff-base ((t (:foreground "#96a2a0" :background "#f9e8d2" :extend t))))
 '(magit-diff-base-highlight ((t (:foreground "#d04e1a" :background "#e0d9c7" :weight bold :extend t))))
 '(magit-diff-file-heading-selection ((t (:foreground "#d53884" :background "#29779b" :weight bold :extend t))))
 '(magit-diff-lines-heading ((t (:foreground "#7e5a00" :background "#e13833" :extend t :extend t))))
 '(magit-dimmed ((t (:foreground "#748689"))))
 '(magit-filename ((t (:foreground "#686dbf"))))
 '(magit-header-line ((t (:background "#29779b" :foreground "#79898a" :weight bold :box (:line-width 3 :color "#29779b")))))
 '(magit-reflog-amend ((t (:foreground "#d53884"))))
 '(magit-reflog-checkout ((t (:foreground "#006eb1"))))
 '(magit-reflog-cherry-pick ((t (:foreground "#526900"))))
 '(magit-reflog-commit ((t (:foreground "#526900"))))
 '(magit-reflog-merge ((t (:foreground "#526900"))))
 '(magit-reflog-other ((t (:foreground "#006c64"))))
 '(magit-reflog-rebase ((t (:foreground "#d53884"))))
 '(magit-reflog-remote ((t (:foreground "#006c64"))))
 '(magit-reflog-reset ((t (:inherit error))))
 '(magit-refname ((t (:foreground "#728488"))))
 '(magit-section-secondary-heading ((t (:foreground "#686dbf" :weight bold :extend t))))
 '(magit-sequence-drop ((t (:foreground "#e13833"))))
 '(magit-sequence-head ((t (:foreground "#006eb1"))))
 '(magit-sequence-part ((t (:foreground "#d04e1a"))))
 '(magit-sequence-stop ((t (:foreground "#526900"))))
 '(magit-signature-bad ((t (:inherit error))))
 '(magit-signature-error ((t (:inherit error))))
 '(magit-signature-expired ((t (:foreground "#d04e1a"))))
 '(magit-signature-good ((t (:inherit success))))
 '(magit-signature-revoked ((t (:foreground "#d53884"))))
 '(magit-signature-untrusted ((t (:foreground "#7e5a00"))))

 ;; makefile
 '(makefile-targets ((t (:foreground "#006eb1"))))

 ;; marginalia
 '(marginalia-file-priv-dir ((t (:foreground "#006eb1"))))
 '(marginalia-file-priv-exec ((t (:foreground "#526900"))))
 '(marginalia-file-priv-link ((t (:foreground "#686dbf"))))
 '(marginalia-file-priv-other ((t (:foreground "#d53884"))))
 '(marginalia-file-priv-rare ((t (:foreground "#56676d"))))
 '(marginalia-file-priv-read ((t (:foreground "#7e5a00"))))
 '(marginalia-file-priv-write ((t (:foreground "#e13833"))))
 '(marginalia-number ((t (:foreground "#686dbf"))))
 '(marginalia-size ((t (:foreground "#686dbf"))))

 ;; markdown
 '(markdown-header-delimiter-face ((t (:inherit markdown-header-face))))
 '(markdown-header-face ((t (:inherit bold :foreground "#686dbf"))))
 '(markdown-html-attr-name-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-attr-value-face ((t (:inherit font-lock-string-face))))
 '(markdown-html-entity-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-tag-delimiter-face ((t (:inherit markdown-markup-face))))
 '(markdown-html-tag-name-face ((t (:inherit font-lock-keyword-face))))
 '(markdown-inline-code-face ((t (:inherit (markdown-code-face markdown-pre-face)))))
 '(markdown-list-face ((t (:foreground "#e13833"))))
 '(markdown-markup-face ((t (:foreground "#728488"))))
 '(markdown-metadata-key-face ((t (:foreground "#e13833"))))
 '(markdown-pre-face ((t (:foreground "#526900"))))
 '(markdown-reference-face ((t (:foreground "#4d5f65"))))

 ;; mc/cursor
 '(mc/cursor-face ((t (:inherit cursor))))

 ;; message
 '(message-cited-text ((t (:foreground "#686dbf"))))
 '(message-cited-text-1 ((t (:foreground "#7e5a00"))))
 '(message-cited-text-2 ((t (:foreground "#d53884"))))
 '(message-cited-text-3 ((t (:foreground "#526900"))))
 '(message-cited-text-4 ((t (:foreground "#526900"))))
 '(message-header-cc ((t (:inherit message-header-to :foreground "#1f76b2"))))
 '(message-header-name ((t (:foreground "#526900"))))
 '(message-header-newsgroups ((t (:foreground "#7e5a00"))))
 '(message-header-other ((t (:foreground "#686dbf"))))
 '(message-header-subject ((t (:foreground "#006eb1" :weight bold))))
 '(message-header-to ((t (:foreground "#006eb1" :weight bold))))
 '(message-header-xheader ((t (:foreground "#00736b"))))
 '(message-mml ((t (:foreground "#728488" :slant normal))))
 '(message-separator ((t (:foreground "#728488"))))

 ;; mode
 '(mode-line-active ((t (:inherit mode-line))))

 ;; nobreak
 '(nobreak-space ((t (:inherit escape-glyph :underline t))))

 ;; org
 '(org-agenda-clocking ((t (:background "#d0deda"))))
 '(org-agenda-date ((t (:foreground "#686dbf" :weight ultra-bold))))
 '(org-agenda-date-today ((t (:foreground "#4d517d" :weight ultra-bold))))
 '(org-agenda-date-weekend ((t (:foreground "#bbc0b7" :weight ultra-bold))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "#728488"))))
 '(org-agenda-done ((t (:inherit org-done))))
 '(org-agenda-structure ((t (:foreground "#56676d" :weight ultra-bold))))
 '(org-archived ((t (:foreground "#00736b"))))
 '(org-block-background ((t (:background "#ede8d6" :extend t))))
 '(org-checkbox ((t (:inherit org-todo))))
 '(org-checkbox-statistics-done ((t (:inherit org-done))))
 '(org-checkbox-statistics-todo ((t (:inherit org-todo))))
 '(org-cite ((t (:foreground "#007f77"))))
 '(org-cite-key ((t (:foreground "#2e7b77" :underline t))))
 '(org-default ((t (:inherit variable-pitch))))
 '(org-document-info ((t (:foreground "#006eb1"))))
 '(org-document-title ((t (:foreground "#006eb1" :weight bold))))
 '(org-drawer ((t (:foreground "#728488"))))
 '(org-ellipsis ((t (:foreground "#728488"))))
 '(org-footnote ((t (:foreground "#d04e1a"))))
 '(org-formula ((t (:foreground "#006c64"))))
 '(org-habit-alert-face ((t (:weight bold :background "#c5b17e"))))
 '(org-habit-alert-future-face ((t (:weight bold :background "#d5d4c7"))))
 '(org-habit-clear-face ((t (:weight bold :background "#7d8b93"))))
 '(org-habit-clear-future-face ((t (:weight bold :background "#ede8d6"))))
 '(org-habit-overdue-face ((t (:weight bold :background "#f0a194"))))
 '(org-habit-overdue-future-face ((t (:weight bold :background "#eee9d7"))))
 '(org-habit-ready-face ((t (:weight bold :background "#90bcce"))))
 '(org-habit-ready-future-face ((t (:weight bold :background "#c0d5d7"))))
 '(org-hide ((t (:foreground "#fdf6e3"))))
 '(org-journal-calendar-entry-face ((t (:foreground "#d53884" :slant normal))))
 '(org-journal-calendar-scheduled-face ((t (:foreground "#e13833" :slant normal))))
 '(org-journal-highlight ((t (:foreground "#006eb1"))))
 '(org-latex-and-related ((t (:foreground "#79898a" :weight bold))))
 '(org-list-dt ((t (:foreground "#006eb1"))))
 '(org-meta-line ((t (:foreground "#00736b"))))
 '(org-pomodoro-mode-line ((t (:foreground "#e13833"))))
 '(org-pomodoro-mode-line-overtime ((t (:foreground "#7e5a00" :weight bold))))
 '(org-priority ((t (:foreground "#e13833"))))
 '(org-property-value ((t (:foreground "#00736b"))))
 '(org-quote ((t (:inherit org-block :slant normal))))
 '(org-ref-acronym-face ((t (:foreground "#686dbf"))))
 '(org-ref-cite-face ((t (:foreground "#7e5a00" :weight light :underline t))))
 '(org-ref-glossary-face ((t (:foreground "#d53884"))))
 '(org-ref-label-face ((t (:foreground "#006eb1"))))
 '(org-ref-ref-face ((t (:inherit link :foreground "#00736b"))))
 '(org-scheduled ((t (:foreground "#56676d"))))
 '(org-scheduled-previously ((t (:foreground "#79898a"))))
 '(org-scheduled-today ((t (:foreground "#6a7878"))))
 '(org-sexp-date ((t (:foreground "#56676d"))))
 '(org-special-keyword ((t (:foreground "#00736b"))))
 '(org-table ((t (:foreground "#686dbf"))))
 '(org-tag ((t (:foreground "#00736b" :weight normal))))
 '(org-time-grid ((t (:foreground "#728488"))))
 '(org-upcoming-deadline ((t (:foreground "#66797c"))))
 '(org-upcoming-distant-deadline ((t (:foreground "#8b9b9c"))))
 '(org-warning ((t (:foreground "#7e5a00"))))

 ;; paren
 '(paren-face ((t (:foreground "#728488"))))
 '(paren-face-match ((t (:foreground "#e13833" :background "#eee8d5" :weight ultra-bold))))
 '(paren-face-mismatch ((t (:foreground "#eee8d5" :background "#e13833" :weight ultra-bold))))
 '(paren-face-no-match ((t (:inherit paren-face-mismatch :weight ultra-bold))))

 ;; rainbow
 '(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "#e13833"))))
 '(rainbow-delimiters-base-face ((t (:inherit default))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#e13833" :weight bold :inverse-video t))))

 ;; sh
 '(sh-heredoc ((t (:inherit font-lock-string-face :weight normal))))
 '(sh-quoted-exec ((t (:inherit font-lock-preprocessor-face))))

 ;; shadow
 '(shadow ((t (:foreground "#728488"))))

 ;; smerge
 '(smerge-base ((t (:background "#d0deda"))))
 '(smerge-lower ((t (:background "#dfddbb"))))
 '(smerge-markers ((t (:background "#728488" :foreground "#fdf6e3" :distant-foreground "#56676d" :weight bold))))
 '(smerge-mine ((t (:background "#d6cfbd"))))
 '(smerge-other ((t (:background "#dfddbb"))))
 '(smerge-refined-added ((t (:inherit diff-added :inverse-video t))))
 '(smerge-refined-removed ((t (:inherit diff-removed :inverse-video t))))
 '(smerge-upper ((t (:background "#d6cfbd"))))

 ;; symbol
 '(symbol-overlay-default-face ((t (:background "#d5d4c7" :distant-foreground "#748689"))))
 '(symbol-overlay-face-1 ((t (:background "#a3c5d1" :distant-foreground "#748689"))))
 '(symbol-overlay-face-2 ((t (:background "#c8c6d6" :distant-foreground "#748689"))))
 '(symbol-overlay-face-3 ((t (:background "#dbcca6" :distant-foreground "#748689"))))
 '(symbol-overlay-face-4 ((t (:background "#f1c9ad" :distant-foreground "#748689"))))
 '(symbol-overlay-face-5 ((t (:background "#f6c3b4" :distant-foreground "#748689"))))
 '(symbol-overlay-face-6 ((t (:background "#f2c3ca" :distant-foreground "#748689"))))
 '(symbol-overlay-face-7 ((t (:background "#c0c492" :distant-foreground "#748689"))))
 '(symbol-overlay-face-8 ((t (:background "#d0ddcc" :distant-foreground "#748689"))))

 ;; tab
 '(tab-bar ((t (:background "#f7f0dd" :foreground "#f7f0dd"))))
 '(tab-bar-tab ((t (:background "#fdf6e3" :foreground "#56676d"))))
 '(tab-bar-tab-inactive ((t (:background "#f7f0dd" :foreground "#748689"))))
 '(tab-line ((t (:background "#f7f0dd" :foreground "#f7f0dd"))))
 '(tab-line-close-highlight ((t (:foreground "#006eb1"))))
 '(tab-line-highlight ((t (:inherit tab-line-tab))))
 '(tab-line-tab ((t (:background "#fdf6e3" :foreground "#56676d"))))
 '(tab-line-tab-current ((t (:background "#fdf6e3" :foreground "#56676d"))))
 '(tab-line-tab-inactive ((t (:background "#f7f0dd" :foreground "#748689"))))
 '(tab-line-tab-inactive-alternate ((t (:background "#f7f0dd" :foreground "#748689"))))

 ;; term
 '(term ((t (:foreground "#56676d"))))
 '(term-bold ((t (:weight bold))))

 ;; trailing
 '(trailing-whitespace ((t (:background "#e13833"))))

 ;; treemacs
 '(treemacs-nerd-icons-file-face ((t (:foreground "#00736b"))))
 '(treemacs-nerd-icons-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))

 ;; typescript
 '(typescript-jsdoc-tag ((t (:foreground "#00736b"))))
 '(typescript-jsdoc-type ((t (:foreground "#167e75"))))
 '(typescript-jsdoc-value ((t (:foreground "#007069"))))

 ;; vertico
 '(vertico-posframe-border ((t (:background "#7d8b93"))))
 '(vertico-posframe-border-2 ((t (:background "#e13833"))))
 '(vertico-posframe-border-3 ((t (:background "#526900"))))
 '(vertico-posframe-border-4 ((t (:background "#006eb1"))))
 '(vertico-posframe-border-fallback ((t (:background "#7e5a00"))))

 ;; vterm
 '(vterm-color-black ((t (:background "#3f5359" :foreground "#ffffec"))))
 '(vterm-color-blue ((t (:background "#b4cfd5" :foreground "#006eb1"))))
 '(vterm-color-cyan ((t (:background "#b4cebe" :foreground "#006c64"))))
 '(vterm-color-green ((t (:background "#cbcda0" :foreground "#526900"))))
 '(vterm-color-magenta ((t (:background "#f1bfc7" :foreground "#d53884"))))
 '(vterm-color-red ((t (:background "#f5bfb0" :foreground "#e13833"))))
 '(vterm-color-white ((t (:background "#ffffff" :foreground "#728488"))))
 '(vterm-color-yellow ((t (:background "#d8c9a1" :foreground "#7e5a00"))))

 ;; web
 '(web-mode-block-control-face ((t (:foreground "#d04e1a"))))
 '(web-mode-block-delimiter-face ((t (:foreground "#006eb1"))))
 '(web-mode-doctype-face ((t (:foreground "#728488"))))
 '(web-mode-html-entity-face ((t (:foreground "#006c64" :inherit italic))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#d04e1a"))))
 '(web-mode-json-context-face ((t (:foreground "#526900"))))
 '(web-mode-json-key-face ((t (:foreground "#526900"))))
 '(web-mode-keyword-face ((t (:foreground "#526900"))))
 '(web-mode-string-face ((t (:foreground "#526900"))))
 '(web-mode-type-face ((t (:foreground "#7e5a00"))))

 ;; which
 '(which-func ((t (:foreground "#006eb1"))))
 '(which-key-group-description-face ((t (:foreground "#686dbf"))))
 '(which-key-local-map-description-face ((t (:foreground "#d53884"))))

 ;; whitespace
 '(whitespace-empty ((t (:background "#ede8d6"))))
 '(whitespace-indentation ((t (:foreground "#7d8b93" :background "#ede8d6"))))
 '(whitespace-line ((t (:background "#eee8d5" :foreground "#e13833" :weight bold))))
 '(whitespace-newline ((t (:foreground "#7d8b93"))))
 '(whitespace-space ((t (:foreground "#7d8b93"))))
 '(whitespace-tab ((t (:foreground "#7d8b93"))))
 '(whitespace-trailing ((t (:inherit trailing-whitespace))))

 ;; widget
 '(widget-button-pressed ((t (:foreground "#e13833"))))
 '(widget-documentation ((t (:foreground "#526900"))))
 '(widget-field ((t (:background "#ede8d6" :distant-foreground "#fdf6e3" :box (:line-width -1 :color "#7d8b93") :extend t))))
 '(widget-single-line-field ((t (:background "#ede8d6" :distant-foreground "#fdf6e3"))))

 ;; window
 '(window-tool-bar-button ((t (:background "#fdf6e3" :foreground "#56676d"))))
 '(window-tool-bar-button-disabled ((t (:background "#f7f0dd" :foreground "#748689"))))
 '(window-tool-bar-button-hover ((t (:inherit highlight :distant-foreground "#fdf6e3"))))

 ;; woman
 '(woman-bold ((t (:inherit Man-overstrike))))
 '(woman-italic ((t (:inherit Man-underline))))

 ;; xref
 '(xref-file-header ((t (:inherit success))))
 '(xref-line-number ((t (:foreground "#006eb1"))))
 '(xref-match ((t (:foreground "#526900" :background "#eee8d5" :weight bold))))

 ;; yas
 '(yas-field-highlight-face ((t (:inherit match))))

 ;; local preferences
 '(lsp-face-semhl-property ((t (:foreground unspecified))))
 '(lsp-face-semhl-member ((t (:foreground unspecified))))
 '(lsp-face-semhl-variable ((t (:foreground unspecified))))
 '(lsp-face-semhl-parameter ((t (:foreground unspecified))))
 '(lsp-face-semhl-macro ((t (:foreground "#e13833"))))
 '(lsp-rust-analyzer-mutable-modifier-face ((t (:underline nil)))))

(provide-theme 'solarized-light)

;;; solarized-light-theme.el ends here
