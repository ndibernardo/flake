;;; solarized-theme.el --- Dark theme with the high contrast Solarized palette  -*- lexical-binding:t -*-

;;; Commentary:
;; Dark theme with the high contrast Solarized palette.

;;; Code:

;;;###theme-autoload
(deftheme solarized
  "Dark theme with the high contrast Solarized palette."
  :background-mode 'dark
  :kind 'color-scheme
  :family 'solarized)

(custom-theme-set-faces
 'solarized

 '(default ((t (:background "#002732" :foreground "#8d9fa1"))))
 '(cursor ((t (:background "#3c98e0"))))
 '(region ((t (:background "#01323d" :distant-foreground "#707f80" :extend t))))
 '(highlight ((t (:background "#3c98e0" :foreground "#01323d" :distant-foreground "#626C6C"))))
 '(hl-line ((t (:background "#00212B" :extend t))))
 '(fringe ((t (:inherit default :foreground "#56697A" :background unspecified))))
 '(vertical-border ((t (:background "#011417" :foreground "#011417"))))
 '(minibuffer-prompt ((t (:foreground "#3c98e0"))))
 '(isearch ((t (:inherit lazy-highlight :weight bold))))
 '(lazy-highlight ((t (:background "#2a6a9c" :foreground "#626C6C" :distant-foreground "#01323d" :weight bold))))
 '(link ((t (:foreground "#3c98e0" :underline t :weight bold))))
 '(link-visited ((t (:foreground "#7a7ed2" :underline t))))
 '(button ((t (:inherit link))))
 '(header-line ((t (:inherit mode-line))))
 '(tooltip ((t (:background "#00212B" :foreground "#8d9fa1"))))
 '(secondary-selection ((t (:background "#56697A" :extend t))))

 '(font-lock-builtin-face ((t (:foreground "#3c98e0" :slant normal))))
 '(font-lock-comment-face ((t (:foreground "#62787f" :slant normal))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-constant-face ((t (:foreground "#3c98e0" :weight bold))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground "#35a69c"))))
 '(font-lock-function-name-face ((t (:foreground "#3c98e0"))))
 '(font-lock-keyword-face ((t (:foreground "#93a61a" :weight bold))))
 '(font-lock-negation-char-face ((t (:inherit bold :foreground "#db5823"))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#ec423a"))))
 '(font-lock-string-face ((t (:foreground "#93a61a"))))
 '(font-lock-type-face ((t (:foreground "#c49619" :slant normal))))
 '(font-lock-variable-name-face ((t (:foreground unspecified))))
 '(font-lock-warning-face ((t (:inherit warning))))

 '(font-lock-operator-face ((t (:foreground "#db5823"))))
 '(font-lock-punctuation-face ((t (:foreground "#a08d81"))))
 '(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit bold :foreground "#db5823"))))
 '(font-lock-regexp-grouping-construct ((t (:inherit bold :foreground "#db5823"))))

 '(mode-line ((t (:background "#00212a" :box nil))))
 '(mode-line-inactive ((t (:background "#00232d" :foreground "#62787f" :box nil))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:foreground "#3c98e0"))))
 '(mode-line-highlight ((t (:inherit highlight :distant-foreground "#002732"))))

 '(line-number ((t (:inherit default :foreground "#56697A" :weight normal :slant normal :background unspecified))))
 '(line-number-current-line ((t (:inherit (hl-line default) :foreground "#8d9fa1" :weight normal :slant normal))))

 '(show-paren-match ((t (:foreground "#ec423a" :background "#01323d" :weight ultra-bold))))
 '(show-paren-mismatch ((t (:foreground "#01323d" :background "#ec423a" :weight ultra-bold))))

 '(match ((t (:foreground "#93a61a" :background "#01323d" :weight bold))))
 '(query-replace ((t (:inherit isearch))))

 '(diff-added ((t (:inherit hl-line :foreground "#93a61a"))))
 '(diff-removed ((t (:foreground "#ec423a" :background "#13383C"))))
 '(diff-changed ((t (:foreground "#7a7ed2"))))
 '(diff-header ((t (:foreground "#3cafa5"))))
 '(diff-file-header ((t (:foreground "#3c98e0"))))

 '(compilation-error ((t (:inherit error :weight bold))))
 '(compilation-warning ((t (:inherit warning :slant normal))))
 '(compilation-info ((t (:inherit success))))
 '(compilation-line-number ((t (:foreground "#3c98e0"))))

 '(org-todo ((t (:foreground "#93a61a" :bold inherit))))
 '(org-done ((t (:inherit org-headline-done :weight bold))))
 '(org-headline-done ((t (:foreground "#62787f"))))
 '(org-date ((t (:foreground "#c49619"))))
 '(org-link ((t (:inherit link :foreground "#3c98e0"))))
 '(org-block ((t (:background "#01323d" :extend t))))
 '(org-block-begin-line ((t (:inherit org-block :foreground "#62787f" :background "#01323d"))))
 '(org-block-end-line ((t (:inherit org-block-begin-line))))
 '(org-code ((t (:inherit org-block :foreground "#db5823"))))
 '(org-verbatim ((t (:foreground "#93a61a"))))

 '(outline-1 ((t (:foreground "#3c98e0" :weight bold :extend t))))
 '(outline-2 ((t (:foreground "#93a61a" :weight bold :extend t))))
 '(outline-3 ((t (:foreground "#35a69c" :weight bold :extend t))))
 '(outline-4 ((t (:foreground "#3079b3" :weight bold :extend t))))
 '(outline-5 ((t (:foreground "#758414" :weight bold :extend t))))
 '(outline-6 ((t (:foreground "#2a847c" :weight bold :extend t))))
 '(outline-7 ((t (:foreground "#245b86" :weight bold :extend t))))
 '(outline-8 ((t (:foreground "#58630f" :weight bold :extend t))))

 '(dired-directory ((t (:foreground "#3c98e0"))))
 '(dired-symlink ((t (:foreground "#3cafa5" :weight bold))))
 '(dired-header ((t (:foreground "#3c98e0" :weight bold))))

 '(eshell-prompt ((t (:foreground "#3c98e0" :weight bold))))
 '(eshell-ls-directory ((t (:foreground "#3c98e0"))))
 '(eshell-ls-executable ((t (:foreground "#93a61a"))))
 '(eshell-ls-symlink ((t (:foreground "#3cafa5"))))

 '(company-tooltip ((t (:inherit tooltip))))
 '(company-tooltip-selection ((t (:background "#03373f"))))
 '(company-tooltip-common ((t (:foreground "#3c98e0" :distant-foreground "#01323d" :weight bold))))
 '(company-scrollbar-fg ((t (:background "#3c98e0"))))
 '(company-scrollbar-bg ((t (:inherit tooltip))))

 '(corfu-default ((t (:inherit tooltip))))
 '(corfu-current ((t (:background "#002732" :foreground "#8d9fa1"))))
 '(corfu-bar ((t (:background "#62787f"))))
 '(corfu-border ((t (:background "#56697A"))))
 '(corfu-annotations ((t (:foreground "#62787f"))))
 '(corfu-deprecated ((t (:foreground "#62787f" :strike-through t))))
 '(corfu-echo ((t (:foreground "#62787f"))))
 '(corfu-popupinfo ((t (:background "#00212B" :foreground "#8d9fa1"))))

 '(flycheck-error ((t (:underline (:style wave :color "#ec423a")))))
 '(flycheck-warning ((t (:underline (:style wave :color "#c49619")))))
 '(flycheck-info ((t (:underline (:style wave :color "#93a61a")))))

 '(git-gutter:added ((t (:inherit fringe :foreground "#119e44"))))
 '(git-gutter:deleted ((t (:inherit fringe :foreground "#ec423a"))))
 '(git-gutter:modified ((t (:inherit fringe :foreground "#3c98e0"))))

 '(magit-branch-current ((t (:foreground "#3c98e0"))))
 '(magit-branch-local ((t (:foreground "#3cafa5"))))
 '(magit-branch-remote ((t (:foreground "#93a61a"))))
 '(magit-branch-upstream ((t (:foreground "#93a61a"))))
 '(magit-tag ((t (:foreground "#c49619"))))
 '(magit-hash ((t (:foreground "#62787f"))))
 '(magit-section-heading ((t (:foreground "#3c98e0" :weight bold :extend t))))
 '(magit-section-highlight ((t (:inherit hl-line))))
 '(magit-section-heading-selection ((t (:foreground "#db5823" :weight bold :extend t))))
 '(magit-diff-file-heading ((t (:foreground "#8d9fa1" :weight bold :extend t))))
 '(magit-diff-file-heading-highlight ((t (:background "#13383C" :foreground "#8d9fa1"))))
 '(magit-diff-hunk-heading ((t (:foreground "#002732" :background "#244161" :extend t))))
 '(magit-diff-hunk-heading-highlight ((t (:foreground "#002732" :background "#7a7ed2" :weight bold :extend t))))
 '(magit-diff-context ((t (:foreground "#545f60" :background "#002732" :extend t))))
 '(magit-diff-context-highlight ((t (:foreground "#8d9fa1" :background "#00212B" :extend t))))
 '(magit-diff-added ((t (:foreground "#0d7e36" :background "#013233" :extend t))))
 '(magit-diff-added-highlight ((t (:foreground "#119e44" :background "#033e35" :weight bold :extend t))))
 '(magit-diff-removed ((t (:foreground "#bc342e" :background "#28393b" :extend t))))
 '(magit-diff-removed-highlight ((t (:foreground "#ec423a" :background "#3e3a3b" :weight bold :extend t))))
 '(magit-diffstat-added ((t (:foreground "#119e44"))))
 '(magit-diffstat-removed ((t (:foreground "#ec423a"))))
 '(magit-log-author ((t (:foreground "#db5823"))))
 '(magit-log-date ((t (:foreground "#3c98e0"))))
 '(magit-log-graph ((t (:foreground "#62787f"))))
 '(magit-process-ok ((t (:inherit success))))
 '(magit-process-ng ((t (:inherit error))))

 '(vertico-current ((t (:background "#01323d" :extend t))))
 '(vertico-group-title ((t (:foreground "#62787f" :weight bold))))
 '(vertico-group-separator ((t (:foreground "#56697A" :strike-through t))))
 '(vertico-multiline ((t (:foreground "#62787f"))))
 '(vertico-quick1 ((t (:background "#00212B" :foreground "#3c98e0" :weight bold))))
 '(vertico-quick2 ((t (:background "#00212B" :foreground "#93a61a" :weight bold))))

 '(orderless-match-face-0 ((t (:weight bold :foreground "#5c9ac6" :background "#063243"))))
 '(orderless-match-face-1 ((t (:weight bold :foreground "#c06996" :background "#162a3b"))))
 '(orderless-match-face-2 ((t (:weight bold :foreground "#90a350" :background "#0e332f"))))
 '(orderless-match-face-3 ((t (:weight bold :foreground "#ae994f" :background "#13322f"))))

 '(marginalia-documentation ((t (:inherit font-lock-doc-face))))
 '(marginalia-key ((t (:foreground "#93a61a"))))
 '(marginalia-type ((t (:foreground "#7a7ed2"))))
 '(marginalia-char ((t (:foreground "#3c98e0"))))
 '(marginalia-lighter ((t (:foreground "#7a7ed2"))))
 '(marginalia-on ((t (:foreground "#93a61a"))))
 '(marginalia-off ((t (:foreground "#ec423a"))))

 '(consult-file ((t (:foreground "#8d9fa1"))))
 '(consult-bookmark ((t (:foreground "#3c98e0"))))
 '(consult-async-running ((t (:foreground "#3c98e0"))))
 '(consult-async-finished ((t (:foreground "#93a61a"))))
 '(consult-async-failed ((t (:foreground "#ec423a"))))
 '(consult-preview-line ((t (:background "#13383C"))))
 '(consult-preview-match ((t (:background "#3F88AD"))))

 '(ivy-current-match ((t (:background "#01323d" :extend t))))
 '(ivy-minibuffer-match-face-1 ((t (:foreground "#6d7d8c" :weight light))))
 '(helm-selection ((t (:inherit bold :background "#3F88AD" :distant-foreground "#002732" :extend t))))
 '(helm-match ((t (:inherit bold :foreground "#3c98e0" :distant-foreground "#626C6C"))))

 '(term-color-black ((t (:background "#01323d" :foreground "#01323d"))))
 '(term-color-red ((t (:background "#ec423a" :foreground "#ec423a"))))
 '(term-color-green ((t (:background "#93a61a" :foreground "#93a61a"))))
 '(term-color-yellow ((t (:background "#c49619" :foreground "#c49619"))))
 '(term-color-blue ((t (:background "#3c98e0" :foreground "#3c98e0"))))
 '(term-color-magenta ((t (:background "#e2468f" :foreground "#e2468f"))))
 '(term-color-cyan ((t (:background "#3cafa5" :foreground "#3cafa5"))))
 '(term-color-white ((t (:background "#626C6C" :foreground "#626C6C"))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#3c98e0"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#c49619"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#db5823"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#93a61a"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#3cafa5"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#7a7ed2"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#e2468f"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#93a61a"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#7a7ed2"))))

 '(lsp-face-highlight-textual ((t (:weight bold :background "#13383C" :foreground "#01323d" :distant-foreground "#626C6C"))))
 '(lsp-face-highlight-read ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-face-highlight-write ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-ui-doc-background ((t (:inherit tooltip))))
 '(lsp-ui-peek-selection ((t (:foreground "#002732" :background "#3c98e0" :bold t))))
 '(lsp-ui-sideline-code-action ((t (:foreground "#3287c5"))))

 '(which-key-key-face ((t (:foreground "#93a61a"))))
 '(which-key-command-description-face ((t (:foreground "#3c98e0"))))

 '(web-mode-html-tag-face ((t (:foreground "#3cafa5"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#c49619"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#93a61a"))))
 '(web-mode-css-property-name-face ((t (:foreground "#c49619"))))

 '(js2-function-param ((t (:foreground "#8d9fa1"))))
 '(js2-function-call ((t (:foreground "#3c98e0"))))
 '(js2-object-property ((t (:foreground "#7a7ed2"))))
 '(js2-jsdoc-tag ((t (:foreground "#35a69c"))))
 '(js2-external-variable ((t (:foreground "#db5823"))))

 '(markdown-bold-face ((t (:inherit bold :foreground "#8d9fa1"))))
 '(markdown-italic-face ((t (:inherit italic :foreground "#60767e"))))
 '(markdown-link-face ((t (:foreground "#3c98e0"))))
 '(markdown-url-face ((t (:foreground "#35a69c" :weight normal))))
 '(markdown-code-face ((t (:background "#13383C" :extend t))))
 '(markdown-blockquote-face ((t (:inherit italic :foreground "#35a69c"))))

 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))
 '(treemacs-directory-face ((t (:foreground "#8d9fa1"))))
 '(treemacs-file-face ((t (:foreground "#8d9fa1"))))
 '(treemacs-tags-face ((t (:foreground "#3c98e0"))))
 '(treemacs-fringe-indicator-face ((t (:foreground "#3c98e0"))))
 '(treemacs-git-added-face ((t (:foreground "#119e44"))))
 '(treemacs-git-modified-face ((t (:foreground "#7a7ed2"))))
 '(treemacs-git-conflict-face ((t (:foreground "#ec423a"))))
 '(treemacs-git-untracked-face ((t (:inherit font-lock-doc-face))))
 '(treemacs-on-success-pulse-face ((t (:foreground "#01323d" :background "#93a61a" :extend t))))
 '(treemacs-on-failure-pulse-face ((t (:foreground "#01323d" :background "#ec423a" :extend t))))

 '(window-divider ((t (:inherit vertical-border))))
 '(window-divider-first-pixel ((t (:inherit window-divider))))
 '(window-divider-last-pixel ((t (:inherit window-divider))))

 '(error ((t (:foreground "#ec423a"))))
 '(warning ((t (:foreground "#c49619"))))
 '(success ((t (:foreground "#93a61a"))))

 ;; Man
 '(Man-overstrike ((t (:inherit bold :foreground "#db5823"))))
 '(Man-underline ((t (:inherit underline :foreground "#93a61a"))))

 ;; ansi
 '(ansi-color-black ((t (:foreground "#002732" :background "#002732"))))
 '(ansi-color-blue ((t (:foreground "#3c98e0" :background "#3c98e0"))))
 '(ansi-color-bright-black ((t (:foreground "#56697A" :background "#56697A"))))
 '(ansi-color-bright-blue ((t (:foreground "#59a7e4" :background "#59a7e4"))))
 '(ansi-color-bright-cyan ((t (:foreground "#59bbb2" :background "#59bbb2"))))
 '(ansi-color-bright-green ((t (:foreground "#a3b33c" :background "#a3b33c"))))
 '(ansi-color-bright-magenta ((t (:foreground "#e6619f" :background "#e6619f"))))
 '(ansi-color-bright-red ((t (:foreground "#ee5e57" :background "#ee5e57"))))
 '(ansi-color-bright-white ((t (:foreground "#626C6C" :background "#626C6C"))))
 '(ansi-color-bright-yellow ((t (:foreground "#cca53b" :background "#cca53b"))))
 '(ansi-color-cyan ((t (:foreground "#3cafa5" :background "#3cafa5"))))
 '(ansi-color-green ((t (:foreground "#93a61a" :background "#93a61a"))))
 '(ansi-color-magenta ((t (:foreground "#e2468f" :background "#e2468f"))))
 '(ansi-color-red ((t (:foreground "#ec423a" :background "#ec423a"))))
 '(ansi-color-white ((t (:foreground "#8d9fa1" :background "#8d9fa1"))))
 '(ansi-color-yellow ((t (:foreground "#c49619" :background "#c49619"))))

 ;; avy
 '(avy-background-face ((t (:foreground "#62787f"))))
 '(avy-lead-face ((t (:background "#3c98e0" :foreground "#002732" :distant-foreground "#8d9fa1" :weight bold))))
 '(avy-lead-face-0 ((t (:inherit avy-lead-face :background "#76b6e9"))))
 '(avy-lead-face-1 ((t (:inherit avy-lead-face :background "#b1d5f2"))))
 '(avy-lead-face-2 ((t (:inherit avy-lead-face :background "#ebf4fb"))))

 ;; bold
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:inherit (bold italic)))))

 ;; bookmark
 '(bookmark-face ((t (:background "#063243" :extend t))))

 ;; cider
 '(cider-debug-code-overlay-face ((t (:background "#13383C"))))
 '(cider-deprecated-face ((t (:background "#273d2c"))))
 '(cider-enlightened-face ((t (:inherit cider-result-overlay-face :box (:color "#db5823" :line-width -1)))))
 '(cider-enlightened-local-face ((t (:foreground "#db5823" :weight bold))))
 '(cider-error-highlight-face ((t (:underline (:style wave :color "#ec423a")))))
 '(cider-fringe-good-face ((t (:foreground "#93a61a"))))
 '(cider-instrumented-face ((t (:background "#2f2c33"))))
 '(cider-result-overlay-face ((t (:background "#13383C" :box (:line-width -1 :color "#62787f")))))
 '(cider-test-error-face ((t (:background "#db5823"))))
 '(cider-test-failure-face ((t (:background "#462f34"))))
 '(cider-test-success-face ((t (:foreground "#01323d" :background "#93a61a"))))
 '(cider-traced-face ((t (:background "#0b4249"))))
 '(cider-warning-highlight-face ((t (:underline (:style wave :color "#c49619")))))

 ;; compilation
 '(compilation-column-number ((t (:inherit font-lock-comment-face))))
 '(compilation-mode-line-exit ((t (:inherit compilation-info))))
 '(compilation-mode-line-fail ((t (:inherit compilation-error))))

 ;; custom
 '(custom-button ((t (:foreground "#3c98e0" :background "#002732" :box (:line-width 1 :style nil)))))
 '(custom-button-mouse ((t (:foreground "#002732" :background "#3c98e0" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed ((t (:foreground "#002732" :background "#3c98e0" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed-unraised ((t (:foreground "#002732" :background "#7a7ed2" :box (:line-width 1 :style nil)))))
 '(custom-button-unraised ((t (:foreground "#7a7ed2" :background "#002732" :box (:line-width 1 :style nil)))))
 '(custom-changed ((t (:foreground "#3c98e0" :background "#002732"))))
 '(custom-comment ((t (:foreground "#8d9fa1" :background "#01323d"))))
 '(custom-comment-tag ((t (:foreground "#56697A"))))
 '(custom-group-subtitle ((t (:foreground "#ec423a"))))
 '(custom-group-tag ((t (:foreground "#7a7ed2"))))
 '(custom-group-tag-1 ((t (:foreground "#3c98e0"))))
 '(custom-invalid ((t (:foreground "#ec423a" :background "#2f2c33"))))
 '(custom-modified ((t (:foreground "#3c98e0" :background "#0c3d54"))))
 '(custom-saved ((t (:foreground "#93a61a" :background "#1d402d" :bold t))))
 '(custom-set ((t (:foreground "#c49619" :background "#002732"))))
 '(custom-state ((t (:foreground "#93a61a" :background "#1d402d"))))
 '(custom-themed ((t (:foreground "#c49619" :background "#002732"))))
 '(custom-variable-button ((t (:foreground "#93a61a" :underline t))))
 '(custom-variable-obsolete ((t (:foreground "#56697A" :background "#002732"))))
 '(custom-variable-tag ((t (:foreground "#e2468f"))))
 '(custom-visibility ((t (:foreground "#3c98e0"))))

 ;; diff
 '(diff-context ((t (:foreground "#7c8b8d"))))
 '(diff-hl-change ((t (:foreground "#3c98e0" :background "#3c98e0"))))
 '(diff-hl-delete ((t (:foreground "#ec423a" :background "#ec423a"))))
 '(diff-hl-insert ((t (:foreground "#119e44" :background "#119e44"))))
 '(diff-hunk-header ((t (:foreground "#7a7ed2"))))
 '(diff-indicator-added ((t (:foreground "#119e44"))))
 '(diff-indicator-changed ((t (:foreground "#3c98e0"))))
 '(diff-indicator-removed ((t (:foreground "#ec423a"))))
 '(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
 '(diff-refine-changed ((t (:inherit diff-changed :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-removed :inverse-video t))))

 ;; dired
 '(dired-flagged ((t (:foreground "#ec423a"))))
 '(dired-ignored ((t (:foreground "#62787f"))))
 '(dired-k-added ((t (:foreground "#119e44" :weight bold))))
 '(dired-k-commited ((t (:foreground "#93a61a" :weight bold))))
 '(dired-k-directory ((t (:foreground "#3c98e0" :weight bold))))
 '(dired-k-ignored ((t (:foreground "#62787f" :weight bold))))
 '(dired-k-modified ((t (:foreground "#3c98e0" :weight bold))))
 '(dired-k-untracked ((t (:foreground "#35a69c" :weight bold))))
 '(dired-mark ((t (:foreground "#db5823" :weight bold))))
 '(dired-marked ((t (:foreground "#e2468f" :weight bold :inverse-video t))))
 '(dired-perm-write ((t (:foreground "#8d9fa1" :underline t))))
 '(dired-subtree-depth-1-face ((t (:background "#00202a"))))
 '(dired-subtree-depth-2-face ((t (:background "#001f29"))))
 '(dired-subtree-depth-3-face ((t (:background "#001f28"))))
 '(dired-subtree-depth-4-face ((t (:background "#001e27"))))
 '(dired-subtree-depth-5-face ((t (:background "#001d26"))))
 '(dired-subtree-depth-6-face ((t (:background "#001d25"))))
 '(dired-warning ((t (:foreground "#c49619"))))

 ;; ediff
 '(ediff-current-diff-A ((t (:foreground "#ec423a" :background "#3e3a3b" :extend t))))
 '(ediff-current-diff-B ((t (:foreground "#119e44" :background "#033e35" :extend t))))
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
 '(elfeed-log-debug-level-face ((t (:foreground "#62787f"))))
 '(elfeed-log-error-level-face ((t (:inherit error))))
 '(elfeed-log-info-level-face ((t (:inherit success))))
 '(elfeed-log-warn-level-face ((t (:inherit warning))))
 '(elfeed-search-date-face ((t (:foreground "#7a7ed2"))))
 '(elfeed-search-feed-face ((t (:foreground "#3c98e0"))))
 '(elfeed-search-filter-face ((t (:foreground "#7a7ed2"))))
 '(elfeed-search-tag-face ((t (:foreground "#62787f"))))
 '(elfeed-search-title-face ((t (:foreground "#62787f"))))
 '(elfeed-search-unread-count-face ((t (:foreground "#c49619"))))
 '(elfeed-search-unread-title-face ((t (:foreground "#8d9fa1" :weight bold))))

 ;; elixir
 '(elixir-atom-face ((t (:foreground "#3F88AD"))))
 '(elixir-attribute-face ((t (:foreground "#7a7ed2"))))

 ;; escape
 '(escape-glyph ((t (:foreground "#3cafa5"))))

 ;; eshell
 '(eshell-git-prompt-powerline-clean-face ((t (:background "foreset green" :foreground "#002732"))))
 '(eshell-git-prompt-powerline-dir-face ((t (:background "steel blue" :foreground "#002732"))))
 '(eshell-git-prompt-powerline-not-clean-face ((t (:background "indian red" :foreground "#002732"))))
 '(eshell-ls-archive ((t (:foreground "#e2468f"))))
 '(eshell-ls-backup ((t (:foreground "#c49619"))))
 '(eshell-ls-clutter ((t (:foreground "#ec423a"))))
 '(eshell-ls-missing ((t (:foreground "#ec423a"))))
 '(eshell-ls-product ((t (:foreground "#db5823"))))
 '(eshell-ls-readonly ((t (:foreground "#db5823"))))
 '(eshell-ls-special ((t (:foreground "#7a7ed2"))))
 '(eshell-ls-unreadable ((t (:foreground "#62787f"))))

 ;; flycheck
 '(flycheck-fringe-error ((t (:inherit fringe :foreground "#ec423a"))))
 '(flycheck-fringe-info ((t (:inherit fringe :foreground "#93a61a"))))
 '(flycheck-fringe-warning ((t (:inherit fringe :foreground "#c49619"))))
 '(flycheck-posframe-background-face ((t (:background "#00212B"))))
 '(flycheck-posframe-error-face ((t (:inherit flycheck-posframe-face :foreground "#ec423a"))))
 '(flycheck-posframe-face ((t (:inherit default))))
 '(flycheck-posframe-info-face ((t (:inherit flycheck-posframe-face :foreground "#93a61a"))))
 '(flycheck-posframe-warning-face ((t (:inherit flycheck-posframe-face :foreground "#c49619"))))

 ;; flymake
 '(flymake-error ((t (:underline (:style wave :color "#ec423a")))))
 '(flymake-note ((t (:underline (:style wave :color "#93a61a")))))
 '(flymake-warning ((t (:underline (:style wave :color "#db5823")))))

 ;; font
 '(font-latex-bold-face ((t (:inherit bold))))
 '(font-latex-italic-face ((t (:inherit italic))))
 '(font-latex-math-face ((t (:foreground "#3c98e0"))))
 '(font-latex-script-char-face ((t (:foreground "#3F88AD"))))
 '(font-latex-sectioning-0-face ((t (:foreground "#3c98e0" :weight ultra-bold))))
 '(font-latex-sectioning-1-face ((t (:foreground "#e2468f" :weight semi-bold))))
 '(font-latex-sectioning-2-face ((t (:foreground "#7a7ed2" :weight semi-bold))))
 '(font-latex-sectioning-3-face ((t (:foreground "#76b6e9" :weight semi-bold))))
 '(font-latex-sectioning-4-face ((t (:foreground "#ea7db0" :weight semi-bold))))
 '(font-latex-sectioning-5-face ((t (:foreground "#a1a4df" :weight semi-bold))))
 '(font-latex-sedate-face ((t (:inherit font-lock-keyword-face))))
 '(font-latex-string-face ((t (:inherit font-lock-string-face))))
 '(font-latex-underline-face ((t (:inherit underline))))
 '(font-latex-verbatim-face ((t (:inherit fixed-pitch :foreground "#7a7ed2" :slant normal))))
 '(font-latex-warning-face ((t (:inherit font-lock-warning-face))))
 '(font-lock-escape-face ((t (:inherit font-lock-regexp-grouping-backslash))))
 '(font-lock-function-call-face ((t (:inherit font-lock-function-name-face :slant normal :foreground "#549acd"))))
 '(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-number-face ((t (:foreground "#7a7ed2"))))
 '(font-lock-preprocessor-char-face ((t (:inherit bold :foreground "#db5823"))))
 '(font-lock-property-name-face ((t (:foreground "#90a350" :weight bold))))
 '(font-lock-property-use-face ((t (:inherit font-lock-property-name-face :weight regular))))
 '(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face :foreground unspecified))))

 ;; git
 '(git-commit-comment-branch-local ((t (:foreground "#e2468f"))))
 '(git-commit-comment-branch-remote ((t (:foreground "#93a61a"))))
 '(git-commit-comment-detached ((t (:foreground "#db5823"))))
 '(git-commit-comment-file ((t (:foreground "#7a7ed2"))))
 '(git-commit-comment-heading ((t (:foreground "#93a61a"))))
 '(git-commit-keyword ((t (:foreground "#3cafa5" :slant normal))))
 '(git-commit-known-pseudo-header ((t (:foreground "#35a69c" :weight bold :slant normal))))
 '(git-commit-nonempty-second-line ((t (:inherit git-commit-overlong-summary))))
 '(git-commit-overlong-summary ((t (:inherit error :background "#01323d" :slant normal :weight bold))))
 '(git-commit-pseudo-header ((t (:foreground "#35a69c" :slant normal))))
 '(git-commit-summary ((t (:foreground "#93a61a"))))
 '(git-gutter+-added ((t (:inherit fringe :foreground "#119e44"))))
 '(git-gutter+-deleted ((t (:inherit fringe :foreground "#ec423a"))))
 '(git-gutter+-modified ((t (:inherit fringe :foreground "#3c98e0"))))
 '(git-gutter-fr:added ((t (:inherit fringe :foreground "#119e44"))))
 '(git-gutter-fr:deleted ((t (:inherit fringe :foreground "#ec423a"))))
 '(git-gutter-fr:modified ((t (:foreground "#3c98e0"))))

 ;; header
 '(header-line-highlight ((t (:inherit mode-line-highlight))))

 ;; hi
 '(hi-blue ((t (:background "#3c98e0"))))
 '(hi-blue-b ((t (:foreground "#3c98e0" :weight bold))))
 '(hi-green ((t (:background "#93a61a"))))
 '(hi-green-b ((t (:foreground "#93a61a" :weight bold))))
 '(hi-pink ((t (:background "#e2468f"))))
 '(hi-red-b ((t (:foreground "#ec423a" :weight bold))))
 '(hi-yellow ((t (:background "#c49619"))))

 ;; highlight
 '(highlight-indentation-current-column-face ((t (:background "#03282F"))))
 '(highlight-indentation-face ((t (:inherit hl-line))))
 '(highlight-indentation-guides-even-face ((t (:inherit highlight-indentation-face))))
 '(highlight-indentation-guides-odd-face ((t (:inherit highlight-indentation-face))))
 '(highlight-numbers-number ((t (:inherit bold :foreground "#7a7ed2"))))
 '(highlight-quoted-quote ((t (:foreground "#db5823"))))
 '(highlight-quoted-symbol ((t (:foreground "#c49619"))))
 '(highlight-symbol-face ((t (:background "#1a4650" :distant-foreground "#60767e"))))
 '(highlight-thing ((t (:background "#1a4650" :distant-foreground "#60767e"))))

 ;; hl
 '(hl-fill-column-face ((t (:inherit (hl-line shadow)))))
 '(hl-todo ((t (:foreground "#ec423a" :weight bold))))

 ;; imenu
 '(imenu-list-entry-face-0 ((t (:foreground "#3c98e0"))))
 '(imenu-list-entry-face-1 ((t (:foreground "#93a61a"))))
 '(imenu-list-entry-face-2 ((t (:foreground "#c49619"))))
 '(imenu-list-entry-subalist-face-0 ((t (:inherit imenu-list-entry-face-0 :weight bold))))
 '(imenu-list-entry-subalist-face-1 ((t (:inherit imenu-list-entry-face-1 :weight bold))))
 '(imenu-list-entry-subalist-face-2 ((t (:inherit imenu-list-entry-face-2 :weight bold))))

 ;; indent
 '(indent-guide-face ((t (:inherit hl-line))))

 ;; isearch
 '(isearch-fail ((t (:background "#ec423a" :foreground "#01323d" :weight bold))))

 ;; italic
 '(italic ((t (:slant normal))))

 ;; lsp
 '(lsp-headerline-breadcrumb-separator-face ((t (:inherit shadow))))
 '(lsp-ui-peek-filename ((t (:inherit mode-line-buffer-id))))
 '(lsp-ui-peek-header ((t (:foreground "#8d9fa1" :background "#193c46" :bold t))))
 '(lsp-ui-peek-highlight ((t (:inherit isearch :box t))))
 '(lsp-ui-peek-line-number ((t (:foreground "#93a61a"))))
 '(lsp-ui-peek-list ((t (:background "#00232d"))))
 '(lsp-ui-peek-peek ((t (:background "#00232d"))))
 '(lsp-ui-sideline-current-symbol ((t (:inherit highlight))))
 '(lsp-ui-sideline-symbol-info ((t (:foreground "#536b73" :background "#00212B" :extend t))))

 ;; magit
 '(magit-bisect-bad ((t (:foreground "#ec423a"))))
 '(magit-bisect-good ((t (:foreground "#93a61a"))))
 '(magit-bisect-skip ((t (:foreground "#db5823"))))
 '(magit-blame-date ((t (:foreground "#ec423a"))))
 '(magit-blame-hash ((t (:foreground "#3cafa5"))))
 '(magit-blame-heading ((t (:foreground "#db5823" :background "#13383C" :extend t))))
 '(magit-cherry-equivalent ((t (:foreground "#7a7ed2"))))
 '(magit-cherry-unmatched ((t (:foreground "#3cafa5"))))
 '(magit-diff-base ((t (:foreground "#af461c" :background "#152b30" :extend t))))
 '(magit-diff-base-highlight ((t (:foreground "#db5823" :background "#2b302f" :weight bold :extend t))))
 '(magit-diff-file-heading-selection ((t (:foreground "#e2468f" :background "#3F88AD" :weight bold :extend t))))
 '(magit-diff-lines-heading ((t (:foreground "#c49619" :background "#ec423a" :extend t :extend t))))
 '(magit-dimmed ((t (:foreground "#60767e"))))
 '(magit-filename ((t (:foreground "#7a7ed2"))))
 '(magit-header-line ((t (:background "#3F88AD" :foreground "#626C6C" :weight bold :box (:line-width 3 :color "#3F88AD")))))
 '(magit-reflog-amend ((t (:foreground "#e2468f"))))
 '(magit-reflog-checkout ((t (:foreground "#3c98e0"))))
 '(magit-reflog-cherry-pick ((t (:foreground "#93a61a"))))
 '(magit-reflog-commit ((t (:foreground "#93a61a"))))
 '(magit-reflog-merge ((t (:foreground "#93a61a"))))
 '(magit-reflog-other ((t (:foreground "#3cafa5"))))
 '(magit-reflog-rebase ((t (:foreground "#e2468f"))))
 '(magit-reflog-remote ((t (:foreground "#3cafa5"))))
 '(magit-reflog-reset ((t (:inherit error))))
 '(magit-refname ((t (:foreground "#62787f"))))
 '(magit-section-secondary-heading ((t (:foreground "#7a7ed2" :weight bold :extend t))))
 '(magit-sequence-drop ((t (:foreground "#ec423a"))))
 '(magit-sequence-head ((t (:foreground "#3c98e0"))))
 '(magit-sequence-part ((t (:foreground "#db5823"))))
 '(magit-sequence-stop ((t (:foreground "#93a61a"))))
 '(magit-signature-bad ((t (:inherit error))))
 '(magit-signature-error ((t (:inherit error))))
 '(magit-signature-expired ((t (:foreground "#db5823"))))
 '(magit-signature-good ((t (:inherit success))))
 '(magit-signature-revoked ((t (:foreground "#e2468f"))))
 '(magit-signature-untrusted ((t (:foreground "#c49619"))))

 ;; makefile
 '(makefile-targets ((t (:foreground "#3c98e0"))))

 ;; marginalia
 '(marginalia-file-priv-dir ((t (:foreground "#3c98e0"))))
 '(marginalia-file-priv-exec ((t (:foreground "#93a61a"))))
 '(marginalia-file-priv-link ((t (:foreground "#7a7ed2"))))
 '(marginalia-file-priv-other ((t (:foreground "#e2468f"))))
 '(marginalia-file-priv-rare ((t (:foreground "#8d9fa1"))))
 '(marginalia-file-priv-read ((t (:foreground "#c49619"))))
 '(marginalia-file-priv-write ((t (:foreground "#ec423a"))))
 '(marginalia-number ((t (:foreground "#7a7ed2"))))
 '(marginalia-size ((t (:foreground "#7a7ed2"))))

 ;; markdown
 '(markdown-header-delimiter-face ((t (:inherit markdown-header-face))))
 '(markdown-header-face ((t (:inherit bold :foreground "#7a7ed2"))))
 '(markdown-html-attr-name-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-attr-value-face ((t (:inherit font-lock-string-face))))
 '(markdown-html-entity-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-tag-delimiter-face ((t (:inherit markdown-markup-face))))
 '(markdown-html-tag-name-face ((t (:inherit font-lock-keyword-face))))
 '(markdown-inline-code-face ((t (:inherit (markdown-code-face markdown-pre-face)))))
 '(markdown-list-face ((t (:foreground "#ec423a"))))
 '(markdown-markup-face ((t (:foreground "#62787f"))))
 '(markdown-metadata-key-face ((t (:foreground "#ec423a"))))
 '(markdown-pre-face ((t (:foreground "#93a61a"))))
 '(markdown-reference-face ((t (:foreground "#96A7A9"))))

 ;; mc/cursor
 '(mc/cursor-face ((t (:inherit cursor))))

 ;; message
 '(message-cited-text ((t (:foreground "#7a7ed2"))))
 '(message-cited-text-1 ((t (:foreground "#c49619"))))
 '(message-cited-text-2 ((t (:foreground "#e2468f"))))
 '(message-cited-text-3 ((t (:foreground "#93a61a"))))
 '(message-cited-text-4 ((t (:foreground "#93a61a"))))
 '(message-header-cc ((t (:inherit message-header-to :foreground "#3281be"))))
 '(message-header-name ((t (:foreground "#93a61a"))))
 '(message-header-newsgroups ((t (:foreground "#c49619"))))
 '(message-header-other ((t (:foreground "#7a7ed2"))))
 '(message-header-subject ((t (:foreground "#3c98e0" :weight bold))))
 '(message-header-to ((t (:foreground "#3c98e0" :weight bold))))
 '(message-header-xheader ((t (:foreground "#35a69c"))))
 '(message-mml ((t (:foreground "#62787f" :slant normal))))
 '(message-separator ((t (:foreground "#62787f"))))

 ;; mode
 '(mode-line-active ((t (:inherit mode-line))))

 ;; nobreak
 '(nobreak-space ((t (:inherit escape-glyph :underline t))))

 ;; org
 '(org-agenda-clocking ((t (:background "#0c3d54"))))
 '(org-agenda-date ((t (:foreground "#7a7ed2" :weight ultra-bold))))
 '(org-agenda-date-today ((t (:foreground "#afb1e3" :weight ultra-bold))))
 '(org-agenda-date-weekend ((t (:foreground "#494b7d" :weight ultra-bold))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "#62787f"))))
 '(org-agenda-done ((t (:inherit org-done))))
 '(org-agenda-structure ((t (:foreground "#8d9fa1" :weight ultra-bold))))
 '(org-archived ((t (:foreground "#35a69c"))))
 '(org-block-background ((t (:background "#13383C" :extend t))))
 '(org-checkbox ((t (:inherit org-todo))))
 '(org-checkbox-statistics-done ((t (:inherit org-done))))
 '(org-checkbox-statistics-todo ((t (:inherit org-todo))))
 '(org-cite ((t (:foreground "#3da59c"))))
 '(org-cite-key ((t (:foreground "#58a39e" :underline t))))
 '(org-default ((t (:inherit variable-pitch))))
 '(org-document-info ((t (:foreground "#3c98e0"))))
 '(org-document-title ((t (:foreground "#3c98e0" :weight bold))))
 '(org-drawer ((t (:foreground "#62787f"))))
 '(org-ellipsis ((t (:foreground "#62787f"))))
 '(org-footnote ((t (:foreground "#db5823"))))
 '(org-formula ((t (:foreground "#3cafa5"))))
 '(org-habit-alert-face ((t (:weight bold :background "#625b22"))))
 '(org-habit-alert-future-face ((t (:weight bold :background "#3a4425"))))
 '(org-habit-clear-face ((t (:weight bold :background "#56697A"))))
 '(org-habit-clear-future-face ((t (:weight bold :background "#13383C"))))
 '(org-habit-overdue-face ((t (:weight bold :background "#763132"))))
 '(org-habit-overdue-future-face ((t (:weight bold :background "#462a2f"))))
 '(org-habit-ready-face ((t (:weight bold :background "#1e5c85"))))
 '(org-habit-ready-future-face ((t (:weight bold :background "#124461"))))
 '(org-hide ((t (:foreground "#002732"))))
 '(org-journal-calendar-entry-face ((t (:foreground "#e2468f" :slant normal))))
 '(org-journal-calendar-scheduled-face ((t (:foreground "#ec423a" :slant normal))))
 '(org-journal-highlight ((t (:foreground "#3c98e0"))))
 '(org-latex-and-related ((t (:foreground "#626C6C" :weight bold))))
 '(org-list-dt ((t (:foreground "#3c98e0"))))
 '(org-meta-line ((t (:foreground "#35a69c"))))
 '(org-pomodoro-mode-line ((t (:foreground "#ec423a"))))
 '(org-pomodoro-mode-line-overtime ((t (:foreground "#c49619" :weight bold))))
 '(org-priority ((t (:foreground "#ec423a"))))
 '(org-property-value ((t (:foreground "#35a69c"))))
 '(org-quote ((t (:inherit org-block :slant normal))))
 '(org-ref-acronym-face ((t (:foreground "#7a7ed2"))))
 '(org-ref-cite-face ((t (:foreground "#c49619" :weight light :underline t))))
 '(org-ref-glossary-face ((t (:foreground "#e2468f"))))
 '(org-ref-label-face ((t (:foreground "#3c98e0"))))
 '(org-ref-ref-face ((t (:inherit link :foreground "#35a69c"))))
 '(org-scheduled ((t (:foreground "#8d9fa1"))))
 '(org-scheduled-previously ((t (:foreground "#626C6C"))))
 '(org-scheduled-today ((t (:foreground "#788484"))))
 '(org-sexp-date ((t (:foreground "#8d9fa1"))))
 '(org-special-keyword ((t (:foreground "#35a69c"))))
 '(org-table ((t (:foreground "#7a7ed2"))))
 '(org-tag ((t (:foreground "#35a69c" :weight normal))))
 '(org-time-grid ((t (:foreground "#62787f"))))
 '(org-upcoming-deadline ((t (:foreground "#70878a"))))
 '(org-upcoming-distant-deadline ((t (:foreground "#466369"))))
 '(org-warning ((t (:foreground "#c49619"))))

 ;; paren
 '(paren-face ((t (:foreground "#62787f"))))
 '(paren-face-match ((t (:foreground "#ec423a" :background "#01323d" :weight ultra-bold))))
 '(paren-face-mismatch ((t (:foreground "#01323d" :background "#ec423a" :weight ultra-bold))))
 '(paren-face-no-match ((t (:inherit paren-face-mismatch :weight ultra-bold))))

 ;; rainbow
 '(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "#ec423a"))))
 '(rainbow-delimiters-base-face ((t (:inherit default))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#ec423a" :weight bold :inverse-video t))))

 ;; sh
 '(sh-heredoc ((t (:inherit font-lock-string-face :weight normal))))
 '(sh-quoted-exec ((t (:inherit font-lock-preprocessor-face))))

 ;; shadow
 '(shadow ((t (:foreground "#62787f"))))

 ;; smerge
 '(smerge-base ((t (:background "#0c3d54"))))
 '(smerge-lower ((t (:background "#1d402d"))))
 '(smerge-markers ((t (:background "#62787f" :foreground "#002732" :distant-foreground "#8d9fa1" :weight bold))))
 '(smerge-mine ((t (:background "#3e3a3b"))))
 '(smerge-other ((t (:background "#1d402d"))))
 '(smerge-refined-added ((t (:inherit diff-added :inverse-video t))))
 '(smerge-refined-removed ((t (:inherit diff-removed :inverse-video t))))
 '(smerge-upper ((t (:background "#3e3a3b"))))

 ;; symbol
 '(symbol-overlay-default-face ((t (:background "#1a4650" :distant-foreground "#60767e"))))
 '(symbol-overlay-face-1 ((t (:background "#185477" :distant-foreground "#60767e"))))
 '(symbol-overlay-face-2 ((t (:background "#304971" :distant-foreground "#60767e"))))
 '(symbol-overlay-face-3 ((t (:background "#3a482a" :distant-foreground "#60767e"))))
 '(symbol-overlay-face-4 ((t (:background "#41352d" :distant-foreground "#60767e"))))
 '(symbol-overlay-face-5 ((t (:background "#462f34" :distant-foreground "#60767e"))))
 '(symbol-overlay-face-6 ((t (:background "#43304d" :distant-foreground "#60767e"))))
 '(symbol-overlay-face-7 ((t (:background "#3a5928" :distant-foreground "#60767e"))))
 '(symbol-overlay-face-8 ((t (:background "#0c4249" :distant-foreground "#60767e"))))

 ;; tab
 '(tab-bar ((t (:background "#00212B" :foreground "#00212B"))))
 '(tab-bar-tab ((t (:background "#002732" :foreground "#8d9fa1"))))
 '(tab-bar-tab-inactive ((t (:background "#00212B" :foreground "#60767e"))))
 '(tab-line ((t (:background "#00212B" :foreground "#00212B"))))
 '(tab-line-close-highlight ((t (:foreground "#3c98e0"))))
 '(tab-line-highlight ((t (:inherit tab-line-tab))))
 '(tab-line-tab ((t (:background "#002732" :foreground "#8d9fa1"))))
 '(tab-line-tab-current ((t (:background "#002732" :foreground "#8d9fa1"))))
 '(tab-line-tab-inactive ((t (:background "#00212B" :foreground "#60767e"))))
 '(tab-line-tab-inactive-alternate ((t (:background "#00212B" :foreground "#60767e"))))

 ;; term
 '(term ((t (:foreground "#8d9fa1"))))
 '(term-bold ((t (:weight bold))))

 ;; trailing
 '(trailing-whitespace ((t (:background "#ec423a"))))

 ;; treemacs
 '(treemacs-nerd-icons-file-face ((t (:foreground "#35a69c"))))
 '(treemacs-nerd-icons-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))

 ;; typescript
 '(typescript-jsdoc-tag ((t (:foreground "#35a69c"))))
 '(typescript-jsdoc-type ((t (:foreground "#2d8d84"))))
 '(typescript-jsdoc-value ((t (:foreground "#53b3aa"))))

 ;; vertico
 '(vertico-posframe-border ((t (:background "#56697A"))))
 '(vertico-posframe-border-2 ((t (:background "#ec423a"))))
 '(vertico-posframe-border-3 ((t (:background "#93a61a"))))
 '(vertico-posframe-border-4 ((t (:background "#3c98e0"))))
 '(vertico-posframe-border-fallback ((t (:background "#c49619"))))

 ;; vterm
 '(vterm-color-black ((t (:background "#bfcbce" :foreground "#01323d"))))
 '(vterm-color-blue ((t (:background "#cee5f7" :foreground "#3c98e0"))))
 '(vterm-color-cyan ((t (:background "#ceebe8" :foreground "#3cafa5"))))
 '(vterm-color-green ((t (:background "#e3e8c5" :foreground "#93a61a"))))
 '(vterm-color-magenta ((t (:background "#f7d0e3" :foreground "#e2468f"))))
 '(vterm-color-red ((t (:background "#facfcd" :foreground "#ec423a"))))
 '(vterm-color-white ((t (:background "#d7dada" :foreground "#626C6C"))))
 '(vterm-color-yellow ((t (:background "#f0e4c5" :foreground "#c49619"))))

 ;; web
 '(web-mode-block-control-face ((t (:foreground "#db5823"))))
 '(web-mode-block-delimiter-face ((t (:foreground "#3c98e0"))))
 '(web-mode-doctype-face ((t (:foreground "#62787f"))))
 '(web-mode-html-entity-face ((t (:foreground "#3cafa5" :inherit italic))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#db5823"))))
 '(web-mode-json-context-face ((t (:foreground "#93a61a"))))
 '(web-mode-json-key-face ((t (:foreground "#93a61a"))))
 '(web-mode-keyword-face ((t (:foreground "#93a61a"))))
 '(web-mode-string-face ((t (:foreground "#93a61a"))))
 '(web-mode-type-face ((t (:foreground "#c49619"))))

 ;; which
 '(which-func ((t (:foreground "#3c98e0"))))
 '(which-key-group-description-face ((t (:foreground "#7a7ed2"))))
 '(which-key-local-map-description-face ((t (:foreground "#e2468f"))))

 ;; whitespace
 '(whitespace-empty ((t (:background "#13383C"))))
 '(whitespace-indentation ((t (:foreground "#56697A" :background "#13383C"))))
 '(whitespace-line ((t (:background "#01323d" :foreground "#ec423a" :weight bold))))
 '(whitespace-newline ((t (:foreground "#56697A"))))
 '(whitespace-space ((t (:foreground "#56697A"))))
 '(whitespace-tab ((t (:foreground "#56697A"))))
 '(whitespace-trailing ((t (:inherit trailing-whitespace))))

 ;; widget
 '(widget-button-pressed ((t (:foreground "#ec423a"))))
 '(widget-documentation ((t (:foreground "#93a61a"))))
 '(widget-field ((t (:background "#13383C" :distant-foreground "#002732" :box (:line-width -1 :color "#56697A") :extend t))))
 '(widget-single-line-field ((t (:background "#13383C" :distant-foreground "#002732"))))

 ;; window
 '(window-tool-bar-button ((t (:background "#002732" :foreground "#8d9fa1"))))
 '(window-tool-bar-button-disabled ((t (:background "#00212B" :foreground "#60767e"))))
 '(window-tool-bar-button-hover ((t (:inherit highlight :distant-foreground "#002732"))))

 ;; woman
 '(woman-bold ((t (:inherit Man-overstrike))))
 '(woman-italic ((t (:inherit Man-underline))))

 ;; xref
 '(xref-file-header ((t (:inherit success))))
 '(xref-line-number ((t (:foreground "#3c98e0"))))
 '(xref-match ((t (:foreground "#93a61a" :background "#01323d" :weight bold))))

 ;; yas
 '(yas-field-highlight-face ((t (:inherit match))))

 ;; local preferences
 '(lsp-face-semhl-property ((t (:foreground unspecified))))
 '(lsp-face-semhl-member ((t (:foreground unspecified))))
 '(lsp-face-semhl-variable ((t (:foreground unspecified))))
 '(lsp-face-semhl-parameter ((t (:foreground unspecified))))
 '(lsp-face-semhl-macro ((t (:foreground "#ec423a"))))
 '(lsp-rust-analyzer-mutable-modifier-face ((t (:underline nil)))))

(provide-theme 'solarized)

;;; solarized-theme.el ends here
