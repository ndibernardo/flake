;;; tomorrow-day-theme.el --- Light theme with the Tomorrow palette  -*- lexical-binding:t -*-

;;; Commentary:
;; Light theme with the Tomorrow palette.

;;; Code:

;;;###theme-autoload
(deftheme tomorrow-day
  "Light theme with the Tomorrow palette."
  :background-mode 'light
  :kind 'color-scheme
  :family 'tomorrow)

(custom-theme-set-faces
 'tomorrow-day

 '(default ((t (:background "#ffffff" :foreground "#4d4d4c"))))
 '(cursor ((t (:background "#4271ae"))))
 '(region ((t (:background "#e4e4e4" :distant-foreground "#3d3d3c" :extend t))))
 '(highlight ((t (:background "#4271ae" :foreground "#f2f2f2" :distant-foreground "#000000"))))
 '(hl-line ((t (:background "#f2f2f2" :extend t))))
 '(fringe ((t (:inherit default :foreground "#C0bfbf" :background unspecified))))
 '(vertical-border ((t (:background "#d6d4d4" :foreground "#d6d4d4"))))
 '(minibuffer-prompt ((t (:foreground "#4271ae"))))
 '(isearch ((t (:inherit lazy-highlight :weight bold))))
 '(lazy-highlight ((t (:background "#2e4f79" :foreground "#000000" :distant-foreground "#f2f2f2" :weight bold))))
 '(link ((t (:foreground "#4271ae" :underline t :weight bold))))
 '(link-visited ((t (:foreground "#8959a8" :underline t))))
 '(button ((t (:inherit link))))
 '(header-line ((t (:inherit mode-line))))
 '(tooltip ((t (:background "#f2f2f2" :foreground "#4d4d4c"))))
 '(secondary-selection ((t (:background "#8e908c" :extend t))))

 '(font-lock-builtin-face ((t (:foreground "#4271ae"))))
 '(font-lock-comment-face ((t (:foreground "#8e908c"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-constant-face ((t (:foreground "#f5871f"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground "#8e908c" :slant normal))))
 '(font-lock-function-name-face ((t (:foreground "#4271ae"))))
 '(font-lock-keyword-face ((t (:foreground "#8959a8"))))
 '(font-lock-negation-char-face ((t (:inherit bold :foreground "#4d4d4c"))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#c82829"))))
 '(font-lock-string-face ((t (:foreground "#718c00"))))
 '(font-lock-type-face ((t (:foreground "#bb9200"))))
 '(font-lock-variable-name-face ((t (:foreground unspecified))))
 '(font-lock-warning-face ((t (:inherit warning))))

 '(font-lock-operator-face ((t (:foreground "#4d4d4c"))))
 '(font-lock-punctuation-face ((t (:foreground "#4d4d4c"))))
 '(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit bold :foreground "#4d4d4c"))))
 '(font-lock-regexp-grouping-construct ((t (:inherit bold :foreground "#4d4d4c"))))

 '(mode-line ((t (:background "#f7f7f7" :foreground "#4d4d4c" :box nil))))
 '(mode-line-inactive ((t (:background "#f4f4f4" :foreground "#8e908c" :box nil))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:foreground "#4271ae" :distant-foreground "#ffffff"))))
 '(mode-line-highlight ((t (:inherit bold :background "#4271ae" :foreground "#f2f2f2"))))

 '(line-number ((t (:inherit default :foreground "#C0bfbf" :weight normal :slant normal :background unspecified))))
 '(line-number-current-line ((t (:inherit (hl-line default) :foreground "#000000" :weight normal :slant normal))))

 '(show-paren-match ((t (:foreground "#c82829" :background "#f2f2f2" :weight ultra-bold))))
 '(show-paren-mismatch ((t (:foreground "#f2f2f2" :background "#c82829" :weight ultra-bold))))

 '(match ((t (:foreground "#718c00" :background "#f2f2f2" :weight bold))))
 '(query-replace ((t (:inherit isearch))))

 '(diff-added ((t (:inherit hl-line :foreground "#718c00"))))
 '(diff-removed ((t (:foreground "#c82829" :background "#d6d4d4"))))
 '(diff-changed ((t (:foreground "#8959a8"))))
 '(diff-header ((t (:foreground "#8abeb7"))))
 '(diff-file-header ((t (:foreground "#4271ae"))))

 '(compilation-error ((t (:inherit error :weight bold))))
 '(compilation-warning ((t (:inherit warning :slant normal))))
 '(compilation-info ((t (:inherit success))))
 '(compilation-line-number ((t (:foreground "#4271ae"))))

 '(org-todo ((t (:foreground "#718c00" :bold inherit))))
 '(org-done ((t (:inherit org-headline-done :weight bold))))
 '(org-headline-done ((t (:foreground "#a3a1a1"))))
 '(org-date ((t (:foreground "#eab700"))))
 '(org-link ((t (:inherit link :foreground "#4271ae"))))
 '(org-block ((t (:background "#f5f5f5" :extend t))))
 '(org-block-begin-line ((t (:inherit org-block :foreground "#8e908c" :background "#f5f5f5"))))
 '(org-block-end-line ((t (:inherit org-block-begin-line))))
 '(org-code ((t (:inherit org-block :foreground "#f5871f"))))
 '(org-verbatim ((t (:foreground "#718c00"))))

 '(outline-1 ((t (:foreground "#3e999f" :weight bold :extend t))))
 '(outline-2 ((t (:foreground "#4271ae" :weight bold :extend t))))
 '(outline-3 ((t (:foreground "#8959a8" :weight bold :extend t))))
 '(outline-4 ((t (:foreground "#4271ae" :weight bold :extend t))))
 '(outline-5 ((t (:foreground "#8959a8" :weight bold :extend t))))
 '(outline-6 ((t (:foreground "#4271ae" :weight bold :extend t))))
 '(outline-7 ((t (:foreground "#8959a8" :weight bold :extend t))))
 '(outline-8 ((t (:foreground "#4271ae" :weight bold :extend t))))

 '(dired-directory ((t (:foreground "#4271ae"))))
 '(dired-symlink ((t (:foreground "#8abeb7" :weight bold))))
 '(dired-header ((t (:foreground "#4271ae" :weight bold))))

 '(eshell-prompt ((t (:foreground "#4271ae" :weight bold))))
 '(eshell-ls-directory ((t (:foreground "#4271ae"))))
 '(eshell-ls-executable ((t (:foreground "#718c00"))))
 '(eshell-ls-symlink ((t (:foreground "#8abeb7"))))

 '(company-tooltip ((t (:inherit tooltip))))
 '(company-tooltip-selection ((t (:background "#e4e4e4" :weight bold))))
 '(company-tooltip-common ((t (:foreground "#4271ae" :distant-foreground "#f2f2f2" :weight bold))))
 '(company-scrollbar-fg ((t (:background "#4271ae"))))
 '(company-scrollbar-bg ((t (:inherit tooltip))))

 '(corfu-default ((t (:inherit tooltip))))
 '(corfu-current ((t (:background "#ffffff" :foreground "#4d4d4c"))))
 '(corfu-bar ((t (:background "#a3a1a1"))))
 '(corfu-border ((t (:background "#C0bfbf"))))
 '(corfu-annotations ((t (:foreground "#8e908c"))))
 '(corfu-deprecated ((t (:foreground "#a3a1a1" :strike-through t))))
 '(corfu-echo ((t (:foreground "#8e908c"))))
 '(corfu-popupinfo ((t (:background "#f2f2f2" :foreground "#4d4d4c"))))

 '(flycheck-error ((t (:underline (:style wave :color "#c82829")))))
 '(flycheck-warning ((t (:underline (:style wave :color "#eab700")))))
 '(flycheck-info ((t (:underline (:style wave :color "#718c00")))))

 '(git-gutter:added ((t (:inherit fringe :foreground "#a9ba66"))))
 '(git-gutter:deleted ((t (:inherit fringe :foreground "#c82829"))))
 '(git-gutter:modified ((t (:inherit fringe :foreground "#f2d366"))))

 '(magit-branch-current ((t (:foreground "#4271ae"))))
 '(magit-branch-local ((t (:foreground "#8abeb7"))))
 '(magit-branch-remote ((t (:foreground "#718c00"))))
 '(magit-branch-upstream ((t (:foreground "#718c00"))))
 '(magit-tag ((t (:foreground "#eab700"))))
 '(magit-hash ((t (:foreground "#8e908c"))))
 '(magit-section-heading ((t (:foreground "#4271ae" :weight bold :extend t))))
 '(magit-section-highlight ((t (:inherit hl-line))))
 '(magit-section-heading-selection ((t (:foreground "#f5871f" :weight bold :extend t))))
 '(magit-diff-file-heading ((t (:foreground "#4d4d4c" :weight bold :extend t))))
 '(magit-diff-file-heading-highlight ((t (:background "#d6d4d4" :foreground "#4d4d4c"))))
 '(magit-diff-hunk-heading ((t (:foreground "#ffffff" :background "#dbcde4" :extend t))))
 '(magit-diff-hunk-heading-highlight ((t (:foreground "#ffffff" :background "#8959a8" :weight bold :extend t))))
 '(magit-diff-context ((t (:foreground "#2e2e2d" :background "#ffffff" :extend t))))
 '(magit-diff-context-highlight ((t (:foreground "#4d4d4c" :background "#f2f2f2" :extend t))))
 '(magit-diff-added ((t (:foreground "#879451" :background "#f6f8ef" :extend t))))
 '(magit-diff-added-highlight ((t (:foreground "#a9ba66" :background "#edf1e0" :weight bold :extend t))))
 '(magit-diff-removed ((t (:foreground "#a02020" :background "#d4c2c2" :extend t))))
 '(magit-diff-removed-highlight ((t (:foreground "#c82829" :background "#d3b1b1" :weight bold :extend t))))
 '(magit-diffstat-added ((t (:foreground "#a9ba66"))))
 '(magit-diffstat-removed ((t (:foreground "#c82829"))))
 '(magit-log-author ((t (:foreground "#f5871f"))))
 '(magit-log-date ((t (:foreground "#4271ae"))))
 '(magit-log-graph ((t (:foreground "#8e908c"))))
 '(magit-process-ok ((t (:inherit success))))
 '(magit-process-ng ((t (:inherit error))))

 '(vertico-current ((t (:background "#e4e4e4" :extend t))))
 '(vertico-group-title ((t (:foreground "#8e908c" :weight bold))))
 '(vertico-group-separator ((t (:foreground "#C0bfbf" :strike-through t))))
 '(vertico-multiline ((t (:foreground "#8e908c"))))
 '(vertico-quick1 ((t (:background "#f2f2f2" :foreground "#4271ae" :weight bold))))
 '(vertico-quick2 ((t (:background "#f2f2f2" :foreground "#718c00" :weight bold))))

 '(orderless-match-face-0 ((t (:weight bold :foreground "#466286" :background "#ecf0f6"))))
 '(orderless-match-face-1 ((t (:weight bold :foreground "#9566a3" :background "#f9f1fb"))))
 '(orderless-match-face-2 ((t (:weight bold :foreground "#62721e" :background "#f0f3e5"))))
 '(orderless-match-face-3 ((t (:weight bold :foreground "#ab8c1e" :background "#fcf7e5"))))

 '(marginalia-documentation ((t (:inherit font-lock-doc-face))))
 '(marginalia-key ((t (:foreground "#718c00"))))
 '(marginalia-type ((t (:foreground "#8959a8"))))
 '(marginalia-char ((t (:foreground "#4271ae"))))
 '(marginalia-lighter ((t (:foreground "#8959a8"))))
 '(marginalia-on ((t (:foreground "#718c00"))))
 '(marginalia-off ((t (:foreground "#c82829"))))

 '(consult-file ((t (:foreground "#4d4d4c"))))
 '(consult-bookmark ((t (:foreground "#4271ae"))))
 '(consult-async-running ((t (:foreground "#4271ae"))))
 '(consult-async-finished ((t (:foreground "#718c00"))))
 '(consult-async-failed ((t (:foreground "#c82829"))))
 '(consult-preview-line ((t (:background "#d6d4d4"))))
 '(consult-preview-match ((t (:background "#e4e4e4"))))

 '(ivy-current-match ((t (:background "#e4e4e4" :distant-foreground "#8e908c" :weight ultra-bold))))
 '(ivy-minibuffer-match-face-1 ((t (:foreground "#a3a1a1" :weight light))))
 '(helm-selection ((t (:inherit bold :background "#e4e4e4" :extend t :distant-foreground "#4271ae"))))
 '(helm-match ((t (:inherit bold :foreground "#4271ae" :distant-foreground "#000000"))))

 '(term-color-black ((t (:background "#f2f2f2" :foreground "#f2f2f2"))))
 '(term-color-red ((t (:background "#c82829" :foreground "#c82829"))))
 '(term-color-green ((t (:background "#718c00" :foreground "#718c00"))))
 '(term-color-yellow ((t (:background "#eab700" :foreground "#eab700"))))
 '(term-color-blue ((t (:background "#4271ae" :foreground "#4271ae"))))
 '(term-color-magenta ((t (:background "#c678dd" :foreground "#c678dd"))))
 '(term-color-cyan ((t (:background "#8abeb7" :foreground "#8abeb7"))))
 '(term-color-white ((t (:background "#000000" :foreground "#000000"))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#8959a8"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#4271ae"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#718c00"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#c678dd"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#f5871f"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#eab700"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#3e999f"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#718c00"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#8959a8"))))

 '(lsp-face-highlight-textual ((t (:weight bold :background "#d6d4d4" :foreground "#f2f2f2" :distant-foreground "#000000"))))
 '(lsp-face-highlight-read ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-face-highlight-write ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-ui-doc-background ((t (:inherit tooltip))))
 '(lsp-ui-peek-selection ((t (:foreground "#ffffff" :background "#4271ae" :bold t))))
 '(lsp-ui-sideline-code-action ((t (:foreground "#5e86ba"))))

 '(which-key-key-face ((t (:foreground "#718c00"))))
 '(which-key-command-description-face ((t (:foreground "#4271ae"))))

 '(web-mode-html-tag-face ((t (:foreground "#4271ae"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#bb9200"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#718c00"))))
 '(web-mode-css-property-name-face ((t (:foreground "#bb9200"))))

 '(js2-function-param ((t (:foreground "#c82829"))))
 '(js2-function-call ((t (:foreground "#4271ae"))))
 '(js2-object-property ((t (:foreground "#8959a8"))))
 '(js2-jsdoc-tag ((t (:foreground "#8e908c"))))
 '(js2-external-variable ((t (:foreground "#4d4d4c"))))

 '(markdown-bold-face ((t (:inherit bold :foreground "#f5871f"))))
 '(markdown-italic-face ((t (:inherit italic :foreground "#8959a8"))))
 '(markdown-link-face ((t (:foreground "#4271ae"))))
 '(markdown-url-face ((t (:foreground "#c678dd" :weight normal))))
 '(markdown-code-face ((t (:background "#d6d4d4" :extend t))))
 '(markdown-blockquote-face ((t (:inherit italic :foreground "#8e908c"))))

 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))
 '(treemacs-directory-face ((t (:foreground "#4d4d4c"))))
 '(treemacs-file-face ((t (:foreground "#4d4d4c"))))
 '(treemacs-tags-face ((t (:foreground "#4271ae"))))
 '(treemacs-fringe-indicator-face ((t (:foreground "#4271ae"))))
 '(treemacs-git-added-face ((t (:foreground "#a9ba66"))))
 '(treemacs-git-modified-face ((t (:foreground "#8959a8"))))
 '(treemacs-git-conflict-face ((t (:foreground "#c82829"))))
 '(treemacs-git-untracked-face ((t (:foreground "#eab700"))))
 '(treemacs-on-success-pulse-face ((t (:foreground "#f2f2f2" :background "#718c00" :extend t))))
 '(treemacs-on-failure-pulse-face ((t (:foreground "#f2f2f2" :background "#c82829" :extend t))))

 '(window-divider ((t (:inherit vertical-border))))
 '(window-divider-first-pixel ((t (:inherit window-divider))))
 '(window-divider-last-pixel ((t (:inherit window-divider))))

 '(error ((t (:foreground "#c82829"))))
 '(warning ((t (:foreground "#eab700"))))
 '(success ((t (:foreground "#718c00"))))

 ;; Man
 '(Man-overstrike ((t (:inherit bold :foreground "#4d4d4c"))))
 '(Man-underline ((t (:inherit underline :foreground "#8959a8"))))

 ;; ansi
 '(ansi-color-black ((t (:foreground "#ffffff" :background "#ffffff"))))
 '(ansi-color-blue ((t (:foreground "#4271ae" :background "#4271ae"))))
 '(ansi-color-bright-black ((t (:foreground "#C0bfbf" :background "#C0bfbf"))))
 '(ansi-color-bright-blue ((t (:foreground "#5e86ba" :background "#5e86ba"))))
 '(ansi-color-bright-cyan ((t (:foreground "#9bc7c1" :background "#9bc7c1"))))
 '(ansi-color-bright-green ((t (:foreground "#869d26" :background "#869d26"))))
 '(ansi-color-bright-magenta ((t (:foreground "#ce8ce2" :background "#ce8ce2"))))
 '(ansi-color-bright-red ((t (:foreground "#d04849" :background "#d04849"))))
 '(ansi-color-bright-white ((t (:foreground "#000000" :background "#000000"))))
 '(ansi-color-bright-yellow ((t (:foreground "#edc126" :background "#edc126"))))
 '(ansi-color-cyan ((t (:foreground "#8abeb7" :background "#8abeb7"))))
 '(ansi-color-green ((t (:foreground "#718c00" :background "#718c00"))))
 '(ansi-color-magenta ((t (:foreground "#c678dd" :background "#c678dd"))))
 '(ansi-color-red ((t (:foreground "#c82829" :background "#c82829"))))
 '(ansi-color-white ((t (:foreground "#4d4d4c" :background "#4d4d4c"))))
 '(ansi-color-yellow ((t (:foreground "#eab700" :background "#eab700"))))

 ;; avy
 '(avy-background-face ((t (:foreground "#8e908c"))))
 '(avy-lead-face ((t (:background "#4271ae" :foreground "#ffffff" :distant-foreground "#4d4d4c" :weight bold))))
 '(avy-lead-face-0 ((t (:inherit avy-lead-face :background "#7a9bc6"))))
 '(avy-lead-face-1 ((t (:inherit avy-lead-face :background "#b3c6de"))))
 '(avy-lead-face-2 ((t (:inherit avy-lead-face :background "#ecf0f6"))))

 ;; bold
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:inherit (bold italic)))))

 ;; bookmark
 '(bookmark-face ((t (:background "#ecf0f6" :extend t))))

 ;; cider
 '(cider-debug-code-overlay-face ((t (:background "#d6d4d4"))))
 '(cider-deprecated-face ((t (:background "#faf0cc"))))
 '(cider-enlightened-face ((t (:inherit cider-result-overlay-face :box (:color "#f5871f" :line-width -1)))))
 '(cider-enlightened-local-face ((t (:foreground "#f5871f" :weight bold))))
 '(cider-error-highlight-face ((t (:underline (:style wave :color "#c82829")))))
 '(cider-fringe-good-face ((t (:foreground "#718c00"))))
 '(cider-instrumented-face ((t (:background "#f4d4d4"))))
 '(cider-result-overlay-face ((t (:background "#d6d4d4" :box (:line-width -1 :color "#a3a1a1")))))
 '(cider-test-error-face ((t (:background "#f5871f"))))
 '(cider-test-failure-face ((t (:background "#eebebe"))))
 '(cider-test-success-face ((t (:foreground "#f2f2f2" :background "#718c00"))))
 '(cider-traced-face ((t (:background "#e7f2f0"))))
 '(cider-warning-highlight-face ((t (:underline (:style wave :color "#eab700")))))

 ;; compilation
 '(compilation-column-number ((t (:inherit font-lock-comment-face))))
 '(compilation-mode-line-exit ((t (:inherit compilation-info))))
 '(compilation-mode-line-fail ((t (:inherit compilation-error))))

 ;; custom
 '(custom-button ((t (:foreground "#4271ae" :background "#ffffff" :box (:line-width 1 :style nil)))))
 '(custom-button-mouse ((t (:foreground "#ffffff" :background "#4271ae" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed ((t (:foreground "#ffffff" :background "#4271ae" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed-unraised ((t (:foreground "#ffffff" :background "#8959a8" :box (:line-width 1 :style nil)))))
 '(custom-button-unraised ((t (:foreground "#8959a8" :background "#ffffff" :box (:line-width 1 :style nil)))))
 '(custom-changed ((t (:foreground "#4271ae" :background "#ffffff"))))
 '(custom-comment ((t (:foreground "#4d4d4c" :background "#e4e4e4"))))
 '(custom-comment-tag ((t (:foreground "#8e908c"))))
 '(custom-group-subtitle ((t (:foreground "#c82829"))))
 '(custom-group-tag ((t (:foreground "#8959a8"))))
 '(custom-group-tag-1 ((t (:foreground "#4271ae"))))
 '(custom-invalid ((t (:foreground "#c82829" :background "#f4d4d4"))))
 '(custom-modified ((t (:foreground "#4271ae" :background "#d9e2ee"))))
 '(custom-saved ((t (:foreground "#718c00" :background "#e2e8cc" :bold t))))
 '(custom-set ((t (:foreground "#eab700" :background "#ffffff"))))
 '(custom-state ((t (:foreground "#718c00" :background "#e2e8cc"))))
 '(custom-themed ((t (:foreground "#eab700" :background "#ffffff"))))
 '(custom-variable-button ((t (:foreground "#718c00" :underline t))))
 '(custom-variable-obsolete ((t (:foreground "#8e908c" :background "#ffffff"))))
 '(custom-variable-tag ((t (:foreground "#c678dd"))))
 '(custom-visibility ((t (:foreground "#4271ae"))))

 ;; diff
 '(diff-context ((t (:foreground "#434342"))))
 '(diff-hl-change ((t (:foreground "#f2d366" :background "#f2d366"))))
 '(diff-hl-delete ((t (:foreground "#c82829" :background "#c82829"))))
 '(diff-hl-insert ((t (:foreground "#a9ba66" :background "#a9ba66"))))
 '(diff-hunk-header ((t (:foreground "#8959a8"))))
 '(diff-indicator-added ((t (:foreground "#a9ba66"))))
 '(diff-indicator-changed ((t (:foreground "#f2d366"))))
 '(diff-indicator-removed ((t (:foreground "#c82829"))))
 '(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
 '(diff-refine-changed ((t (:inherit diff-changed :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-removed :inverse-video t))))

 ;; dired
 '(dired-flagged ((t (:foreground "#c82829"))))
 '(dired-ignored ((t (:foreground "#8e908c"))))
 '(dired-k-added ((t (:foreground "#a9ba66" :weight bold))))
 '(dired-k-commited ((t (:foreground "#718c00" :weight bold))))
 '(dired-k-directory ((t (:foreground "#4271ae" :weight bold))))
 '(dired-k-ignored ((t (:foreground "#a3a1a1" :weight bold))))
 '(dired-k-modified ((t (:foreground "#f2d366" :weight bold))))
 '(dired-k-untracked ((t (:foreground "#3e999f" :weight bold))))
 '(dired-mark ((t (:foreground "#f5871f" :weight bold))))
 '(dired-marked ((t (:foreground "#c678dd" :weight bold :inverse-video t))))
 '(dired-perm-write ((t (:foreground "#4d4d4c" :underline t))))
 '(dired-subtree-depth-1-face ((t (:background "#ededed"))))
 '(dired-subtree-depth-2-face ((t (:background "#e8e8e8"))))
 '(dired-subtree-depth-3-face ((t (:background "#e3e3e3"))))
 '(dired-subtree-depth-4-face ((t (:background "#dedede"))))
 '(dired-subtree-depth-5-face ((t (:background "#d9d9d9"))))
 '(dired-subtree-depth-6-face ((t (:background "#d4d4d4"))))
 '(dired-warning ((t (:foreground "#eab700"))))

 ;; ediff
 '(ediff-current-diff-A ((t (:foreground "#c82829" :background "#d3b1b1" :extend t))))
 '(ediff-current-diff-B ((t (:foreground "#a9ba66" :background "#edf1e0" :extend t))))
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
 '(elfeed-log-debug-level-face ((t (:foreground "#8e908c"))))
 '(elfeed-log-error-level-face ((t (:inherit error))))
 '(elfeed-log-info-level-face ((t (:inherit success))))
 '(elfeed-log-warn-level-face ((t (:inherit warning))))
 '(elfeed-search-date-face ((t (:foreground "#8959a8"))))
 '(elfeed-search-feed-face ((t (:foreground "#4271ae"))))
 '(elfeed-search-filter-face ((t (:foreground "#8959a8"))))
 '(elfeed-search-tag-face ((t (:foreground "#8e908c"))))
 '(elfeed-search-title-face ((t (:foreground "#8e908c"))))
 '(elfeed-search-unread-count-face ((t (:foreground "#eab700"))))
 '(elfeed-search-unread-title-face ((t (:foreground "#4d4d4c" :weight bold))))

 ;; elixir
 '(elixir-atom-face ((t (:foreground "#315482"))))
 '(elixir-attribute-face ((t (:foreground "#8959a8"))))

 ;; escape
 '(escape-glyph ((t (:foreground "#8abeb7"))))

 ;; eshell
 '(eshell-ls-archive ((t (:foreground "#c678dd"))))
 '(eshell-ls-backup ((t (:foreground "#eab700"))))
 '(eshell-ls-clutter ((t (:foreground "#c82829"))))
 '(eshell-ls-missing ((t (:foreground "#c82829"))))
 '(eshell-ls-product ((t (:foreground "#f5871f"))))
 '(eshell-ls-readonly ((t (:foreground "#f5871f"))))
 '(eshell-ls-special ((t (:foreground "#8959a8"))))
 '(eshell-ls-unreadable ((t (:foreground "#a3a1a1"))))

 ;; flycheck
 '(flycheck-fringe-error ((t (:inherit fringe :foreground "#c82829"))))
 '(flycheck-fringe-info ((t (:inherit fringe :foreground "#718c00"))))
 '(flycheck-fringe-warning ((t (:inherit fringe :foreground "#eab700"))))
 '(flycheck-posframe-background-face ((t (:background "#f2f2f2"))))
 '(flycheck-posframe-error-face ((t (:inherit flycheck-posframe-face :foreground "#c82829"))))
 '(flycheck-posframe-face ((t (:inherit default))))
 '(flycheck-posframe-info-face ((t (:inherit flycheck-posframe-face :foreground "#718c00"))))
 '(flycheck-posframe-warning-face ((t (:inherit flycheck-posframe-face :foreground "#eab700"))))

 ;; flymake
 '(flymake-error ((t (:underline (:style wave :color "#c82829")))))
 '(flymake-note ((t (:underline (:style wave :color "#718c00")))))
 '(flymake-warning ((t (:underline (:style wave :color "#f5871f")))))

 ;; font
 '(font-latex-bold-face ((t (:inherit bold))))
 '(font-latex-italic-face ((t (:inherit italic))))
 '(font-latex-math-face ((t (:foreground "#4271ae"))))
 '(font-latex-script-char-face ((t (:foreground "#315482"))))
 '(font-latex-sectioning-0-face ((t (:foreground "#4271ae" :weight ultra-bold))))
 '(font-latex-sectioning-1-face ((t (:foreground "#c678dd" :weight semi-bold))))
 '(font-latex-sectioning-2-face ((t (:foreground "#8959a8" :weight semi-bold))))
 '(font-latex-sectioning-3-face ((t (:foreground "#7a9bc6" :weight semi-bold))))
 '(font-latex-sectioning-4-face ((t (:foreground "#d7a0e7" :weight semi-bold))))
 '(font-latex-sectioning-5-face ((t (:foreground "#ac8ac2" :weight semi-bold))))
 '(font-latex-sedate-face ((t (:inherit font-lock-keyword-face))))
 '(font-latex-string-face ((t (:inherit font-lock-string-face))))
 '(font-latex-underline-face ((t (:inherit underline))))
 '(font-latex-verbatim-face ((t (:inherit fixed-pitch :foreground "#8959a8" :slant normal))))
 '(font-latex-warning-face ((t (:inherit font-lock-warning-face))))
 '(font-lock-escape-face ((t (:inherit font-lock-regexp-grouping-backslash))))
 '(font-lock-function-call-face ((t (:inherit font-lock-function-name-face :slant normal :foreground "#456690"))))
 '(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-number-face ((t (:foreground "#f5871f"))))
 '(font-lock-preprocessor-char-face ((t (:inherit bold :foreground "#4d4d4c"))))
 '(font-lock-property-name-face ((t (:foreground "#715483" :weight bold))))
 '(font-lock-property-use-face ((t (:inherit font-lock-property-name-face :weight regular))))
 '(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face :foreground unspecified))))

 ;; git
 '(git-commit-comment-branch-local ((t (:foreground "#c678dd"))))
 '(git-commit-comment-branch-remote ((t (:foreground "#718c00"))))
 '(git-commit-comment-detached ((t (:foreground "#f5871f"))))
 '(git-commit-comment-file ((t (:foreground "#8959a8"))))
 '(git-commit-comment-heading ((t (:foreground "#8959a8"))))
 '(git-commit-keyword ((t (:foreground "#8abeb7" :slant normal))))
 '(git-commit-known-pseudo-header ((t (:foreground "#8e908c" :weight bold :slant normal))))
 '(git-commit-nonempty-second-line ((t (:inherit git-commit-overlong-summary))))
 '(git-commit-overlong-summary ((t (:inherit error :background "#f2f2f2" :slant normal :weight bold))))
 '(git-commit-pseudo-header ((t (:foreground "#8e908c" :slant normal))))
 '(git-commit-summary ((t (:foreground "#718c00"))))
 '(git-gutter+-added ((t (:inherit fringe :foreground "#a9ba66"))))
 '(git-gutter+-deleted ((t (:inherit fringe :foreground "#c82829"))))
 '(git-gutter+-modified ((t (:inherit fringe :foreground "#f2d366"))))
 '(git-gutter-fr:added ((t (:inherit fringe :foreground "#a9ba66"))))
 '(git-gutter-fr:deleted ((t (:inherit fringe :foreground "#c82829"))))
 '(git-gutter-fr:modified ((t (:inherit fringe :foreground "#f2d366"))))

 ;; header
 '(header-line-highlight ((t (:inherit mode-line-highlight))))

 ;; hi
 '(hi-blue ((t (:background "#4271ae"))))
 '(hi-blue-b ((t (:foreground "#4271ae" :weight bold))))
 '(hi-green ((t (:background "#718c00"))))
 '(hi-green-b ((t (:foreground "#718c00" :weight bold))))
 '(hi-pink ((t (:background "#c678dd"))))
 '(hi-red-b ((t (:foreground "#c82829" :weight bold))))
 '(hi-yellow ((t (:background "#eab700"))))

 ;; highlight
 '(highlight-indentation-current-column-face ((t (:background "#e4e4e4"))))
 '(highlight-indentation-face ((t (:inherit hl-line))))
 '(highlight-indentation-guides-even-face ((t (:inherit highlight-indentation-face))))
 '(highlight-indentation-guides-odd-face ((t (:inherit highlight-indentation-face))))
 '(highlight-numbers-number ((t (:inherit bold :foreground "#f5871f"))))
 '(highlight-quoted-quote ((t (:foreground "#4d4d4c"))))
 '(highlight-quoted-symbol ((t (:foreground "#bb9200"))))
 '(highlight-symbol-face ((t (:background "#e6e6e6" :distant-foreground "#1e1e1e"))))
 '(highlight-thing ((t (:background "#e6e6e6" :distant-foreground "#1e1e1e"))))

 ;; hl
 '(hl-fill-column-face ((t (:inherit (hl-line shadow)))))
 '(hl-todo ((t (:foreground "#c82829" :weight bold))))

 ;; imenu
 '(imenu-list-entry-face-0 ((t (:foreground "#4271ae"))))
 '(imenu-list-entry-face-1 ((t (:foreground "#718c00"))))
 '(imenu-list-entry-face-2 ((t (:foreground "#eab700"))))
 '(imenu-list-entry-subalist-face-0 ((t (:inherit imenu-list-entry-face-0 :weight bold))))
 '(imenu-list-entry-subalist-face-1 ((t (:inherit imenu-list-entry-face-1 :weight bold))))
 '(imenu-list-entry-subalist-face-2 ((t (:inherit imenu-list-entry-face-2 :weight bold))))

 ;; indent
 '(indent-guide-face ((t (:inherit hl-line))))

 ;; isearch
 '(isearch-fail ((t (:background "#c82829" :foreground "#f2f2f2" :weight bold))))

 ;; italic
 '(italic ((t (:slant normal))))

 ;; lsp
 '(lsp-headerline-breadcrumb-separator-face ((t (:inherit shadow))))
 '(lsp-ui-peek-filename ((t (:inherit mode-line-buffer-id))))
 '(lsp-ui-peek-header ((t (:foreground "#4d4d4c" :background "#ffffff" :bold t))))
 '(lsp-ui-peek-highlight ((t (:inherit isearch :box t))))
 '(lsp-ui-peek-line-number ((t (:foreground "#718c00"))))
 '(lsp-ui-peek-list ((t (:background "#e5e5e5"))))
 '(lsp-ui-peek-peek ((t (:background "#e5e5e5"))))
 '(lsp-ui-sideline-current-symbol ((t (:inherit highlight))))
 '(lsp-ui-sideline-symbol-info ((t (:foreground "#9ea09d" :background "#f2f2f2" :extend t))))

 ;; magit
 '(magit-bisect-bad ((t (:foreground "#c82829"))))
 '(magit-bisect-good ((t (:foreground "#718c00"))))
 '(magit-bisect-skip ((t (:foreground "#f5871f"))))
 '(magit-blame-date ((t (:foreground "#c82829"))))
 '(magit-blame-hash ((t (:foreground "#8abeb7"))))
 '(magit-blame-heading ((t (:foreground "#f5871f" :background "#d6d4d4" :extend t))))
 '(magit-cherry-equivalent ((t (:foreground "#8959a8"))))
 '(magit-cherry-unmatched ((t (:foreground "#8abeb7"))))
 '(magit-diff-base ((t (:foreground "#c46c18" :background "#fef3e8" :extend t))))
 '(magit-diff-base-highlight ((t (:foreground "#f5871f" :background "#fde7d2" :weight bold :extend t))))
 '(magit-diff-file-heading-selection ((t (:foreground "#c678dd" :background "#315482" :weight bold :extend t))))
 '(magit-diff-lines-heading ((t (:foreground "#eab700" :background "#c82829" :extend t :extend t))))
 '(magit-dimmed ((t (:foreground "#1e1e1e"))))
 '(magit-filename ((t (:foreground "#8959a8"))))
 '(magit-header-line ((t (:background "#315482" :foreground "#000000" :weight bold :box (:line-width 3 :color "#315482")))))
 '(magit-reflog-amend ((t (:foreground "#c678dd"))))
 '(magit-reflog-checkout ((t (:foreground "#4271ae"))))
 '(magit-reflog-cherry-pick ((t (:foreground "#718c00"))))
 '(magit-reflog-commit ((t (:foreground "#718c00"))))
 '(magit-reflog-merge ((t (:foreground "#718c00"))))
 '(magit-reflog-other ((t (:foreground "#8abeb7"))))
 '(magit-reflog-rebase ((t (:foreground "#c678dd"))))
 '(magit-reflog-remote ((t (:foreground "#8abeb7"))))
 '(magit-reflog-reset ((t (:inherit error))))
 '(magit-refname ((t (:foreground "#8e908c"))))
 '(magit-section-secondary-heading ((t (:foreground "#8959a8" :weight bold :extend t))))
 '(magit-sequence-drop ((t (:foreground "#c82829"))))
 '(magit-sequence-head ((t (:foreground "#4271ae"))))
 '(magit-sequence-part ((t (:foreground "#f5871f"))))
 '(magit-sequence-stop ((t (:foreground "#718c00"))))
 '(magit-signature-bad ((t (:inherit error))))
 '(magit-signature-error ((t (:inherit error))))
 '(magit-signature-expired ((t (:foreground "#f5871f"))))
 '(magit-signature-good ((t (:inherit success))))
 '(magit-signature-revoked ((t (:foreground "#c678dd"))))
 '(magit-signature-untrusted ((t (:foreground "#eab700"))))

 ;; makefile
 '(makefile-targets ((t (:foreground "#4271ae"))))

 ;; marginalia
 '(marginalia-file-priv-dir ((t (:foreground "#4271ae"))))
 '(marginalia-file-priv-exec ((t (:foreground "#718c00"))))
 '(marginalia-file-priv-link ((t (:foreground "#8959a8"))))
 '(marginalia-file-priv-other ((t (:foreground "#c678dd"))))
 '(marginalia-file-priv-rare ((t (:foreground "#4d4d4c"))))
 '(marginalia-file-priv-read ((t (:foreground "#eab700"))))
 '(marginalia-file-priv-write ((t (:foreground "#c82829"))))
 '(marginalia-number ((t (:foreground "#f5871f"))))
 '(marginalia-size ((t (:foreground "#8959a8"))))

 ;; markdown
 '(markdown-header-delimiter-face ((t (:inherit markdown-header-face))))
 '(markdown-header-face ((t (:inherit bold :foreground "#4271ae"))))
 '(markdown-html-attr-name-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-attr-value-face ((t (:inherit font-lock-string-face))))
 '(markdown-html-entity-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-tag-delimiter-face ((t (:inherit markdown-markup-face))))
 '(markdown-html-tag-name-face ((t (:inherit font-lock-keyword-face))))
 '(markdown-inline-code-face ((t (:inherit (markdown-code-face markdown-pre-face)))))
 '(markdown-list-face ((t (:foreground "#c82829"))))
 '(markdown-markup-face ((t (:foreground "#4d4d4c"))))
 '(markdown-metadata-key-face ((t (:foreground "#c82829"))))
 '(markdown-pre-face ((t (:foreground "#718c00"))))
 '(markdown-reference-face ((t (:foreground "#8e908c"))))

 ;; mc/cursor
 '(mc/cursor-face ((t (:inherit cursor))))

 ;; message
 '(message-cited-text ((t (:foreground "#8959a8"))))
 '(message-cited-text-1 ((t (:foreground "#eab700"))))
 '(message-cited-text-2 ((t (:foreground "#c678dd"))))
 '(message-cited-text-3 ((t (:foreground "#718c00"))))
 '(message-cited-text-4 ((t (:foreground "#718c00"))))
 '(message-header-cc ((t (:inherit message-header-to :foreground "#386093"))))
 '(message-header-name ((t (:foreground "#718c00"))))
 '(message-header-newsgroups ((t (:foreground "#eab700"))))
 '(message-header-other ((t (:foreground "#8959a8"))))
 '(message-header-subject ((t (:foreground "#4271ae" :weight bold))))
 '(message-header-to ((t (:foreground "#4271ae" :weight bold))))
 '(message-header-xheader ((t (:foreground "#8e908c"))))
 '(message-mml ((t (:foreground "#8e908c" :slant normal))))
 '(message-separator ((t (:foreground "#8e908c"))))

 ;; mode
 '(mode-line-active ((t (:inherit mode-line))))

 ;; nobreak
 '(nobreak-space ((t (:inherit escape-glyph :underline t))))

 ;; org
 '(org-agenda-clocking ((t (:background "#d9e2ee"))))
 '(org-agenda-date ((t (:foreground "#8959a8" :weight ultra-bold))))
 '(org-agenda-date-today ((t (:foreground "#b89bca" :weight ultra-bold))))
 '(org-agenda-date-weekend ((t (:foreground "#523564" :weight ultra-bold))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "#8e908c"))))
 '(org-agenda-done ((t (:inherit org-done))))
 '(org-agenda-structure ((t (:foreground "#4d4d4c" :weight ultra-bold))))
 '(org-archived ((t (:foreground "#8e908c"))))
 '(org-block-background ((t (:background "#f5f5f5" :extend t))))
 '(org-checkbox ((t (:inherit org-todo))))
 '(org-checkbox-statistics-done ((t (:inherit org-done))))
 '(org-checkbox-statistics-todo ((t (:inherit org-todo))))
 '(org-cite ((t (:foreground "#3f9196"))))
 '(org-cite-key ((t (:foreground "#447a7d" :underline t))))
 '(org-default ((t (:inherit variable-pitch))))
 '(org-document-info ((t (:foreground "#4271ae"))))
 '(org-document-title ((t (:foreground "#4271ae" :weight bold))))
 '(org-drawer ((t (:foreground "#8e908c"))))
 '(org-ellipsis ((t (:foreground "#8e908c"))))
 '(org-footnote ((t (:foreground "#f5871f"))))
 '(org-formula ((t (:foreground "#8abeb7"))))
 '(org-habit-alert-face ((t (:weight bold :background "#eed479"))))
 '(org-habit-alert-future-face ((t (:weight bold :background "#efe0a9"))))
 '(org-habit-clear-face ((t (:weight bold :background "#C0bfbf"))))
 '(org-habit-clear-future-face ((t (:weight bold :background "#d6d4d4"))))
 '(org-habit-overdue-face ((t (:weight bold :background "#dd8d8d"))))
 '(org-habit-overdue-future-face ((t (:weight bold :background "#e5b5b5"))))
 '(org-habit-ready-face ((t (:weight bold :background "#9ab1d0"))))
 '(org-habit-ready-future-face ((t (:weight bold :background "#bdcbdd"))))
 '(org-hide ((t (:foreground "#ffffff"))))
 '(org-journal-calendar-entry-face ((t (:foreground "#c678dd" :slant normal))))
 '(org-journal-calendar-scheduled-face ((t (:foreground "#c82829" :slant normal))))
 '(org-journal-highlight ((t (:foreground "#4271ae"))))
 '(org-latex-and-related ((t (:foreground "#000000" :weight bold))))
 '(org-list-dt ((t (:foreground "#4271ae"))))
 '(org-meta-line ((t (:foreground "#8e908c"))))
 '(org-pomodoro-mode-line ((t (:foreground "#c82829"))))
 '(org-pomodoro-mode-line-overtime ((t (:foreground "#eab700" :weight bold))))
 '(org-priority ((t (:foreground "#c82829"))))
 '(org-property-value ((t (:foreground "#8e908c"))))
 '(org-quote ((t (:inherit org-block :slant normal :background "#f5f5f5"))))
 '(org-ref-acronym-face ((t (:foreground "#8959a8"))))
 '(org-ref-cite-face ((t (:foreground "#eab700" :weight light :underline t))))
 '(org-ref-glossary-face ((t (:foreground "#c678dd"))))
 '(org-ref-label-face ((t (:foreground "#4271ae"))))
 '(org-ref-ref-face ((t (:inherit link :foreground "#3e999f"))))
 '(org-scheduled ((t (:foreground "#4d4d4c"))))
 '(org-scheduled-previously ((t (:foreground "#000000"))))
 '(org-scheduled-today ((t (:foreground "#696769"))))
 '(org-sexp-date ((t (:foreground "#4d4d4c"))))
 '(org-special-keyword ((t (:foreground "#8e908c"))))
 '(org-table ((t (:foreground "#8959a8"))))
 '(org-tag ((t (:foreground "#8e908c" :weight normal))))
 '(org-time-grid ((t (:foreground "#8e908c"))))
 '(org-upcoming-deadline ((t (:foreground "#70706f"))))
 '(org-upcoming-distant-deadline ((t (:foreground "#a6a6a5"))))
 '(org-warning ((t (:foreground "#eab700"))))

 ;; paren
 '(paren-face ((t (:foreground "#8e908c"))))
 '(paren-face-match ((t (:foreground "#c82829" :background "#f2f2f2" :weight ultra-bold))))
 '(paren-face-mismatch ((t (:foreground "#f2f2f2" :background "#c82829" :weight ultra-bold))))
 '(paren-face-no-match ((t (:inherit paren-face-mismatch :weight ultra-bold))))

 ;; rainbow
 '(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "#c82829"))))
 '(rainbow-delimiters-base-face ((t (:inherit default))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#c82829" :weight bold :inverse-video t))))

 ;; sh
 '(sh-heredoc ((t (:inherit font-lock-string-face :weight normal))))
 '(sh-quoted-exec ((t (:inherit font-lock-preprocessor-face))))

 ;; shadow
 '(shadow ((t (:foreground "#a3a1a1"))))

 ;; smerge
 '(smerge-base ((t (:background "#d9e2ee"))))
 '(smerge-lower ((t (:background "#e2e8cc"))))
 '(smerge-markers ((t (:background "#8e908c" :foreground "#ffffff" :distant-foreground "#4d4d4c" :weight bold))))
 '(smerge-mine ((t (:background "#d3b1b1"))))
 '(smerge-other ((t (:background "#e2e8cc"))))
 '(smerge-refined-added ((t (:inherit diff-added :inverse-video t))))
 '(smerge-refined-removed ((t (:inherit diff-removed :inverse-video t))))
 '(smerge-upper ((t (:background "#d3b1b1"))))

 ;; symbol
 '(symbol-overlay-default-face ((t (:background "#e6e6e6" :distant-foreground "#1e1e1e"))))
 '(symbol-overlay-face-1 ((t (:background "#b3c6de" :distant-foreground "#1e1e1e"))))
 '(symbol-overlay-face-2 ((t (:background "#cfbcdc" :distant-foreground "#1e1e1e"))))
 '(symbol-overlay-face-3 ((t (:background "#f8e9b2" :distant-foreground "#1e1e1e"))))
 '(symbol-overlay-face-4 ((t (:background "#fbdbbb" :distant-foreground "#1e1e1e"))))
 '(symbol-overlay-face-5 ((t (:background "#eebebe" :distant-foreground "#1e1e1e"))))
 '(symbol-overlay-face-6 ((t (:background "#edd6f4" :distant-foreground "#1e1e1e"))))
 '(symbol-overlay-face-7 ((t (:background "#c6d199" :distant-foreground "#1e1e1e"))))
 '(symbol-overlay-face-8 ((t (:background "#e7f2f0" :distant-foreground "#1e1e1e"))))

 ;; tab
 '(tab-bar ((t (:background "#f2f2f2" :foreground "#f2f2f2"))))
 '(tab-bar-tab ((t (:background "#ffffff" :foreground "#4d4d4c"))))
 '(tab-bar-tab-inactive ((t (:background "#f2f2f2" :foreground "#1e1e1e"))))
 '(tab-line ((t (:background "#f2f2f2" :foreground "#f2f2f2"))))
 '(tab-line-close-highlight ((t (:foreground "#4271ae"))))
 '(tab-line-highlight ((t (:inherit tab-line-tab))))
 '(tab-line-tab ((t (:background "#ffffff" :foreground "#4d4d4c"))))
 '(tab-line-tab-current ((t (:background "#ffffff" :foreground "#4d4d4c"))))
 '(tab-line-tab-inactive ((t (:background "#f2f2f2" :foreground "#1e1e1e"))))
 '(tab-line-tab-inactive-alternate ((t (:background "#f2f2f2" :foreground "#1e1e1e"))))

 ;; term
 '(term ((t (:foreground "#4d4d4c"))))
 '(term-bold ((t (:weight bold))))

 ;; trailing
 '(trailing-whitespace ((t (:background "#c82829"))))

 ;; treemacs
 '(treemacs-nerd-icons-file-face ((t (:foreground "#8e908c"))))
 '(treemacs-nerd-icons-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))

 ;; typescript
 '(typescript-jsdoc-tag ((t (:foreground "#8e908c"))))
 '(typescript-jsdoc-type ((t (:foreground "#787a77"))))
 '(typescript-jsdoc-value ((t (:foreground "#9ea09d"))))

 ;; vertico
 '(vertico-posframe-border ((t (:background "#8e908c"))))
 '(vertico-posframe-border-2 ((t (:background "#c82829"))))
 '(vertico-posframe-border-3 ((t (:background "#718c00"))))
 '(vertico-posframe-border-4 ((t (:background "#4271ae"))))
 '(vertico-posframe-border-fallback ((t (:background "#eab700"))))

 ;; vterm
 '(vterm-color-black ((t (:background "#f5f5f5" :foreground "#f2f2f2"))))
 '(vterm-color-blue ((t (:background "#7194c2" :foreground "#4271ae"))))
 '(vterm-color-cyan ((t (:background "#a7cec9" :foreground "#8abeb7"))))
 '(vterm-color-green ((t (:background "#94a83f" :foreground "#718c00"))))
 '(vterm-color-magenta ((t (:background "#d499e5" :foreground "#c678dd"))))
 '(vterm-color-red ((t (:background "#d55d5e" :foreground "#c82829"))))
 '(vterm-color-white ((t (:background "#3f3f3f" :foreground "#000000"))))
 '(vterm-color-yellow ((t (:background "#efc93f" :foreground "#eab700"))))

 ;; web
 '(web-mode-block-control-face ((t (:foreground "#f5871f"))))
 '(web-mode-block-delimiter-face ((t (:foreground "#4271ae"))))
 '(web-mode-doctype-face ((t (:foreground "#8e908c"))))
 '(web-mode-html-entity-face ((t (:foreground "#8abeb7" :inherit italic))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#4d4d4c"))))
 '(web-mode-json-context-face ((t (:foreground "#718c00"))))
 '(web-mode-json-key-face ((t (:foreground "#718c00"))))
 '(web-mode-keyword-face ((t (:foreground "#8959a8"))))
 '(web-mode-string-face ((t (:foreground "#718c00"))))
 '(web-mode-type-face ((t (:foreground "#bb9200"))))

 ;; which
 '(which-func ((t (:foreground "#4271ae"))))
 '(which-key-group-description-face ((t (:foreground "#8959a8"))))
 '(which-key-local-map-description-face ((t (:foreground "#c678dd"))))

 ;; whitespace
 '(whitespace-empty ((t (:background "#d6d4d4"))))
 '(whitespace-indentation ((t (:foreground "#C0bfbf" :background "#d6d4d4"))))
 '(whitespace-line ((t (:background "#f2f2f2" :foreground "#c82829" :weight bold))))
 '(whitespace-newline ((t (:foreground "#C0bfbf"))))
 '(whitespace-space ((t (:foreground "#C0bfbf"))))
 '(whitespace-tab ((t (:background "#f9f9f9" :foreground "#8e908c"))))
 '(whitespace-trailing ((t (:inherit trailing-whitespace))))

 ;; widget
 '(widget-button-pressed ((t (:foreground "#c82829"))))
 '(widget-documentation ((t (:foreground "#718c00"))))
 '(widget-field ((t (:background "#d6d4d4" :distant-foreground "#ffffff" :box (:line-width -1 :color "#8e908c") :extend t))))
 '(widget-single-line-field ((t (:background "#d6d4d4" :distant-foreground "#ffffff"))))

 ;; window
 '(window-tool-bar-button ((t (:background "#ffffff" :foreground "#4d4d4c"))))
 '(window-tool-bar-button-disabled ((t (:background "#f2f2f2" :foreground "#1e1e1e"))))
 '(window-tool-bar-button-hover ((t (:inherit highlight :distant-foreground "#ffffff"))))

 ;; woman
 '(woman-bold ((t (:inherit Man-overstrike))))
 '(woman-italic ((t (:inherit Man-underline))))

 ;; xref
 '(xref-file-header ((t (:inherit success))))
 '(xref-line-number ((t (:foreground "#4271ae"))))
 '(xref-match ((t (:foreground "#718c00" :background "#f2f2f2" :weight bold))))

 ;; yas
 '(yas-field-highlight-face ((t (:inherit match))))

 ;; local preferences
 '(lsp-face-semhl-property ((t (:foreground unspecified))))
 '(lsp-face-semhl-member ((t (:foreground unspecified))))
 '(lsp-face-semhl-variable ((t (:foreground unspecified))))
 '(lsp-face-semhl-parameter ((t (:foreground unspecified))))
 '(lsp-face-semhl-macro ((t (:foreground "#c82829"))))
 '(lsp-rust-analyzer-mutable-modifier-face ((t (:underline nil)))))

(provide-theme 'tomorrow-day)

;;; tomorrow-day-theme.el ends here
