;;; nord-theme.el --- Dark theme with the Nord palette  -*- lexical-binding:t -*-

;;; Commentary:
;; Dark theme with the Nord palette.

;;; Code:

;;;###theme-autoload
(deftheme nord
  "Dark theme with the Nord palette."
  :background-mode 'dark
  :kind 'color-scheme
  :family 'nord)

(custom-theme-set-faces
 'nord

 '(default ((t (:background "#2E3440" :foreground "#ECEFF4"))))
 '(cursor ((t (:background "#81A1C1"))))
 '(region ((t (:background "#434C5E" :distant-foreground "#bcbfc3" :extend t))))
 '(highlight ((t (:background "#81A1C1" :foreground "#191C25" :distant-foreground "#F0F4FC"))))
 '(hl-line ((t (:background "#272C36" :extend t))))
 '(fringe ((t (:foreground "#8FBCBB" :background unspecified))))
 '(vertical-border ((t (:background "#1c2028" :foreground "#1c2028"))))
 '(minibuffer-prompt ((t (:foreground "#81A1C1"))))
 '(isearch ((t (:inherit lazy-highlight :weight bold))))
 '(lazy-highlight ((t (:background "#5a7087" :foreground "#F0F4FC" :distant-foreground "#191C25" :weight bold))))
 '(link ((t (:foreground "#81A1C1" :underline t :weight bold))))
 '(link-visited ((t (:foreground "#5D80AE" :underline t))))
 '(button ((t (:inherit link))))
 '(header-line ((t (:inherit mode-line))))
 '(tooltip ((t (:background "#272C36" :foreground "#ECEFF4"))))
 '(secondary-selection ((t (:background "#434C5E" :extend t))))

 '(font-lock-builtin-face ((t (:foreground "#81A1C1"))))
 '(font-lock-comment-face ((t (:foreground "#6f7787"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-constant-face ((t (:foreground "#81A1C1"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground "#78808f"))))
 '(font-lock-function-name-face ((t (:foreground "#88C0D0"))))
 '(font-lock-keyword-face ((t (:foreground "#81A1C1"))))
 '(font-lock-negation-char-face ((t (:inherit bold :foreground "#81A1C1"))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#BF616A"))))
 '(font-lock-string-face ((t (:foreground "#A3BE8C"))))
 '(font-lock-type-face ((t (:foreground "#8FBCBB"))))
 '(font-lock-variable-name-face ((t (:foreground unspecified))))
 '(font-lock-warning-face ((t (:inherit warning))))

 '(font-lock-operator-face ((t (:foreground "#81A1C1"))))
 '(font-lock-punctuation-face ((t (:foreground "#d1dbe7"))))
 '(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit bold :foreground "#81A1C1"))))
 '(font-lock-regexp-grouping-construct ((t (:inherit bold :foreground "#81A1C1"))))

 '(mode-line ((t (:background "#292e39" :box nil))))
 '(mode-line-inactive ((t (:background "#292e39" :foreground "#9099AB" :box nil))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:foreground "#81A1C1"))))
 '(mode-line-highlight ((t (:inherit highlight :distant-foreground "#2E3440"))))

 '(line-number ((t (:inherit default :foreground "#6f7787" :weight normal :slant normal :background unspecified))))
 '(line-number-current-line ((t (:inherit (hl-line default) :foreground "#D8DEE9" :weight normal :slant normal))))

 '(show-paren-match ((t (:foreground "#2E3440" :background "#8FBCBB" :weight ultra-bold))))
 '(show-paren-mismatch ((t (:foreground "#D8DEE9" :background "#BF616A" :weight ultra-bold))))

 '(match ((t (:foreground "#A3BE8C" :background "#191C25" :weight bold))))
 '(query-replace ((t (:inherit isearch))))

 '(diff-added ((t (:inherit hl-line :foreground "#A3BE8C"))))
 '(diff-removed ((t (:foreground "#BF616A" :background "#373E4C"))))
 '(diff-changed ((t (:foreground "#5D80AE"))))
 '(diff-header ((t (:foreground "#88C0D0"))))
 '(diff-file-header ((t (:foreground "#81A1C1"))))

 '(compilation-error ((t (:inherit error :weight bold))))
 '(compilation-warning ((t (:inherit warning :slant normal))))
 '(compilation-info ((t (:inherit success))))
 '(compilation-line-number ((t (:foreground "#81A1C1"))))

 '(org-todo ((t (:foreground "#A3BE8C" :bold inherit))))
 '(org-done ((t (:inherit org-headline-done :weight bold))))
 '(org-headline-done ((t (:foreground "#4C566A"))))
 '(org-date ((t (:foreground "#EBCB8B"))))
 '(org-link ((t (:inherit link :foreground "#81A1C1"))))
 '(org-block ((t (:background "#373E4C" :extend t))))
 '(org-block-begin-line ((t (:inherit org-block :foreground "#6f7787"))))
 '(org-block-end-line ((t (:inherit org-block-begin-line))))
 '(org-code ((t (:inherit org-block :foreground "#D08770"))))
 '(org-verbatim ((t (:foreground "#A3BE8C"))))

 '(outline-1 ((t (:foreground "#81A1C1" :weight bold :extend t))))
 '(outline-2 ((t (:foreground "#B48EAD" :weight bold :extend t))))
 '(outline-3 ((t (:foreground "#5D80AE" :weight bold :extend t))))
 '(outline-4 ((t (:foreground "#a0b8d0" :weight bold :extend t))))
 '(outline-5 ((t (:foreground "#c6aac1" :weight bold :extend t))))
 '(outline-6 ((t (:foreground "#c0d0e0" :weight bold :extend t))))
 '(outline-7 ((t (:foreground "#d9c6d6" :weight bold :extend t))))
 '(outline-8 ((t (:foreground "#e5ecf2" :weight bold :extend t))))

 '(dired-directory ((t (:foreground "#81A1C1"))))
 '(dired-symlink ((t (:foreground "#88C0D0" :weight bold))))
 '(dired-header ((t (:foreground "#81A1C1" :weight bold))))

 '(eshell-prompt ((t (:foreground "#81A1C1" :weight bold))))
 '(eshell-ls-directory ((t (:foreground "#81A1C1"))))
 '(eshell-ls-executable ((t (:foreground "#A3BE8C"))))
 '(eshell-ls-symlink ((t (:foreground "#88C0D0"))))

 '(company-tooltip ((t (:inherit tooltip))))
 '(company-tooltip-selection ((t (:background "#5E81AC" :weight bold))))
 '(company-tooltip-common ((t (:foreground "#81A1C1" :distant-foreground "#191C25" :weight bold))))
 '(company-scrollbar-fg ((t (:background "#81A1C1"))))
 '(company-scrollbar-bg ((t (:inherit tooltip))))

 '(corfu-default ((t (:inherit tooltip))))
 '(corfu-current ((t (:background "#2E3440" :foreground "#ECEFF4"))))
 '(corfu-bar ((t (:background "#4C566A"))))
 '(corfu-border ((t (:background "#434C5E"))))
 '(corfu-annotations ((t (:foreground "#6f7787"))))
 '(corfu-deprecated ((t (:foreground "#4C566A" :strike-through t))))
 '(corfu-echo ((t (:foreground "#6f7787"))))
 '(corfu-popupinfo ((t (:background "#272C36" :foreground "#ECEFF4"))))

 '(flycheck-error ((t (:underline (:style wave :color "#BF616A")))))
 '(flycheck-warning ((t (:underline (:style wave :color "#EBCB8B")))))
 '(flycheck-info ((t (:underline (:style wave :color "#A3BE8C")))))

 '(git-gutter:added ((t (:inherit fringe :foreground "#A3BE8C"))))
 '(git-gutter:deleted ((t (:inherit fringe :foreground "#BF616A"))))
 '(git-gutter:modified ((t (:inherit fringe :foreground "#D08770"))))

 '(magit-branch-current ((t (:foreground "#81A1C1"))))
 '(magit-branch-local ((t (:foreground "#88C0D0"))))
 '(magit-branch-remote ((t (:foreground "#A3BE8C"))))
 '(magit-branch-upstream ((t (:foreground "#A3BE8C"))))
 '(magit-tag ((t (:foreground "#EBCB8B"))))
 '(magit-hash ((t (:foreground "#6f7787"))))
 '(magit-section-heading ((t (:foreground "#81A1C1" :weight bold :extend t))))
 '(magit-section-highlight ((t (:inherit hl-line))))
 '(magit-section-heading-selection ((t (:foreground "#D08770" :weight bold :extend t))))
 '(magit-diff-file-heading ((t (:foreground "#ECEFF4" :weight bold :extend t))))
 '(magit-diff-file-heading-highlight ((t (:background "#373E4C" :foreground "#ECEFF4"))))
 '(magit-diff-hunk-heading ((t (:foreground "#2E3440" :background "#3c4a61" :extend t))))
 '(magit-diff-hunk-heading-highlight ((t (:foreground "#2E3440" :background "#5D80AE" :weight bold :extend t))))
 '(magit-diff-context ((t (:foreground "#8d8f92" :background "#2E3440" :extend t))))
 '(magit-diff-context-highlight ((t (:foreground "#ECEFF4" :background "#272C36" :extend t))))
 '(magit-diff-added ((t (:foreground "#829870" :background "#394147" :extend t))))
 '(magit-diff-added-highlight ((t (:foreground "#A3BE8C" :background "#454f4f" :weight bold :extend t))))
 '(magit-diff-removed ((t (:foreground "#984d54" :background "#44414f" :extend t))))
 '(magit-diff-removed-highlight ((t (:foreground "#BF616A" :background "#524552" :weight bold :extend t))))
 '(magit-diffstat-added ((t (:foreground "#A3BE8C"))))
 '(magit-diffstat-removed ((t (:foreground "#BF616A"))))
 '(magit-log-author ((t (:foreground "#D08770"))))
 '(magit-log-date ((t (:foreground "#81A1C1"))))
 '(magit-log-graph ((t (:foreground "#6f7787"))))
 '(magit-process-ok ((t (:inherit success))))
 '(magit-process-ng ((t (:inherit error))))

 '(vertico-current ((t (:background "#434C5E" :extend t))))
 '(vertico-group-title ((t (:foreground "#6f7787" :weight bold))))
 '(vertico-group-separator ((t (:foreground "#434C5E" :strike-through t))))
 '(vertico-multiline ((t (:foreground "#6f7787"))))
 '(vertico-quick1 ((t (:background "#272C36" :foreground "#81A1C1" :weight bold))))
 '(vertico-quick2 ((t (:background "#272C36" :foreground "#A3BE8C" :weight bold))))

 '(orderless-match-face-0 ((t (:weight bold :foreground "#abc0d5" :background "#363e4c"))))
 '(orderless-match-face-1 ((t (:weight bold :foreground "#cab4c9" :background "#3b3d4a"))))
 '(orderless-match-face-2 ((t (:weight bold :foreground "#c0d1b5" :background "#394147"))))
 '(orderless-match-face-3 ((t (:weight bold :foreground "#ebd9b5" :background "#404347"))))

 '(marginalia-documentation ((t (:inherit font-lock-doc-face))))
 '(marginalia-key ((t (:foreground "#A3BE8C"))))
 '(marginalia-type ((t (:foreground "#5D80AE"))))
 '(marginalia-char ((t (:foreground "#81A1C1"))))
 '(marginalia-lighter ((t (:foreground "#5D80AE"))))
 '(marginalia-on ((t (:foreground "#A3BE8C"))))
 '(marginalia-off ((t (:foreground "#BF616A"))))

 '(consult-file ((t (:foreground "#ECEFF4"))))
 '(consult-bookmark ((t (:foreground "#81A1C1"))))
 '(consult-async-running ((t (:foreground "#81A1C1"))))
 '(consult-async-finished ((t (:foreground "#A3BE8C"))))
 '(consult-async-failed ((t (:foreground "#BF616A"))))
 '(consult-preview-line ((t (:background "#373E4C"))))
 '(consult-preview-match ((t (:background "#5E81AC"))))

 '(ivy-current-match ((t (:background "#434C5E" :extend t :weight semi-bold))))
 '(ivy-minibuffer-match-face-1 ((t (:foreground "#5d6574" :weight light))))
 '(helm-selection ((t (:inherit bold :background "#5E81AC" :extend t :distant-foreground "#81A1C1"))))
 '(helm-match ((t (:inherit bold :foreground "#81A1C1" :distant-foreground "#F0F4FC"))))

 '(term-color-black ((t (:background "#191C25" :foreground "#191C25"))))
 '(term-color-red ((t (:background "#BF616A" :foreground "#BF616A"))))
 '(term-color-green ((t (:background "#A3BE8C" :foreground "#A3BE8C"))))
 '(term-color-yellow ((t (:background "#EBCB8B" :foreground "#EBCB8B"))))
 '(term-color-blue ((t (:background "#81A1C1" :foreground "#81A1C1"))))
 '(term-color-magenta ((t (:background "#B48EAD" :foreground "#B48EAD"))))
 '(term-color-cyan ((t (:background "#88C0D0" :foreground "#88C0D0"))))
 '(term-color-white ((t (:background "#F0F4FC" :foreground "#F0F4FC"))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#81A1C1"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#B48EAD"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#A3BE8C"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#5D80AE"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#8FBCBB"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#81A1C1"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#B48EAD"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#A3BE8C"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#5D80AE"))))

 '(lsp-face-highlight-textual ((t (:weight bold :background "#373E4C" :foreground "#191C25" :distant-foreground "#F0F4FC"))))
 '(lsp-face-highlight-read ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-face-highlight-write ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-ui-doc-background ((t (:inherit tooltip))))
 '(lsp-ui-peek-selection ((t (:foreground "#2E3440" :background "#81A1C1" :bold t))))
 '(lsp-ui-sideline-code-action ((t (:foreground "#7490ad"))))

 '(which-key-key-face ((t (:foreground "#A3BE8C"))))
 '(which-key-command-description-face ((t (:foreground "#81A1C1"))))

 '(web-mode-html-tag-face ((t (:foreground "#88C0D0"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#8FBCBB"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#A3BE8C"))))
 '(web-mode-css-property-name-face ((t (:foreground "#8FBCBB"))))

 '(js2-function-param ((t (:foreground "#D8DEE9"))))
 '(js2-function-call ((t (:foreground "#88C0D0"))))
 '(js2-object-property ((t (:foreground "#5D80AE"))))
 '(js2-jsdoc-tag ((t (:foreground "#78808f"))))
 '(js2-external-variable ((t (:foreground "#81A1C1"))))

 '(markdown-bold-face ((t (:inherit bold :foreground "#D08770"))))
 '(markdown-italic-face ((t (:inherit italic :foreground "#5D80AE"))))
 '(markdown-link-face ((t (:foreground "#81A1C1"))))
 '(markdown-url-face ((t (:foreground "#B48EAD" :weight normal))))
 '(markdown-code-face ((t (:background "#414754" :extend t))))
 '(markdown-blockquote-face ((t (:inherit italic :foreground "#78808f"))))

 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))
 '(treemacs-directory-face ((t (:foreground "#ECEFF4"))))
 '(treemacs-file-face ((t (:foreground "#ECEFF4"))))
 '(treemacs-tags-face ((t (:foreground "#81A1C1"))))
 '(treemacs-fringe-indicator-face ((t (:foreground "#81A1C1"))))
 '(treemacs-git-added-face ((t (:foreground "#A3BE8C"))))
 '(treemacs-git-modified-face ((t (:foreground "#EBCB8B"))))
 '(treemacs-git-conflict-face ((t (:foreground "#BF616A"))))
 '(treemacs-git-untracked-face ((t (:foreground "#A3BE8C"))))
 '(treemacs-git-renamed-face ((t (:foreground "#EBCB8B"))))
 '(treemacs-git-ignored-face ((t (:foreground "#4C566A"))))
 '(treemacs-on-success-pulse-face ((t (:foreground "#191C25" :background "#A3BE8C" :extend t))))
 '(treemacs-on-failure-pulse-face ((t (:foreground "#191C25" :background "#BF616A" :extend t))))

 '(window-divider ((t (:inherit vertical-border))))
 '(window-divider-first-pixel ((t (:inherit window-divider))))
 '(window-divider-last-pixel ((t (:inherit window-divider))))

 '(error ((t (:foreground "#BF616A"))))
 '(warning ((t (:foreground "#EBCB8B"))))
 '(success ((t (:foreground "#A3BE8C"))))

 ;; Man
 '(Man-overstrike ((t (:inherit bold :foreground "#81A1C1"))))
 '(Man-underline ((t (:inherit underline :foreground "#81A1C1"))))

 ;; ansi
 '(ansi-color-black ((t (:foreground "#2E3440" :background "#2E3440"))))
 '(ansi-color-blue ((t (:foreground "#81A1C1" :background "#81A1C1"))))
 '(ansi-color-bright-black ((t (:foreground "#434C5E" :background "#434C5E"))))
 '(ansi-color-bright-blue ((t (:foreground "#93afca" :background "#93afca"))))
 '(ansi-color-bright-cyan ((t (:foreground "#99c9d7" :background "#99c9d7"))))
 '(ansi-color-bright-green ((t (:foreground "#b0c79d" :background "#b0c79d"))))
 '(ansi-color-bright-magenta ((t (:foreground "#bf9eb9" :background "#bf9eb9"))))
 '(ansi-color-bright-red ((t (:foreground "#c87880" :background "#c87880"))))
 '(ansi-color-bright-white ((t (:foreground "#F0F4FC" :background "#F0F4FC"))))
 '(ansi-color-bright-yellow ((t (:foreground "#edd29c" :background "#edd29c"))))
 '(ansi-color-cyan ((t (:foreground "#88C0D0" :background "#88C0D0"))))
 '(ansi-color-green ((t (:foreground "#A3BE8C" :background "#A3BE8C"))))
 '(ansi-color-magenta ((t (:foreground "#B48EAD" :background "#B48EAD"))))
 '(ansi-color-red ((t (:foreground "#BF616A" :background "#BF616A"))))
 '(ansi-color-white ((t (:foreground "#ECEFF4" :background "#ECEFF4"))))
 '(ansi-color-yellow ((t (:foreground "#EBCB8B" :background "#EBCB8B"))))

 ;; avy
 '(avy-background-face ((t (:foreground "#6f7787"))))
 '(avy-lead-face ((t (:background "#81A1C1" :foreground "#2E3440" :distant-foreground "#ECEFF4" :weight bold))))
 '(avy-lead-face-0 ((t (:inherit avy-lead-face :background "#a6bdd3"))))
 '(avy-lead-face-1 ((t (:inherit avy-lead-face :background "#ccd9e6"))))
 '(avy-lead-face-2 ((t (:inherit avy-lead-face :background "#f2f5f8"))))

 ;; bold
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:inherit (bold italic)))))

 ;; bookmark
 '(bookmark-face ((t (:background "#363e4c" :extend t))))

 ;; cider
 '(cider-debug-code-overlay-face ((t (:background "#373E4C"))))
 '(cider-deprecated-face ((t (:background "#53524f"))))
 '(cider-enlightened-face ((t (:inherit cider-result-overlay-face :box (:color "#D08770" :line-width -1)))))
 '(cider-enlightened-local-face ((t (:foreground "#D08770" :weight bold))))
 '(cider-error-highlight-face ((t (:underline (:style wave :color "#BF616A")))))
 '(cider-fringe-good-face ((t (:foreground "#A3BE8C"))))
 '(cider-instrumented-face ((t (:background "#4a3c48"))))
 '(cider-result-overlay-face ((t (:background "#373E4C" :box (:line-width -1 :color "#4C566A")))))
 '(cider-test-error-face ((t (:background "#D08770"))))
 '(cider-test-failure-face ((t (:background "#59414c"))))
 '(cider-test-success-face ((t (:foreground "#191C25" :background "#A3BE8C"))))
 '(cider-traced-face ((t (:background "#40505c"))))
 '(cider-warning-highlight-face ((t (:underline (:style wave :color "#EBCB8B")))))

 ;; compilation
 '(compilation-column-number ((t (:inherit font-lock-comment-face))))
 '(compilation-mode-line-exit ((t (:inherit compilation-info))))
 '(compilation-mode-line-fail ((t (:inherit compilation-error))))

 ;; custom
 '(custom-button ((t (:foreground "#81A1C1" :background "#2E3440" :box (:line-width 1 :style nil)))))
 '(custom-button-mouse ((t (:foreground "#2E3440" :background "#81A1C1" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed ((t (:foreground "#2E3440" :background "#81A1C1" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed-unraised ((t (:foreground "#2E3440" :background "#5D80AE" :box (:line-width 1 :style nil)))))
 '(custom-button-unraised ((t (:foreground "#5D80AE" :background "#2E3440" :box (:line-width 1 :style nil)))))
 '(custom-changed ((t (:foreground "#81A1C1" :background "#2E3440"))))
 '(custom-comment ((t (:foreground "#ECEFF4" :background "#434C5E"))))
 '(custom-comment-tag ((t (:foreground "#434C5E"))))
 '(custom-group-subtitle ((t (:foreground "#BF616A"))))
 '(custom-group-tag ((t (:foreground "#5D80AE"))))
 '(custom-group-tag-1 ((t (:foreground "#81A1C1"))))
 '(custom-invalid ((t (:foreground "#BF616A" :background "#4b3d48"))))
 '(custom-modified ((t (:foreground "#81A1C1" :background "#3e4959"))))
 '(custom-saved ((t (:foreground "#A3BE8C" :background "#454f4f" :bold t))))
 '(custom-set ((t (:foreground "#EBCB8B" :background "#2E3440"))))
 '(custom-state ((t (:foreground "#A3BE8C" :background "#454f4f"))))
 '(custom-themed ((t (:foreground "#EBCB8B" :background "#2E3440"))))
 '(custom-variable-button ((t (:foreground "#A3BE8C" :underline t))))
 '(custom-variable-obsolete ((t (:foreground "#434C5E" :background "#2E3440"))))
 '(custom-variable-tag ((t (:foreground "#B48EAD"))))
 '(custom-visibility ((t (:foreground "#81A1C1"))))

 ;; diff
 '(diff-context ((t (:foreground "#cfd2d6"))))
 '(diff-hl-change ((t (:foreground "#D08770" :background "#D08770"))))
 '(diff-hl-delete ((t (:foreground "#BF616A" :background "#BF616A"))))
 '(diff-hl-insert ((t (:foreground "#A3BE8C" :background "#A3BE8C"))))
 '(diff-hunk-header ((t (:foreground "#5D80AE"))))
 '(diff-indicator-added ((t (:foreground "#A3BE8C"))))
 '(diff-indicator-changed ((t (:foreground "#D08770"))))
 '(diff-indicator-removed ((t (:foreground "#BF616A"))))
 '(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
 '(diff-refine-changed ((t (:inherit diff-changed :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-removed :inverse-video t))))

 ;; dired
 '(dired-flagged ((t (:foreground "#BF616A"))))
 '(dired-ignored ((t (:foreground "#6f7787"))))
 '(dired-k-added ((t (:foreground "#A3BE8C" :weight bold))))
 '(dired-k-commited ((t (:foreground "#A3BE8C" :weight bold))))
 '(dired-k-directory ((t (:foreground "#81A1C1" :weight bold))))
 '(dired-k-ignored ((t (:foreground "#4C566A" :weight bold))))
 '(dired-k-modified ((t (:foreground "#D08770" :weight bold))))
 '(dired-k-untracked ((t (:foreground "#8FBCBB" :weight bold))))
 '(dired-mark ((t (:foreground "#D08770" :weight bold))))
 '(dired-marked ((t (:foreground "#B48EAD" :weight bold :inverse-video t))))
 '(dired-perm-write ((t (:foreground "#ECEFF4" :underline t))))
 '(dired-subtree-depth-1-face ((t (:background "#262b34"))))
 '(dired-subtree-depth-2-face ((t (:background "#252a33"))))
 '(dired-subtree-depth-3-face ((t (:background "#242932"))))
 '(dired-subtree-depth-4-face ((t (:background "#232831"))))
 '(dired-subtree-depth-5-face ((t (:background "#232730"))))
 '(dired-subtree-depth-6-face ((t (:background "#22262f"))))
 '(dired-warning ((t (:foreground "#EBCB8B"))))

 ;; ediff
 '(ediff-current-diff-A ((t (:foreground "#BF616A" :background "#524552" :extend t))))
 '(ediff-current-diff-B ((t (:foreground "#A3BE8C" :background "#454f4f" :extend t))))
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
 '(elfeed-log-debug-level-face ((t (:foreground "#6f7787"))))
 '(elfeed-log-error-level-face ((t (:inherit error))))
 '(elfeed-log-info-level-face ((t (:inherit success))))
 '(elfeed-log-warn-level-face ((t (:inherit warning))))
 '(elfeed-search-date-face ((t (:foreground "#5D80AE"))))
 '(elfeed-search-feed-face ((t (:foreground "#81A1C1"))))
 '(elfeed-search-filter-face ((t (:foreground "#5D80AE"))))
 '(elfeed-search-tag-face ((t (:foreground "#6f7787"))))
 '(elfeed-search-title-face ((t (:foreground "#6f7787"))))
 '(elfeed-search-unread-count-face ((t (:foreground "#EBCB8B"))))
 '(elfeed-search-unread-title-face ((t (:foreground "#ECEFF4" :weight bold))))

 ;; elixir
 '(elixir-atom-face ((t (:foreground "#5E81AC"))))
 '(elixir-attribute-face ((t (:foreground "#5D80AE"))))

 ;; escape
 '(escape-glyph ((t (:foreground "#88C0D0"))))

 ;; eshell
 '(eshell-ls-archive ((t (:foreground "#B48EAD"))))
 '(eshell-ls-backup ((t (:foreground "#EBCB8B"))))
 '(eshell-ls-clutter ((t (:foreground "#BF616A"))))
 '(eshell-ls-missing ((t (:foreground "#BF616A"))))
 '(eshell-ls-product ((t (:foreground "#D08770"))))
 '(eshell-ls-readonly ((t (:foreground "#D08770"))))
 '(eshell-ls-special ((t (:foreground "#5D80AE"))))
 '(eshell-ls-unreadable ((t (:foreground "#4C566A"))))

 ;; flycheck
 '(flycheck-fringe-error ((t (:inherit fringe :foreground "#BF616A"))))
 '(flycheck-fringe-info ((t (:inherit fringe :foreground "#A3BE8C"))))
 '(flycheck-fringe-warning ((t (:inherit fringe :foreground "#EBCB8B"))))
 '(flycheck-posframe-background-face ((t (:background "#272C36"))))
 '(flycheck-posframe-error-face ((t (:inherit flycheck-posframe-face :foreground "#BF616A"))))
 '(flycheck-posframe-face ((t (:inherit default))))
 '(flycheck-posframe-info-face ((t (:inherit flycheck-posframe-face :foreground "#A3BE8C"))))
 '(flycheck-posframe-warning-face ((t (:inherit flycheck-posframe-face :foreground "#EBCB8B"))))

 ;; flymake
 '(flymake-error ((t (:underline (:style wave :color "#BF616A")))))
 '(flymake-note ((t (:underline (:style wave :color "#A3BE8C")))))
 '(flymake-warning ((t (:underline (:style wave :color "#D08770")))))

 ;; font
 '(font-latex-bold-face ((t (:inherit bold))))
 '(font-latex-italic-face ((t (:inherit italic))))
 '(font-latex-math-face ((t (:foreground "#81A1C1"))))
 '(font-latex-script-char-face ((t (:foreground "#5E81AC"))))
 '(font-latex-sectioning-0-face ((t (:foreground "#81A1C1" :weight ultra-bold))))
 '(font-latex-sectioning-1-face ((t (:foreground "#B48EAD" :weight semi-bold))))
 '(font-latex-sectioning-2-face ((t (:foreground "#5D80AE" :weight semi-bold))))
 '(font-latex-sectioning-3-face ((t (:foreground "#a6bdd3" :weight semi-bold))))
 '(font-latex-sectioning-4-face ((t (:foreground "#caafc5" :weight semi-bold))))
 '(font-latex-sectioning-5-face ((t (:foreground "#8da6c6" :weight semi-bold))))
 '(font-latex-sedate-face ((t (:inherit font-lock-keyword-face))))
 '(font-latex-string-face ((t (:inherit font-lock-string-face))))
 '(font-latex-underline-face ((t (:inherit underline))))
 '(font-latex-verbatim-face ((t (:inherit fixed-pitch :foreground "#5D80AE" :slant normal))))
 '(font-latex-warning-face ((t (:inherit font-lock-warning-face))))
 '(font-lock-escape-face ((t (:inherit font-lock-regexp-grouping-backslash))))
 '(font-lock-function-call-face ((t (:inherit font-lock-function-name-face :slant normal :foreground "#a6ceda"))))
 '(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-number-face ((t (:foreground "#B48EAD"))))
 '(font-lock-preprocessor-char-face ((t (:inherit bold :foreground "#81A1C1"))))
 '(font-lock-property-name-face ((t (:foreground "#abc0d5" :weight bold))))
 '(font-lock-property-use-face ((t (:inherit font-lock-property-name-face :weight regular))))
 '(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face :foreground unspecified))))

 ;; git
 '(git-commit-comment-branch-local ((t (:foreground "#B48EAD"))))
 '(git-commit-comment-branch-remote ((t (:foreground "#A3BE8C"))))
 '(git-commit-comment-detached ((t (:foreground "#D08770"))))
 '(git-commit-comment-file ((t (:foreground "#5D80AE"))))
 '(git-commit-comment-heading ((t (:foreground "#81A1C1"))))
 '(git-commit-keyword ((t (:foreground "#88C0D0" :slant normal))))
 '(git-commit-known-pseudo-header ((t (:foreground "#78808f" :weight bold :slant normal))))
 '(git-commit-nonempty-second-line ((t (:inherit git-commit-overlong-summary))))
 '(git-commit-overlong-summary ((t (:inherit error :background "#191C25" :slant normal :weight bold))))
 '(git-commit-pseudo-header ((t (:foreground "#78808f" :slant normal))))
 '(git-commit-summary ((t (:foreground "#A3BE8C"))))
 '(git-gutter+-added ((t (:inherit fringe :foreground "#A3BE8C"))))
 '(git-gutter+-deleted ((t (:inherit fringe :foreground "#BF616A"))))
 '(git-gutter+-modified ((t (:inherit fringe :foreground "#D08770"))))
 '(git-gutter-fr:added ((t (:inherit fringe :foreground "#A3BE8C"))))
 '(git-gutter-fr:deleted ((t (:inherit fringe :foreground "#BF616A"))))
 '(git-gutter-fr:modified ((t (:inherit fringe :foreground "#D08770"))))

 ;; header
 '(header-line-highlight ((t (:inherit mode-line-highlight))))

 ;; hi
 '(hi-blue ((t (:background "#81A1C1"))))
 '(hi-blue-b ((t (:foreground "#81A1C1" :weight bold))))
 '(hi-green ((t (:background "#A3BE8C"))))
 '(hi-green-b ((t (:foreground "#A3BE8C" :weight bold))))
 '(hi-pink ((t (:background "#B48EAD"))))
 '(hi-red-b ((t (:foreground "#BF616A" :weight bold))))
 '(hi-yellow ((t (:background "#EBCB8B"))))

 ;; highlight
 '(highlight-indentation-current-column-face ((t (:background "#242832"))))
 '(highlight-indentation-face ((t (:inherit hl-line))))
 '(highlight-indentation-guides-even-face ((t (:inherit highlight-indentation-face))))
 '(highlight-indentation-guides-odd-face ((t (:inherit highlight-indentation-face))))
 '(highlight-numbers-number ((t (:inherit bold :foreground "#B48EAD"))))
 '(highlight-quoted-quote ((t (:foreground "#81A1C1"))))
 '(highlight-quoted-symbol ((t (:foreground "#8FBCBB"))))
 '(highlight-symbol-face ((t (:background "#555d6e" :distant-foreground "#E5E9F0"))))
 '(highlight-thing ((t (:background "#555d6e" :distant-foreground "#E5E9F0"))))

 ;; hl
 '(hl-fill-column-face ((t (:inherit (hl-line shadow)))))
 '(hl-todo ((t (:foreground "#BF616A" :weight bold))))

 ;; imenu
 '(imenu-list-entry-face-0 ((t (:foreground "#81A1C1"))))
 '(imenu-list-entry-face-1 ((t (:foreground "#A3BE8C"))))
 '(imenu-list-entry-face-2 ((t (:foreground "#EBCB8B"))))
 '(imenu-list-entry-subalist-face-0 ((t (:inherit imenu-list-entry-face-0 :weight bold))))
 '(imenu-list-entry-subalist-face-1 ((t (:inherit imenu-list-entry-face-1 :weight bold))))
 '(imenu-list-entry-subalist-face-2 ((t (:inherit imenu-list-entry-face-2 :weight bold))))

 ;; indent
 '(indent-guide-face ((t (:inherit hl-line))))

 ;; isearch
 '(isearch-fail ((t (:background "#BF616A" :foreground "#191C25" :weight bold))))

 ;; italic
 '(italic ((t (:slant normal))))

 ;; lsp
 '(lsp-headerline-breadcrumb-separator-face ((t (:inherit shadow))))
 '(lsp-ui-peek-filename ((t (:inherit mode-line-buffer-id))))
 '(lsp-ui-peek-header ((t (:foreground "#ECEFF4" :background "#424853" :bold t))))
 '(lsp-ui-peek-highlight ((t (:inherit isearch :box t))))
 '(lsp-ui-peek-line-number ((t (:foreground "#A3BE8C"))))
 '(lsp-ui-peek-list ((t (:background "#292e39"))))
 '(lsp-ui-peek-peek ((t (:background "#292e39"))))
 '(lsp-ui-sideline-current-symbol ((t (:inherit highlight))))
 '(lsp-ui-sideline-symbol-info ((t (:foreground "#656c7c" :background "#272C36" :extend t))))

 ;; magit
 '(magit-bisect-bad ((t (:foreground "#BF616A"))))
 '(magit-bisect-good ((t (:foreground "#A3BE8C"))))
 '(magit-bisect-skip ((t (:foreground "#D08770"))))
 '(magit-blame-date ((t (:foreground "#BF616A"))))
 '(magit-blame-hash ((t (:foreground "#88C0D0"))))
 '(magit-blame-heading ((t (:foreground "#D08770" :background "#373E4C" :extend t))))
 '(magit-cherry-equivalent ((t (:foreground "#5D80AE"))))
 '(magit-cherry-unmatched ((t (:foreground "#88C0D0"))))
 '(magit-diff-base ((t (:foreground "#a66c59" :background "#3e3c44" :extend t))))
 '(magit-diff-base-highlight ((t (:foreground "#D08770" :background "#4e4449" :weight bold :extend t))))
 '(magit-diff-file-heading-selection ((t (:foreground "#B48EAD" :background "#5E81AC" :weight bold :extend t))))
 '(magit-diff-lines-heading ((t (:foreground "#EBCB8B" :background "#BF616A" :extend t :extend t))))
 '(magit-dimmed ((t (:foreground "#E5E9F0"))))
 '(magit-filename ((t (:foreground "#5D80AE"))))
 '(magit-header-line ((t (:background "#5E81AC" :foreground "#F0F4FC" :weight bold :box (:line-width 3 :color "#5E81AC")))))
 '(magit-reflog-amend ((t (:foreground "#B48EAD"))))
 '(magit-reflog-checkout ((t (:foreground "#81A1C1"))))
 '(magit-reflog-cherry-pick ((t (:foreground "#A3BE8C"))))
 '(magit-reflog-commit ((t (:foreground "#A3BE8C"))))
 '(magit-reflog-merge ((t (:foreground "#A3BE8C"))))
 '(magit-reflog-other ((t (:foreground "#88C0D0"))))
 '(magit-reflog-rebase ((t (:foreground "#B48EAD"))))
 '(magit-reflog-remote ((t (:foreground "#88C0D0"))))
 '(magit-reflog-reset ((t (:inherit error))))
 '(magit-refname ((t (:foreground "#6f7787"))))
 '(magit-section-secondary-heading ((t (:foreground "#5D80AE" :weight bold :extend t))))
 '(magit-sequence-drop ((t (:foreground "#BF616A"))))
 '(magit-sequence-head ((t (:foreground "#81A1C1"))))
 '(magit-sequence-part ((t (:foreground "#D08770"))))
 '(magit-sequence-stop ((t (:foreground "#A3BE8C"))))
 '(magit-signature-bad ((t (:inherit error))))
 '(magit-signature-error ((t (:inherit error))))
 '(magit-signature-expired ((t (:foreground "#D08770"))))
 '(magit-signature-good ((t (:inherit success))))
 '(magit-signature-revoked ((t (:foreground "#B48EAD"))))
 '(magit-signature-untrusted ((t (:foreground "#EBCB8B"))))

 ;; makefile
 '(makefile-targets ((t (:foreground "#81A1C1"))))

 ;; marginalia
 '(marginalia-file-priv-dir ((t (:foreground "#81A1C1"))))
 '(marginalia-file-priv-exec ((t (:foreground "#A3BE8C"))))
 '(marginalia-file-priv-link ((t (:foreground "#5D80AE"))))
 '(marginalia-file-priv-other ((t (:foreground "#B48EAD"))))
 '(marginalia-file-priv-rare ((t (:foreground "#ECEFF4"))))
 '(marginalia-file-priv-read ((t (:foreground "#EBCB8B"))))
 '(marginalia-file-priv-write ((t (:foreground "#BF616A"))))
 '(marginalia-number ((t (:foreground "#B48EAD"))))
 '(marginalia-size ((t (:foreground "#5D80AE"))))

 ;; markdown
 '(markdown-header-delimiter-face ((t (:inherit markdown-header-face))))
 '(markdown-header-face ((t (:inherit bold :foreground "#BF616A"))))
 '(markdown-html-attr-name-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-attr-value-face ((t (:inherit font-lock-string-face))))
 '(markdown-html-entity-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-tag-delimiter-face ((t (:inherit markdown-markup-face))))
 '(markdown-html-tag-name-face ((t (:inherit font-lock-keyword-face))))
 '(markdown-inline-code-face ((t (:inherit (markdown-code-face markdown-pre-face)))))
 '(markdown-list-face ((t (:foreground "#BF616A"))))
 '(markdown-markup-face ((t (:foreground "#4C566A"))))
 '(markdown-metadata-key-face ((t (:foreground "#BF616A"))))
 '(markdown-pre-face ((t (:foreground "#A3BE8C"))))
 '(markdown-reference-face ((t (:foreground "#78808f"))))

 ;; mc/cursor
 '(mc/cursor-face ((t (:inherit cursor))))

 ;; message
 '(message-cited-text ((t (:foreground "#5D80AE"))))
 '(message-cited-text-1 ((t (:foreground "#EBCB8B"))))
 '(message-cited-text-2 ((t (:foreground "#B48EAD"))))
 '(message-cited-text-3 ((t (:foreground "#A3BE8C"))))
 '(message-cited-text-4 ((t (:foreground "#A3BE8C"))))
 '(message-header-cc ((t (:inherit message-header-to :foreground "#6d88a4"))))
 '(message-header-name ((t (:foreground "#A3BE8C"))))
 '(message-header-newsgroups ((t (:foreground "#EBCB8B"))))
 '(message-header-other ((t (:foreground "#5D80AE"))))
 '(message-header-subject ((t (:foreground "#81A1C1" :weight bold))))
 '(message-header-to ((t (:foreground "#81A1C1" :weight bold))))
 '(message-header-xheader ((t (:foreground "#78808f"))))
 '(message-mml ((t (:foreground "#6f7787" :slant normal))))
 '(message-separator ((t (:foreground "#6f7787"))))

 ;; mode
 '(mode-line-active ((t (:inherit mode-line))))

 ;; nobreak
 '(nobreak-space ((t (:inherit escape-glyph :underline t))))

 ;; org
 '(org-agenda-clocking ((t (:background "#3e4959"))))
 '(org-agenda-date ((t (:foreground "#5D80AE" :weight ultra-bold))))
 '(org-agenda-date-today ((t (:foreground "#9db2ce" :weight ultra-bold))))
 '(org-agenda-date-weekend ((t (:foreground "#374c68" :weight ultra-bold))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "#6f7787"))))
 '(org-agenda-done ((t (:inherit org-done))))
 '(org-agenda-structure ((t (:foreground "#ECEFF4" :weight ultra-bold))))
 '(org-archived ((t (:foreground "#78808f"))))
 '(org-block-background ((t (:background "#373E4C" :extend t))))
 '(org-checkbox ((t (:inherit org-todo))))
 '(org-checkbox-statistics-done ((t (:inherit org-done))))
 '(org-checkbox-statistics-todo ((t (:inherit org-todo))))
 '(org-cite ((t (:foreground "#98c1c0"))))
 '(org-cite-key ((t (:foreground "#b4d0d1" :underline t))))
 '(org-default ((t (:inherit variable-pitch))))
 '(org-document-info ((t (:foreground "#81A1C1"))))
 '(org-document-title ((t (:foreground "#81A1C1" :weight bold))))
 '(org-drawer ((t (:foreground "#6f7787"))))
 '(org-ellipsis ((t (:foreground "#6f7787"))))
 '(org-footnote ((t (:foreground "#D08770"))))
 '(org-formula ((t (:foreground "#88C0D0"))))
 '(org-habit-alert-face ((t (:weight bold :background "#897b60"))))
 '(org-habit-alert-future-face ((t (:weight bold :background "#615b4f"))))
 '(org-habit-clear-face ((t (:weight bold :background "#434C5E"))))
 '(org-habit-clear-future-face ((t (:weight bold :background "#373E4C"))))
 '(org-habit-overdue-face ((t (:weight bold :background "#734650"))))
 '(org-habit-overdue-future-face ((t (:weight bold :background "#543b45"))))
 '(org-habit-ready-face ((t (:weight bold :background "#54667b"))))
 '(org-habit-ready-future-face ((t (:weight bold :background "#414f5f"))))
 '(org-hide ((t (:foreground "#2E3440"))))
 '(org-journal-calendar-entry-face ((t (:foreground "#B48EAD" :slant normal))))
 '(org-journal-calendar-scheduled-face ((t (:foreground "#BF616A" :slant normal))))
 '(org-journal-highlight ((t (:foreground "#81A1C1"))))
 '(org-latex-and-related ((t (:foreground "#F0F4FC" :weight bold))))
 '(org-list-dt ((t (:foreground "#81A1C1"))))
 '(org-meta-line ((t (:foreground "#78808f"))))
 '(org-pomodoro-mode-line ((t (:foreground "#BF616A"))))
 '(org-pomodoro-mode-line-overtime ((t (:foreground "#EBCB8B" :weight bold))))
 '(org-priority ((t (:foreground "#BF616A"))))
 '(org-property-value ((t (:foreground "#78808f"))))
 '(org-quote ((t (:inherit org-block :slant normal))))
 '(org-ref-acronym-face ((t (:foreground "#5D80AE"))))
 '(org-ref-cite-face ((t (:foreground "#EBCB8B" :weight light :underline t))))
 '(org-ref-glossary-face ((t (:foreground "#B48EAD"))))
 '(org-ref-label-face ((t (:foreground "#81A1C1"))))
 '(org-ref-ref-face ((t (:inherit link :foreground "#8FBCBB"))))
 '(org-scheduled ((t (:foreground "#ECEFF4"))))
 '(org-scheduled-previously ((t (:foreground "#F0F4FC"))))
 '(org-scheduled-today ((t (:foreground "#D8DEE9"))))
 '(org-sexp-date ((t (:foreground "#ECEFF4"))))
 '(org-special-keyword ((t (:foreground "#78808f"))))
 '(org-table ((t (:foreground "#5D80AE"))))
 '(org-tag ((t (:foreground "#78808f" :weight normal))))
 '(org-time-grid ((t (:foreground "#6f7787"))))
 '(org-upcoming-deadline ((t (:foreground "#c6c9d0"))))
 '(org-upcoming-distant-deadline ((t (:foreground "#8d919a"))))
 '(org-warning ((t (:foreground "#EBCB8B"))))

 ;; paren
 '(paren-face ((t (:foreground "#6f7787"))))
 '(paren-face-match ((t (:foreground "#2E3440" :background "#8FBCBB" :weight ultra-bold))))
 '(paren-face-mismatch ((t (:foreground "#D8DEE9" :background "#BF616A" :weight ultra-bold))))
 '(paren-face-no-match ((t (:inherit paren-face-mismatch :weight ultra-bold))))

 ;; rainbow
 '(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "#BF616A"))))
 '(rainbow-delimiters-base-face ((t (:inherit default))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#BF616A" :weight bold :inverse-video t))))

 ;; sh
 '(sh-heredoc ((t (:inherit font-lock-string-face :weight normal))))
 '(sh-quoted-exec ((t (:inherit font-lock-preprocessor-face))))

 ;; shadow
 '(shadow ((t (:foreground "#4C566A"))))

 ;; smerge
 '(smerge-base ((t (:background "#3e4959"))))
 '(smerge-lower ((t (:background "#454f4f"))))
 '(smerge-markers ((t (:background "#6f7787" :foreground "#2E3440" :distant-foreground "#ECEFF4" :weight bold))))
 '(smerge-mine ((t (:background "#524552"))))
 '(smerge-other ((t (:background "#454f4f"))))
 '(smerge-refined-added ((t (:inherit diff-added :inverse-video t))))
 '(smerge-refined-removed ((t (:inherit diff-removed :inverse-video t))))
 '(smerge-upper ((t (:background "#524552"))))

 ;; symbol
 '(symbol-overlay-default-face ((t (:background "#555d6e" :distant-foreground "#E5E9F0"))))
 '(symbol-overlay-face-1 ((t (:background "#4f5f73" :distant-foreground "#E5E9F0"))))
 '(symbol-overlay-face-2 ((t (:background "#40526c" :distant-foreground "#E5E9F0"))))
 '(symbol-overlay-face-3 ((t (:background "#666156" :distant-foreground "#E5E9F0"))))
 '(symbol-overlay-face-4 ((t (:background "#5e4c4e" :distant-foreground "#E5E9F0"))))
 '(symbol-overlay-face-5 ((t (:background "#59414c" :distant-foreground "#E5E9F0"))))
 '(symbol-overlay-face-6 ((t (:background "#564f60" :distant-foreground "#E5E9F0"))))
 '(symbol-overlay-face-7 ((t (:background "#5c6b5e" :distant-foreground "#E5E9F0"))))
 '(symbol-overlay-face-8 ((t (:background "#40505c" :distant-foreground "#E5E9F0"))))

 ;; tab
 '(tab-bar ((t (:background "#292e39" :foreground "#81A1C1"))))
 '(tab-bar-tab ((t (:background "#2E3440" :foreground "#ECEFF4"))))
 '(tab-bar-tab-inactive ((t (:background "#272C36" :foreground "#5E81AC"))))
 '(tab-line ((t (:background "#292e39" :foreground "#81A1C1"))))
 '(tab-line-close-highlight ((t (:foreground "#81A1C1"))))
 '(tab-line-highlight ((t (:inherit tab-line-tab))))
 '(tab-line-tab ((t (:background "#2E3440" :foreground "#ECEFF4"))))
 '(tab-line-tab-current ((t (:background "#2E3440" :foreground "#ECEFF4"))))
 '(tab-line-tab-inactive ((t (:background "#272C36" :foreground "#5E81AC"))))
 '(tab-line-tab-inactive-alternate ((t (:background "#272C36" :foreground "#5E81AC"))))

 ;; term
 '(term ((t (:foreground "#ECEFF4"))))
 '(term-bold ((t (:weight bold))))

 ;; trailing
 '(trailing-whitespace ((t (:background "#BF616A"))))

 ;; treemacs
 '(treemacs-nerd-icons-file-face ((t (:foreground "#78808f"))))
 '(treemacs-nerd-icons-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))

 ;; typescript
 '(typescript-jsdoc-tag ((t (:foreground "#78808f"))))
 '(typescript-jsdoc-type ((t (:foreground "#656c79"))))
 '(typescript-jsdoc-value ((t (:foreground "#8c939f"))))

 ;; vertico
 '(vertico-posframe-border ((t (:background "#434C5E"))))
 '(vertico-posframe-border-2 ((t (:background "#BF616A"))))
 '(vertico-posframe-border-3 ((t (:background "#A3BE8C"))))
 '(vertico-posframe-border-4 ((t (:background "#81A1C1"))))
 '(vertico-posframe-border-fallback ((t (:background "#EBCB8B"))))

 ;; vterm
 '(vterm-color-black ((t (:background "#52545b" :foreground "#191C25"))))
 '(vterm-color-blue ((t (:background "#a0b8d0" :foreground "#81A1C1"))))
 '(vterm-color-cyan ((t (:background "#a5cfdb" :foreground "#88C0D0"))))
 '(vterm-color-green ((t (:background "#bacea8" :foreground "#A3BE8C"))))
 '(vterm-color-magenta ((t (:background "#c6aac1" :foreground "#B48EAD"))))
 '(vterm-color-red ((t (:background "#cf888f" :foreground "#BF616A"))))
 '(vterm-color-white ((t (:background "#f3f6fc" :foreground "#F0F4FC"))))
 '(vterm-color-yellow ((t (:background "#f0d8a8" :foreground "#EBCB8B"))))

 ;; web
 '(web-mode-block-control-face ((t (:foreground "#D08770"))))
 '(web-mode-block-delimiter-face ((t (:foreground "#81A1C1"))))
 '(web-mode-doctype-face ((t (:foreground "#6f7787"))))
 '(web-mode-html-entity-face ((t (:foreground "#88C0D0" :inherit italic))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#81A1C1"))))
 '(web-mode-json-context-face ((t (:foreground "#A3BE8C"))))
 '(web-mode-json-key-face ((t (:foreground "#A3BE8C"))))
 '(web-mode-keyword-face ((t (:foreground "#81A1C1"))))
 '(web-mode-string-face ((t (:foreground "#A3BE8C"))))
 '(web-mode-type-face ((t (:foreground "#8FBCBB"))))

 ;; which
 '(which-func ((t (:foreground "#81A1C1"))))
 '(which-key-group-description-face ((t (:foreground "#5D80AE"))))
 '(which-key-local-map-description-face ((t (:foreground "#B48EAD"))))

 ;; whitespace
 '(whitespace-empty ((t (:background "#373E4C"))))
 '(whitespace-indentation ((t (:foreground "#434C5E" :background "#373E4C"))))
 '(whitespace-line ((t (:background "#191C25" :foreground "#BF616A" :weight bold))))
 '(whitespace-newline ((t (:foreground "#434C5E"))))
 '(whitespace-space ((t (:foreground "#434C5E"))))
 '(whitespace-tab ((t (:foreground "#434C5E"))))
 '(whitespace-trailing ((t (:inherit trailing-whitespace))))

 ;; widget
 '(widget-button-pressed ((t (:foreground "#BF616A"))))
 '(widget-documentation ((t (:foreground "#A3BE8C"))))
 '(widget-field ((t (:background "#373E4C" :distant-foreground "#2E3440" :box (:line-width -1 :color "#434C5E") :extend t))))
 '(widget-single-line-field ((t (:background "#373E4C" :distant-foreground "#2E3440"))))

 ;; window
 '(window-tool-bar-button ((t (:background "#2E3440" :foreground "#ECEFF4"))))
 '(window-tool-bar-button-disabled ((t (:background "#272C36" :foreground "#E5E9F0"))))
 '(window-tool-bar-button-hover ((t (:inherit highlight :distant-foreground "#2E3440"))))

 ;; woman
 '(woman-bold ((t (:inherit Man-overstrike))))
 '(woman-italic ((t (:inherit Man-underline))))

 ;; xref
 '(xref-file-header ((t (:inherit success))))
 '(xref-line-number ((t (:foreground "#81A1C1"))))
 '(xref-match ((t (:foreground "#A3BE8C" :background "#191C25" :weight bold))))

 ;; yas
 '(yas-field-highlight-face ((t (:inherit match))))

 ;; local preferences
 '(lsp-face-semhl-property ((t (:foreground unspecified))))
 '(lsp-face-semhl-member ((t (:foreground unspecified))))
 '(lsp-face-semhl-variable ((t (:foreground unspecified))))
 '(lsp-face-semhl-parameter ((t (:foreground unspecified))))
 '(lsp-face-semhl-macro ((t (:foreground "#BF616A"))))
 '(lsp-rust-analyzer-mutable-modifier-face ((t (:underline nil)))))

(provide-theme 'nord)

;;; nord-theme.el ends here
