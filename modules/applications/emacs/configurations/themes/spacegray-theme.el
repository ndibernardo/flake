;;; spacegray-theme.el --- Dark theme with the Spacegray palette  -*- lexical-binding:t -*-

;;; Commentary:
;; Dark theme with the Spacegray palette.

;;; Code:

;;;###theme-autoload
(deftheme spacegray
  "Dark theme with the Spacegray palette."
  :background-mode 'dark
  :kind 'color-scheme
  :family 'spacegray)

(custom-theme-set-faces
 'spacegray

 '(default ((t (:background "#2b303b" :foreground "#c0c5ce"))))
 '(cursor ((t (:background "#D08770"))))
 '(region ((t (:background "#4f5b66" :distant-foreground "#999da4" :extend t))))
 '(highlight ((t (:background "#D08770" :foreground "#1B2229" :distant-foreground "#DFDFDF"))))
 '(hl-line ((t (:background "#232830" :extend t))))
 '(fringe ((t (:inherit default :foreground "#4f5b66" :background unspecified))))
 '(vertical-border ((t (:background "#20242c" :foreground "#20242c"))))
 '(minibuffer-prompt ((t (:foreground "#D08770"))))
 '(isearch ((t (:inherit lazy-highlight :weight bold))))
 '(lazy-highlight ((t (:background "#915e4e" :foreground "#DFDFDF" :distant-foreground "#1B2229" :weight bold))))
 '(link ((t (:foreground "#D08770" :underline t :weight bold))))
 '(link-visited ((t (:foreground "#b48ead" :underline t))))
 '(button ((t (:inherit link))))
 '(header-line ((t (:inherit mode-line))))
 '(tooltip ((t (:background "#232830" :foreground "#c0c5ce"))))
 '(secondary-selection ((t (:background "#4f5b66" :extend t))))

 '(font-lock-builtin-face ((t (:foreground "#D08770"))))
 '(font-lock-comment-face ((t (:foreground "#65737E"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-constant-face ((t (:foreground "#D08770"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground "#8b969e"))))
 '(font-lock-function-name-face ((t (:foreground "#8FA1B3"))))
 '(font-lock-keyword-face ((t (:foreground "#b48ead"))))
 '(font-lock-negation-char-face ((t (:inherit bold :foreground "#c0c5ce"))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#BF616A"))))
 '(font-lock-string-face ((t (:foreground "#A3BE8C"))))
 '(font-lock-type-face ((t (:foreground "#ECBE7B"))))
 '(font-lock-variable-name-face ((t (:foreground unspecified))))
 '(font-lock-warning-face ((t (:inherit warning))))

 '(font-lock-operator-face ((t (:foreground "#c0c5ce"))))
 '(font-lock-punctuation-face ((t (:foreground "#c0c5ce"))))
 '(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit bold :foreground "#c0c5ce"))))
 '(font-lock-regexp-grouping-construct ((t (:inherit bold :foreground "#c0c5ce"))))

 '(mode-line ((t (:background "#1c1f24" :box nil))))
 '(mode-line-inactive ((t (:background "#21262d" :foreground "#636574" :box nil))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:foreground "#D08770"))))
 '(mode-line-highlight ((t (:inherit highlight :distant-foreground "#2b303b"))))

 '(line-number ((t (:inherit default :foreground "#4f5b66" :weight normal :slant normal :background unspecified))))
 '(line-number-current-line ((t (:inherit (hl-line default) :foreground "#c0c5ce" :weight normal :slant normal))))

 '(show-paren-match ((t (:foreground "#BF616A" :background "#1B2229" :weight ultra-bold))))
 '(show-paren-mismatch ((t (:foreground "#1B2229" :background "#BF616A" :weight ultra-bold))))

 '(match ((t (:foreground "#A3BE8C" :background "#1B2229" :weight bold))))
 '(query-replace ((t (:inherit isearch))))

 '(diff-added ((t (:inherit hl-line :foreground "#A3BE8C"))))
 '(diff-removed ((t (:foreground "#BF616A" :background "#2F3237"))))
 '(diff-changed ((t (:foreground "#b48ead"))))
 '(diff-header ((t (:foreground "#46D9FF"))))
 '(diff-file-header ((t (:foreground "#8FA1B3"))))

 '(compilation-error ((t (:inherit error :weight bold))))
 '(compilation-warning ((t (:inherit warning :slant normal))))
 '(compilation-info ((t (:inherit success))))
 '(compilation-line-number ((t (:foreground "#D08770"))))

 '(org-todo ((t (:foreground "#A3BE8C" :bold inherit))))
 '(org-done ((t (:inherit org-headline-done :weight bold))))
 '(org-headline-done ((t (:foreground "#65737E"))))
 '(org-date ((t (:foreground "#ECBE7B"))))
 '(org-link ((t (:inherit link :foreground "#D08770"))))
 '(org-block ((t (:background "#21262e"))))
 '(org-block-begin-line ((t (:foreground "#4f5b66" :slant normal :background "#292e38"))))
 '(org-block-end-line ((t (:inherit org-block-begin-line))))
 '(org-code ((t (:inherit org-block :foreground "#D08770"))))
 '(org-verbatim ((t (:foreground "#A3BE8C"))))

 '(outline-1 ((t (:foreground "#c0c5ce" :weight ultra-bold :extend t))))
 '(outline-2 ((t (:foreground "#a0adbc" :weight bold :extend t))))
 '(outline-3 ((t (:foreground "#b1bac5" :weight bold :extend t))))
 '(outline-4 ((t (:foreground "#8FA1B3" :weight bold :extend t))))
 '(outline-5 ((t (:foreground "#9a98bb" :weight bold :extend t))))
 '(outline-6 ((t (:foreground "#a590c3" :weight bold :extend t))))
 '(outline-7 ((t (:foreground "#b088cc" :weight bold :extend t))))
 '(outline-8 ((t (:foreground "#c0c5ce" :weight bold :extend t))))

 '(dired-directory ((t (:foreground "#D08770"))))
 '(dired-symlink ((t (:foreground "#46D9FF" :weight bold))))
 '(dired-header ((t (:foreground "#8FA1B3" :weight bold))))

 '(eshell-prompt ((t (:foreground "#D08770" :weight bold))))
 '(eshell-ls-directory ((t (:foreground "#8FA1B3"))))
 '(eshell-ls-executable ((t (:foreground "#A3BE8C"))))
 '(eshell-ls-symlink ((t (:foreground "#46D9FF"))))

 '(company-tooltip ((t (:inherit tooltip))))
 '(company-tooltip-selection ((t (:background "#4f5b66" :weight bold))))
 '(company-tooltip-common ((t (:foreground "#D08770" :distant-foreground "#1B2229" :weight bold))))
 '(company-scrollbar-fg ((t (:background "#D08770"))))
 '(company-scrollbar-bg ((t (:inherit tooltip))))

 '(corfu-default ((t (:inherit tooltip))))
 '(corfu-current ((t (:background "#2b303b" :foreground "#c0c5ce"))))
 '(corfu-bar ((t (:background "#65737E"))))
 '(corfu-border ((t (:background "#4f5b66"))))
 '(corfu-annotations ((t (:foreground "#65737E"))))
 '(corfu-deprecated ((t (:foreground "#65737E" :strike-through t))))
 '(corfu-echo ((t (:foreground "#65737E"))))
 '(corfu-popupinfo ((t (:background "#232830" :foreground "#c0c5ce"))))

 '(flycheck-error ((t (:underline (:style wave :color "#BF616A")))))
 '(flycheck-warning ((t (:underline (:style wave :color "#ECBE7B")))))
 '(flycheck-info ((t (:underline (:style wave :color "#A3BE8C")))))

 '(git-gutter:added ((t (:inherit fringe :foreground "#A3BE8C"))))
 '(git-gutter:deleted ((t (:inherit fringe :foreground "#BF616A"))))
 '(git-gutter:modified ((t (:inherit fringe :foreground "#D08770"))))

 '(magit-branch-current ((t (:foreground "#8FA1B3"))))
 '(magit-branch-local ((t (:foreground "#46D9FF"))))
 '(magit-branch-remote ((t (:foreground "#A3BE8C"))))
 '(magit-branch-upstream ((t (:foreground "#A3BE8C"))))
 '(magit-tag ((t (:foreground "#ECBE7B"))))
 '(magit-hash ((t (:foreground "#65737E"))))
 '(magit-section-heading ((t (:foreground "#8FA1B3" :weight bold :extend t))))
 '(magit-section-highlight ((t (:inherit hl-line))))
 '(magit-section-heading-selection ((t (:foreground "#D08770" :weight bold :extend t))))
 '(magit-diff-file-heading ((t (:foreground "#c0c5ce" :weight bold :extend t))))
 '(magit-diff-file-heading-highlight ((t (:background "#2F3237" :foreground "#c0c5ce"))))
 '(magit-diff-hunk-heading ((t (:foreground "#2b303b" :background "#544c5d" :extend t))))
 '(magit-diff-hunk-heading-highlight ((t (:foreground "#2b303b" :background "#b48ead" :weight bold :extend t))))
 '(magit-diff-context ((t (:foreground "#73767b" :background "#2b303b" :extend t))))
 '(magit-diff-context-highlight ((t (:foreground "#c0c5ce" :background "#232830" :extend t))))
 '(magit-diff-added ((t (:foreground "#829870" :background "#373e43" :extend t))))
 '(magit-diff-added-highlight ((t (:foreground "#A3BE8C" :background "#434c4b" :weight bold :extend t))))
 '(magit-diff-removed ((t (:foreground "#984d54" :background "#3d363c" :extend t))))
 '(magit-diff-removed-highlight ((t (:foreground "#BF616A" :background "#4b3b41" :weight bold :extend t))))
 '(magit-diffstat-added ((t (:foreground "#A3BE8C"))))
 '(magit-diffstat-removed ((t (:foreground "#BF616A"))))
 '(magit-log-author ((t (:foreground "#D08770"))))
 '(magit-log-date ((t (:foreground "#8FA1B3"))))
 '(magit-log-graph ((t (:foreground "#65737E"))))
 '(magit-process-ok ((t (:inherit success))))
 '(magit-process-ng ((t (:inherit error))))

 '(vertico-current ((t (:background "#4f5b66" :extend t))))
 '(vertico-group-title ((t (:foreground "#65737E" :weight bold))))
 '(vertico-group-separator ((t (:foreground "#4f5b66" :strike-through t))))
 '(vertico-multiline ((t (:foreground "#65737E"))))
 '(vertico-quick1 ((t (:background "#232830" :foreground "#8FA1B3" :weight bold))))
 '(vertico-quick2 ((t (:background "#232830" :foreground "#A3BE8C" :weight bold))))

 '(orderless-match-face-0 ((t (:weight bold :foreground "#a2afbd" :background "#353b47"))))
 '(orderless-match-face-1 ((t (:weight bold :foreground "#c396d7" :background "#3a374b"))))
 '(orderless-match-face-2 ((t (:weight bold :foreground "#aec0a6" :background "#373e43"))))
 '(orderless-match-face-3 ((t (:weight bold :foreground "#dac09c" :background "#3e3e41"))))

 '(marginalia-documentation ((t (:inherit font-lock-doc-face))))
 '(marginalia-key ((t (:foreground "#A3BE8C"))))
 '(marginalia-type ((t (:foreground "#b48ead"))))
 '(marginalia-char ((t (:foreground "#8FA1B3"))))
 '(marginalia-lighter ((t (:foreground "#b48ead"))))
 '(marginalia-on ((t (:foreground "#A3BE8C"))))
 '(marginalia-off ((t (:foreground "#BF616A"))))

 '(consult-file ((t (:foreground "#c0c5ce"))))
 '(consult-bookmark ((t (:foreground "#8FA1B3"))))
 '(consult-async-running ((t (:foreground "#8FA1B3"))))
 '(consult-async-finished ((t (:foreground "#A3BE8C"))))
 '(consult-async-failed ((t (:foreground "#BF616A"))))
 '(consult-preview-line ((t (:background "#2F3237"))))
 '(consult-preview-match ((t (:background "#4f5b66"))))

 '(ivy-current-match ((t (:background "#4f5b66" :extend t))))
 '(ivy-minibuffer-match-face-1 ((t (:foreground "#67717b" :weight light))))
 '(helm-selection ((t (:inherit bold :background "#4f5b66" :extend t :distant-foreground "#D08770"))))
 '(helm-match ((t (:inherit bold :foreground "#D08770" :distant-foreground "#DFDFDF"))))

 '(term-color-black ((t (:background "#1B2229" :foreground "#1B2229"))))
 '(term-color-red ((t (:background "#BF616A" :foreground "#BF616A"))))
 '(term-color-green ((t (:background "#A3BE8C" :foreground "#A3BE8C"))))
 '(term-color-yellow ((t (:background "#ECBE7B" :foreground "#ECBE7B"))))
 '(term-color-blue ((t (:background "#8FA1B3" :foreground "#8FA1B3"))))
 '(term-color-magenta ((t (:background "#c678dd" :foreground "#c678dd"))))
 '(term-color-cyan ((t (:background "#46D9FF" :foreground "#46D9FF"))))
 '(term-color-white ((t (:background "#DFDFDF" :foreground "#DFDFDF"))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#8FA1B3"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#c678dd"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#A3BE8C"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#b48ead"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#4db5bd"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#8FA1B3"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#c678dd"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#A3BE8C"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#b48ead"))))

 '(lsp-face-highlight-textual ((t (:weight bold :background "#2F3237" :foreground "#1B2229" :distant-foreground "#DFDFDF"))))
 '(lsp-face-highlight-read ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-face-highlight-write ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-ui-doc-background ((t (:inherit tooltip))))
 '(lsp-ui-peek-selection ((t (:foreground "#2b303b" :background "#8FA1B3" :bold t))))
 '(lsp-ui-sideline-code-action ((t (:foreground "#b77968"))))

 '(which-key-key-face ((t (:foreground "#A3BE8C"))))
 '(which-key-command-description-face ((t (:foreground "#8FA1B3"))))

 '(web-mode-html-tag-face ((t (:foreground "#8FA1B3"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#ECBE7B"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#A3BE8C"))))
 '(web-mode-css-property-name-face ((t (:foreground "#ECBE7B"))))

 '(js2-function-param ((t (:foreground "#BF616A"))))
 '(js2-function-call ((t (:foreground "#8FA1B3"))))
 '(js2-object-property ((t (:foreground "#b48ead"))))
 '(js2-jsdoc-tag ((t (:foreground "#8b969e"))))
 '(js2-external-variable ((t (:foreground "#c0c5ce"))))

 '(markdown-bold-face ((t (:inherit bold :foreground "#D08770"))))
 '(markdown-italic-face ((t (:inherit italic :foreground "#b48ead"))))
 '(markdown-link-face ((t (:foreground "#D08770"))))
 '(markdown-url-face ((t (:foreground "#c678dd" :weight normal))))
 '(markdown-code-face ((t (:background "#262b35" :extend t))))
 '(markdown-blockquote-face ((t (:inherit italic :foreground "#8b969e"))))

 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))
 '(treemacs-directory-face ((t (:foreground "#c0c5ce"))))
 '(treemacs-file-face ((t (:foreground "#c0c5ce"))))
 '(treemacs-tags-face ((t (:foreground "#D08770"))))
 '(treemacs-fringe-indicator-face ((t (:foreground "#D08770"))))
 '(treemacs-git-added-face ((t (:foreground "#A3BE8C"))))
 '(treemacs-git-modified-face ((t (:foreground "#ECBE7B"))))
 '(treemacs-git-conflict-face ((t (:foreground "#BF616A"))))
 '(treemacs-git-untracked-face ((t (:foreground "#A3BE8C"))))
 '(treemacs-git-renamed-face ((t (:foreground "#ECBE7B"))))
 '(treemacs-git-ignored-face ((t (:foreground "#65737E"))))
 '(treemacs-on-success-pulse-face ((t (:foreground "#1B2229" :background "#A3BE8C" :extend t))))
 '(treemacs-on-failure-pulse-face ((t (:foreground "#1B2229" :background "#BF616A" :extend t))))

 '(window-divider ((t (:inherit vertical-border))))
 '(window-divider-first-pixel ((t (:inherit window-divider))))
 '(window-divider-last-pixel ((t (:inherit window-divider))))

 '(error ((t (:foreground "#BF616A"))))
 '(warning ((t (:foreground "#ECBE7B"))))
 '(success ((t (:foreground "#A3BE8C"))))

 ;; Man
 '(Man-overstrike ((t (:inherit bold :foreground "#c0c5ce"))))
 '(Man-underline ((t (:inherit underline :foreground "#b48ead"))))

 ;; ansi
 '(ansi-color-black ((t (:foreground "#2b303b" :background "#2b303b"))))
 '(ansi-color-blue ((t (:foreground "#8FA1B3" :background "#8FA1B3"))))
 '(ansi-color-bright-black ((t (:foreground "#4f5b66" :background "#4f5b66"))))
 '(ansi-color-bright-blue ((t (:foreground "#9fafbe" :background "#9fafbe"))))
 '(ansi-color-bright-cyan ((t (:foreground "#61deff" :background "#61deff"))))
 '(ansi-color-bright-green ((t (:foreground "#b0c79d" :background "#b0c79d"))))
 '(ansi-color-bright-magenta ((t (:foreground "#ce8ce2" :background "#ce8ce2"))))
 '(ansi-color-bright-red ((t (:foreground "#c87880" :background "#c87880"))))
 '(ansi-color-bright-white ((t (:foreground "#DFDFDF" :background "#DFDFDF"))))
 '(ansi-color-bright-yellow ((t (:foreground "#eec78e" :background "#eec78e"))))
 '(ansi-color-cyan ((t (:foreground "#46D9FF" :background "#46D9FF"))))
 '(ansi-color-green ((t (:foreground "#A3BE8C" :background "#A3BE8C"))))
 '(ansi-color-magenta ((t (:foreground "#c678dd" :background "#c678dd"))))
 '(ansi-color-red ((t (:foreground "#BF616A" :background "#BF616A"))))
 '(ansi-color-white ((t (:foreground "#c0c5ce" :background "#c0c5ce"))))
 '(ansi-color-yellow ((t (:foreground "#ECBE7B" :background "#ECBE7B"))))

 ;; avy
 '(avy-background-face ((t (:foreground "#65737E"))))
 '(avy-lead-face ((t (:background "#D08770" :foreground "#2b303b" :distant-foreground "#c0c5ce" :weight bold))))
 '(avy-lead-face-0 ((t (:inherit avy-lead-face :background "#deab9a"))))
 '(avy-lead-face-1 ((t (:inherit avy-lead-face :background "#eccfc5"))))
 '(avy-lead-face-2 ((t (:inherit avy-lead-face :background "#faf3f0"))))

 ;; bold
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:inherit (bold italic)))))

 ;; bookmark
 '(bookmark-face ((t (:background "#3b3840" :extend t))))

 ;; cider
 '(cider-debug-code-overlay-face ((t (:background "#2F3237"))))
 '(cider-deprecated-face ((t (:background "#514c47"))))
 '(cider-enlightened-face ((t (:inherit cider-result-overlay-face :box (:color "#D08770" :line-width -1)))))
 '(cider-enlightened-local-face ((t (:foreground "#D08770" :weight bold))))
 '(cider-error-highlight-face ((t (:underline (:style wave :color "#BF616A")))))
 '(cider-fringe-good-face ((t (:foreground "#A3BE8C"))))
 '(cider-instrumented-face ((t (:background "#483944"))))
 '(cider-result-overlay-face ((t (:background "#2F3237" :box (:line-width -1 :color "#65737E")))))
 '(cider-test-error-face ((t (:background "#D08770"))))
 '(cider-test-failure-face ((t (:background "#573e49"))))
 '(cider-test-success-face ((t (:foreground "#1B2229" :background "#A3BE8C"))))
 '(cider-traced-face ((t (:background "#305162"))))
 '(cider-warning-highlight-face ((t (:underline (:style wave :color "#ECBE7B")))))

 ;; compilation
 '(compilation-column-number ((t (:inherit font-lock-comment-face))))
 '(compilation-mode-line-exit ((t (:inherit compilation-info))))
 '(compilation-mode-line-fail ((t (:inherit compilation-error))))

 ;; custom
 '(custom-button ((t (:foreground "#8FA1B3" :background "#2b303b" :box (:line-width 1 :style nil)))))
 '(custom-button-mouse ((t (:foreground "#2b303b" :background "#8FA1B3" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed ((t (:foreground "#2b303b" :background "#8FA1B3" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed-unraised ((t (:foreground "#2b303b" :background "#b48ead" :box (:line-width 1 :style nil)))))
 '(custom-button-unraised ((t (:foreground "#b48ead" :background "#2b303b" :box (:line-width 1 :style nil)))))
 '(custom-changed ((t (:foreground "#8FA1B3" :background "#2b303b"))))
 '(custom-comment ((t (:foreground "#c0c5ce" :background "#4f5b66"))))
 '(custom-comment-tag ((t (:foreground "#4f5b66"))))
 '(custom-group-subtitle ((t (:foreground "#BF616A"))))
 '(custom-group-tag ((t (:foreground "#b48ead"))))
 '(custom-group-tag-1 ((t (:foreground "#8FA1B3"))))
 '(custom-invalid ((t (:foreground "#BF616A" :background "#483944"))))
 '(custom-modified ((t (:foreground "#8FA1B3" :background "#3f4653"))))
 '(custom-saved ((t (:foreground "#A3BE8C" :background "#434c4b" :bold t))))
 '(custom-set ((t (:foreground "#ECBE7B" :background "#2b303b"))))
 '(custom-state ((t (:foreground "#A3BE8C" :background "#434c4b"))))
 '(custom-themed ((t (:foreground "#ECBE7B" :background "#2b303b"))))
 '(custom-variable-button ((t (:foreground "#A3BE8C" :underline t))))
 '(custom-variable-obsolete ((t (:foreground "#4f5b66" :background "#2b303b"))))
 '(custom-variable-tag ((t (:foreground "#c678dd"))))
 '(custom-visibility ((t (:foreground "#8FA1B3"))))

 ;; diff
 '(diff-context ((t (:foreground "#a8adb5"))))
 '(diff-hl-change ((t (:foreground "#D08770" :background "#D08770"))))
 '(diff-hl-delete ((t (:foreground "#BF616A" :background "#BF616A"))))
 '(diff-hl-insert ((t (:foreground "#A3BE8C" :background "#A3BE8C"))))
 '(diff-hunk-header ((t (:foreground "#b48ead"))))
 '(diff-indicator-added ((t (:foreground "#A3BE8C"))))
 '(diff-indicator-changed ((t (:foreground "#D08770"))))
 '(diff-indicator-removed ((t (:foreground "#BF616A"))))
 '(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
 '(diff-refine-changed ((t (:inherit diff-changed :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-removed :inverse-video t))))

 ;; dired
 '(dired-flagged ((t (:foreground "#BF616A"))))
 '(dired-ignored ((t (:foreground "#65737E"))))
 '(dired-k-added ((t (:foreground "#A3BE8C" :weight bold))))
 '(dired-k-commited ((t (:foreground "#A3BE8C" :weight bold))))
 '(dired-k-directory ((t (:foreground "#8FA1B3" :weight bold))))
 '(dired-k-ignored ((t (:foreground "#65737E" :weight bold))))
 '(dired-k-modified ((t (:foreground "#D08770" :weight bold))))
 '(dired-k-untracked ((t (:foreground "#4db5bd" :weight bold))))
 '(dired-mark ((t (:foreground "#D08770" :weight bold))))
 '(dired-marked ((t (:foreground "#c678dd" :weight bold :inverse-video t))))
 '(dired-perm-write ((t (:foreground "#c0c5ce" :underline t))))
 '(dired-subtree-depth-1-face ((t (:background "#22272f"))))
 '(dired-subtree-depth-2-face ((t (:background "#21262e"))))
 '(dired-subtree-depth-3-face ((t (:background "#20252d"))))
 '(dired-subtree-depth-4-face ((t (:background "#20242c"))))
 '(dired-subtree-depth-5-face ((t (:background "#1f242b"))))
 '(dired-subtree-depth-6-face ((t (:background "#1e232a"))))
 '(dired-warning ((t (:foreground "#ECBE7B"))))

 ;; ediff
 '(ediff-current-diff-A ((t (:foreground "#BF616A" :background "#4b3b41" :extend t))))
 '(ediff-current-diff-B ((t (:foreground "#A3BE8C" :background "#434c4b" :extend t))))
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
 '(elfeed-log-debug-level-face ((t (:foreground "#65737E"))))
 '(elfeed-log-error-level-face ((t (:inherit error))))
 '(elfeed-log-info-level-face ((t (:inherit success))))
 '(elfeed-log-warn-level-face ((t (:inherit warning))))
 '(elfeed-search-date-face ((t (:foreground "#b48ead"))))
 '(elfeed-search-feed-face ((t (:foreground "#8FA1B3"))))
 '(elfeed-search-filter-face ((t (:foreground "#b48ead"))))
 '(elfeed-search-tag-face ((t (:foreground "#65737E"))))
 '(elfeed-search-title-face ((t (:foreground "#65737E"))))
 '(elfeed-search-unread-count-face ((t (:foreground "#ECBE7B"))))
 '(elfeed-search-unread-title-face ((t (:foreground "#c0c5ce" :weight bold))))

 ;; elixir
 '(elixir-atom-face ((t (:foreground "#2257A0"))))
 '(elixir-attribute-face ((t (:foreground "#b48ead"))))

 ;; escape
 '(escape-glyph ((t (:foreground "#46D9FF"))))

 ;; eshell
 '(eshell-ls-archive ((t (:foreground "#c678dd"))))
 '(eshell-ls-backup ((t (:foreground "#ECBE7B"))))
 '(eshell-ls-clutter ((t (:foreground "#BF616A"))))
 '(eshell-ls-missing ((t (:foreground "#BF616A"))))
 '(eshell-ls-product ((t (:foreground "#D08770"))))
 '(eshell-ls-readonly ((t (:foreground "#D08770"))))
 '(eshell-ls-special ((t (:foreground "#b48ead"))))
 '(eshell-ls-unreadable ((t (:foreground "#65737E"))))

 ;; flycheck
 '(flycheck-fringe-error ((t (:inherit fringe :foreground "#BF616A"))))
 '(flycheck-fringe-info ((t (:inherit fringe :foreground "#A3BE8C"))))
 '(flycheck-fringe-warning ((t (:inherit fringe :foreground "#ECBE7B"))))
 '(flycheck-posframe-background-face ((t (:background "#232830"))))
 '(flycheck-posframe-error-face ((t (:inherit flycheck-posframe-face :foreground "#BF616A"))))
 '(flycheck-posframe-face ((t (:inherit default))))
 '(flycheck-posframe-info-face ((t (:inherit flycheck-posframe-face :foreground "#A3BE8C"))))
 '(flycheck-posframe-warning-face ((t (:inherit flycheck-posframe-face :foreground "#ECBE7B"))))

 ;; flymake
 '(flymake-error ((t (:underline (:style wave :color "#BF616A")))))
 '(flymake-note ((t (:underline (:style wave :color "#A3BE8C")))))
 '(flymake-warning ((t (:underline (:style wave :color "#D08770")))))

 ;; font
 '(font-latex-bold-face ((t (:inherit bold))))
 '(font-latex-italic-face ((t (:inherit italic))))
 '(font-latex-math-face ((t (:foreground "#8FA1B3"))))
 '(font-latex-script-char-face ((t (:foreground "#2257A0"))))
 '(font-latex-sectioning-0-face ((t (:foreground "#8FA1B3" :weight ultra-bold))))
 '(font-latex-sectioning-1-face ((t (:foreground "#c678dd" :weight semi-bold))))
 '(font-latex-sectioning-2-face ((t (:foreground "#b48ead" :weight semi-bold))))
 '(font-latex-sectioning-3-face ((t (:foreground "#b0bdc9" :weight semi-bold))))
 '(font-latex-sectioning-4-face ((t (:foreground "#d7a0e7" :weight semi-bold))))
 '(font-latex-sectioning-5-face ((t (:foreground "#caafc5" :weight semi-bold))))
 '(font-latex-sedate-face ((t (:inherit font-lock-keyword-face))))
 '(font-latex-string-face ((t (:inherit font-lock-string-face))))
 '(font-latex-underline-face ((t (:inherit underline))))
 '(font-latex-verbatim-face ((t (:inherit fixed-pitch :foreground "#b48ead" :slant normal))))
 '(font-latex-warning-face ((t (:inherit font-lock-warning-face))))
 '(font-lock-escape-face ((t (:inherit font-lock-regexp-grouping-backslash))))
 '(font-lock-function-call-face ((t (:inherit font-lock-function-name-face :slant normal :foreground "#9dabbb"))))
 '(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-number-face ((t (:foreground "#D08770"))))
 '(font-lock-preprocessor-char-face ((t (:inherit bold :foreground "#c0c5ce"))))
 '(font-lock-property-name-face ((t (:foreground "#b8a4ba" :weight bold))))
 '(font-lock-property-use-face ((t (:inherit font-lock-property-name-face :weight regular))))
 '(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face :foreground unspecified))))

 ;; git
 '(git-commit-comment-branch-local ((t (:foreground "#c678dd"))))
 '(git-commit-comment-branch-remote ((t (:foreground "#A3BE8C"))))
 '(git-commit-comment-detached ((t (:foreground "#D08770"))))
 '(git-commit-comment-file ((t (:foreground "#b48ead"))))
 '(git-commit-comment-heading ((t (:foreground "#b48ead"))))
 '(git-commit-keyword ((t (:foreground "#46D9FF" :slant normal))))
 '(git-commit-known-pseudo-header ((t (:foreground "#8b969e" :weight bold :slant normal))))
 '(git-commit-nonempty-second-line ((t (:inherit git-commit-overlong-summary))))
 '(git-commit-overlong-summary ((t (:inherit error :background "#1B2229" :slant normal :weight bold))))
 '(git-commit-pseudo-header ((t (:foreground "#8b969e" :slant normal))))
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
 '(hi-blue ((t (:background "#8FA1B3"))))
 '(hi-blue-b ((t (:foreground "#8FA1B3" :weight bold))))
 '(hi-green ((t (:background "#A3BE8C"))))
 '(hi-green-b ((t (:foreground "#A3BE8C" :weight bold))))
 '(hi-pink ((t (:background "#c678dd"))))
 '(hi-red-b ((t (:foreground "#BF616A" :weight bold))))
 '(hi-yellow ((t (:background "#ECBE7B"))))

 ;; highlight
 '(highlight-indentation-current-column-face ((t (:background "#1c1f24"))))
 '(highlight-indentation-face ((t (:inherit hl-line))))
 '(highlight-indentation-guides-even-face ((t (:inherit highlight-indentation-face))))
 '(highlight-indentation-guides-odd-face ((t (:inherit highlight-indentation-face))))
 '(highlight-numbers-number ((t (:inherit bold :foreground "#D08770"))))
 '(highlight-quoted-quote ((t (:foreground "#c0c5ce"))))
 '(highlight-quoted-symbol ((t (:foreground "#ECBE7B"))))
 '(highlight-symbol-face ((t (:background "#606b75" :distant-foreground "#c0c5ce"))))
 '(highlight-thing ((t (:background "#606b75" :distant-foreground "#c0c5ce"))))

 ;; hl
 '(hl-fill-column-face ((t (:inherit (hl-line shadow)))))
 '(hl-todo ((t (:foreground "#BF616A" :weight bold))))

 ;; imenu
 '(imenu-list-entry-face-0 ((t (:foreground "#D08770"))))
 '(imenu-list-entry-face-1 ((t (:foreground "#A3BE8C"))))
 '(imenu-list-entry-face-2 ((t (:foreground "#ECBE7B"))))
 '(imenu-list-entry-subalist-face-0 ((t (:inherit imenu-list-entry-face-0 :weight bold))))
 '(imenu-list-entry-subalist-face-1 ((t (:inherit imenu-list-entry-face-1 :weight bold))))
 '(imenu-list-entry-subalist-face-2 ((t (:inherit imenu-list-entry-face-2 :weight bold))))

 ;; indent
 '(indent-guide-face ((t (:inherit hl-line))))

 ;; isearch
 '(isearch-fail ((t (:background "#BF616A" :foreground "#1B2229" :weight bold))))

 ;; italic
 '(italic ((t (:slant normal))))

 ;; lsp
 '(lsp-headerline-breadcrumb-separator-face ((t (:inherit shadow))))
 '(lsp-ui-peek-filename ((t (:inherit mode-line-buffer-id))))
 '(lsp-ui-peek-header ((t (:foreground "#c0c5ce" :background "#40444e" :bold t))))
 '(lsp-ui-peek-highlight ((t (:inherit isearch :box t))))
 '(lsp-ui-peek-line-number ((t (:foreground "#A3BE8C"))))
 '(lsp-ui-peek-list ((t (:background "#262b35"))))
 '(lsp-ui-peek-peek ((t (:background "#262b35"))))
 '(lsp-ui-sideline-current-symbol ((t (:inherit highlight))))
 '(lsp-ui-sideline-symbol-info ((t (:foreground "#5c6873" :background "#232830" :extend t))))

 ;; magit
 '(magit-bisect-bad ((t (:foreground "#BF616A"))))
 '(magit-bisect-good ((t (:foreground "#A3BE8C"))))
 '(magit-bisect-skip ((t (:foreground "#D08770"))))
 '(magit-blame-date ((t (:foreground "#BF616A"))))
 '(magit-blame-hash ((t (:foreground "#46D9FF"))))
 '(magit-blame-heading ((t (:foreground "#D08770" :background "#2F3237" :extend t))))
 '(magit-cherry-equivalent ((t (:foreground "#b48ead"))))
 '(magit-cherry-unmatched ((t (:foreground "#46D9FF"))))
 '(magit-diff-base ((t (:foreground "#a66c59" :background "#3b3840" :extend t))))
 '(magit-diff-base-highlight ((t (:foreground "#D08770" :background "#4c4145" :weight bold :extend t))))
 '(magit-diff-file-heading-selection ((t (:foreground "#c678dd" :background "#2257A0" :weight bold :extend t))))
 '(magit-diff-lines-heading ((t (:foreground "#ECBE7B" :background "#BF616A" :extend t :extend t))))
 '(magit-dimmed ((t (:foreground "#c0c5ce"))))
 '(magit-filename ((t (:foreground "#b48ead"))))
 '(magit-header-line ((t (:background "#2257A0" :foreground "#DFDFDF" :weight bold :box (:line-width 3 :color "#2257A0")))))
 '(magit-reflog-amend ((t (:foreground "#c678dd"))))
 '(magit-reflog-checkout ((t (:foreground "#8FA1B3"))))
 '(magit-reflog-cherry-pick ((t (:foreground "#A3BE8C"))))
 '(magit-reflog-commit ((t (:foreground "#A3BE8C"))))
 '(magit-reflog-merge ((t (:foreground "#A3BE8C"))))
 '(magit-reflog-other ((t (:foreground "#46D9FF"))))
 '(magit-reflog-rebase ((t (:foreground "#c678dd"))))
 '(magit-reflog-remote ((t (:foreground "#46D9FF"))))
 '(magit-reflog-reset ((t (:inherit error))))
 '(magit-refname ((t (:foreground "#65737E"))))
 '(magit-section-secondary-heading ((t (:foreground "#b48ead" :weight bold :extend t))))
 '(magit-sequence-drop ((t (:foreground "#BF616A"))))
 '(magit-sequence-head ((t (:foreground "#8FA1B3"))))
 '(magit-sequence-part ((t (:foreground "#D08770"))))
 '(magit-sequence-stop ((t (:foreground "#A3BE8C"))))
 '(magit-signature-bad ((t (:inherit error))))
 '(magit-signature-error ((t (:inherit error))))
 '(magit-signature-expired ((t (:foreground "#D08770"))))
 '(magit-signature-good ((t (:inherit success))))
 '(magit-signature-revoked ((t (:foreground "#c678dd"))))
 '(magit-signature-untrusted ((t (:foreground "#ECBE7B"))))

 ;; makefile
 '(makefile-targets ((t (:foreground "#8FA1B3"))))

 ;; marginalia
 '(marginalia-file-priv-dir ((t (:foreground "#8FA1B3"))))
 '(marginalia-file-priv-exec ((t (:foreground "#A3BE8C"))))
 '(marginalia-file-priv-link ((t (:foreground "#b48ead"))))
 '(marginalia-file-priv-other ((t (:foreground "#c678dd"))))
 '(marginalia-file-priv-rare ((t (:foreground "#c0c5ce"))))
 '(marginalia-file-priv-read ((t (:foreground "#ECBE7B"))))
 '(marginalia-file-priv-write ((t (:foreground "#BF616A"))))
 '(marginalia-number ((t (:foreground "#D08770"))))
 '(marginalia-size ((t (:foreground "#b48ead"))))

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
 '(markdown-markup-face ((t (:foreground "#65737E"))))
 '(markdown-metadata-key-face ((t (:foreground "#BF616A"))))
 '(markdown-pre-face ((t (:foreground "#A3BE8C"))))
 '(markdown-reference-face ((t (:foreground "#8b969e"))))

 ;; mc/cursor
 '(mc/cursor-face ((t (:inherit cursor))))

 ;; message
 '(message-cited-text ((t (:foreground "#b48ead"))))
 '(message-cited-text-1 ((t (:foreground "#ECBE7B"))))
 '(message-cited-text-2 ((t (:foreground "#c678dd"))))
 '(message-cited-text-3 ((t (:foreground "#A3BE8C"))))
 '(message-cited-text-4 ((t (:foreground "#A3BE8C"))))
 '(message-header-cc ((t (:inherit message-header-to :foreground "#b0725f"))))
 '(message-header-name ((t (:foreground "#A3BE8C"))))
 '(message-header-newsgroups ((t (:foreground "#ECBE7B"))))
 '(message-header-other ((t (:foreground "#b48ead"))))
 '(message-header-subject ((t (:foreground "#D08770" :weight bold))))
 '(message-header-to ((t (:foreground "#D08770" :weight bold))))
 '(message-header-xheader ((t (:foreground "#8b969e"))))
 '(message-mml ((t (:foreground "#65737E" :slant normal))))
 '(message-separator ((t (:foreground "#65737E"))))

 ;; mode
 '(mode-line-active ((t (:inherit mode-line))))

 ;; nobreak
 '(nobreak-space ((t (:inherit escape-glyph :underline t))))

 ;; org
 '(org-agenda-clocking ((t (:background "#3f4653"))))
 '(org-agenda-date ((t (:foreground "#b48ead" :weight ultra-bold))))
 '(org-agenda-date-today ((t (:foreground "#d2bbcd" :weight ultra-bold))))
 '(org-agenda-date-weekend ((t (:foreground "#6c5567" :weight ultra-bold))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "#65737E"))))
 '(org-agenda-done ((t (:inherit org-done))))
 '(org-agenda-structure ((t (:foreground "#c0c5ce" :weight ultra-bold))))
 '(org-archived ((t (:foreground "#8b969e"))))
 '(org-block-background ((t (:background "#2F3237" :extend t))))
 '(org-checkbox ((t (:inherit org-todo))))
 '(org-checkbox-statistics-done ((t (:inherit org-done))))
 '(org-checkbox-statistics-todo ((t (:inherit org-todo))))
 '(org-cite ((t (:foreground "#58b6be"))))
 '(org-cite-key ((t (:foreground "#7bbbc3" :underline t))))
 '(org-default ((t (:inherit variable-pitch))))
 '(org-document-info ((t (:foreground "#D08770"))))
 '(org-document-title ((t (:foreground "#D08770" :weight bold))))
 '(org-drawer ((t (:foreground "#65737E"))))
 '(org-ellipsis ((t (:background "#2b303b" :foreground "#BF616A"))))
 '(org-footnote ((t (:foreground "#D08770"))))
 '(org-formula ((t (:foreground "#46D9FF"))))
 '(org-habit-alert-face ((t (:weight bold :background "#877355"))))
 '(org-habit-alert-future-face ((t (:weight bold :background "#5f5546"))))
 '(org-habit-clear-face ((t (:weight bold :background "#4f5b66"))))
 '(org-habit-clear-future-face ((t (:weight bold :background "#2F3237"))))
 '(org-habit-overdue-face ((t (:weight bold :background "#71444d"))))
 '(org-habit-overdue-future-face ((t (:weight bold :background "#513941"))))
 '(org-habit-ready-face ((t (:weight bold :background "#596471"))))
 '(org-habit-ready-future-face ((t (:weight bold :background "#434c57"))))
 '(org-hide ((t (:foreground "#2b303b"))))
 '(org-journal-calendar-entry-face ((t (:foreground "#c678dd" :slant normal))))
 '(org-journal-calendar-scheduled-face ((t (:foreground "#BF616A" :slant normal))))
 '(org-journal-highlight ((t (:foreground "#D08770"))))
 '(org-latex-and-related ((t (:foreground "#DFDFDF" :weight bold))))
 '(org-list-dt ((t (:foreground "#D08770"))))
 '(org-meta-line ((t (:foreground "#8b969e"))))
 '(org-pomodoro-mode-line ((t (:foreground "#BF616A"))))
 '(org-pomodoro-mode-line-overtime ((t (:foreground "#ECBE7B" :weight bold))))
 '(org-priority ((t (:foreground "#BF616A"))))
 '(org-property-value ((t (:foreground "#8b969e"))))
 '(org-quote ((t (:inherit org-block :slant normal :background "#1c1f24"))))
 '(org-ref-acronym-face ((t (:foreground "#b48ead"))))
 '(org-ref-cite-face ((t (:foreground "#ECBE7B" :weight light :underline t))))
 '(org-ref-glossary-face ((t (:foreground "#c678dd"))))
 '(org-ref-label-face ((t (:foreground "#8FA1B3"))))
 '(org-ref-ref-face ((t (:inherit link :foreground "#4db5bd"))))
 '(org-scheduled ((t (:foreground "#c0c5ce"))))
 '(org-scheduled-previously ((t (:foreground "#DFDFDF"))))
 '(org-scheduled-today ((t (:foreground "#9ca0a4"))))
 '(org-sexp-date ((t (:foreground "#c0c5ce"))))
 '(org-special-keyword ((t (:foreground "#8b969e"))))
 '(org-table ((t (:foreground "#b48ead"))))
 '(org-tag ((t (:foreground "#8b969e" :weight normal))))
 '(org-time-grid ((t (:foreground "#65737E"))))
 '(org-upcoming-deadline ((t (:foreground "#a2a7b0"))))
 '(org-upcoming-distant-deadline ((t (:foreground "#757a84"))))
 '(org-warning ((t (:foreground "#ECBE7B"))))

 ;; paren
 '(paren-face ((t (:foreground "#65737E"))))
 '(paren-face-match ((t (:foreground "#BF616A" :background "#1B2229" :weight ultra-bold))))
 '(paren-face-mismatch ((t (:foreground "#1B2229" :background "#BF616A" :weight ultra-bold))))
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
 '(shadow ((t (:foreground "#65737E"))))

 ;; smerge
 '(smerge-base ((t (:background "#3f4653"))))
 '(smerge-lower ((t (:background "#434c4b"))))
 '(smerge-markers ((t (:background "#65737E" :foreground "#2b303b" :distant-foreground "#c0c5ce" :weight bold))))
 '(smerge-mine ((t (:background "#4b3b41"))))
 '(smerge-other ((t (:background "#434c4b"))))
 '(smerge-refined-added ((t (:inherit diff-added :inverse-video t))))
 '(smerge-refined-removed ((t (:inherit diff-removed :inverse-video t))))
 '(smerge-upper ((t (:background "#4b3b41"))))

 ;; symbol
 '(symbol-overlay-default-face ((t (:background "#606b75" :distant-foreground "#c0c5ce"))))
 '(symbol-overlay-face-1 ((t (:background "#535d6a" :distant-foreground "#c0c5ce"))))
 '(symbol-overlay-face-2 ((t (:background "#615568" :distant-foreground "#c0c5ce"))))
 '(symbol-overlay-face-3 ((t (:background "#645a4e" :distant-foreground "#c0c5ce"))))
 '(symbol-overlay-face-4 ((t (:background "#5c4a4a" :distant-foreground "#c0c5ce"))))
 '(symbol-overlay-face-5 ((t (:background "#573e49" :distant-foreground "#c0c5ce"))))
 '(symbol-overlay-face-6 ((t (:background "#59456b" :distant-foreground "#c0c5ce"))))
 '(symbol-overlay-face-7 ((t (:background "#5b685b" :distant-foreground "#c0c5ce"))))
 '(symbol-overlay-face-8 ((t (:background "#305162" :distant-foreground "#c0c5ce"))))

 ;; tab
 '(tab-bar ((t (:background "#232830" :foreground "#232830"))))
 '(tab-bar-tab ((t (:background "#2b303b" :foreground "#c0c5ce"))))
 '(tab-bar-tab-inactive ((t (:background "#232830" :foreground "#c0c5ce"))))
 '(tab-line ((t (:background "#232830" :foreground "#232830"))))
 '(tab-line-close-highlight ((t (:foreground "#D08770"))))
 '(tab-line-highlight ((t (:inherit tab-line-tab))))
 '(tab-line-tab ((t (:background "#2b303b" :foreground "#c0c5ce"))))
 '(tab-line-tab-current ((t (:background "#2b303b" :foreground "#c0c5ce"))))
 '(tab-line-tab-inactive ((t (:background "#232830" :foreground "#c0c5ce"))))
 '(tab-line-tab-inactive-alternate ((t (:background "#232830" :foreground "#c0c5ce"))))

 ;; term
 '(term ((t (:foreground "#c0c5ce"))))
 '(term-bold ((t (:weight bold))))

 ;; trailing
 '(trailing-whitespace ((t (:background "#BF616A"))))

 ;; treemacs
 '(treemacs-nerd-icons-file-face ((t (:foreground "#8b969e"))))
 '(treemacs-nerd-icons-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))

 ;; typescript
 '(typescript-jsdoc-tag ((t (:foreground "#8b969e"))))
 '(typescript-jsdoc-type ((t (:foreground "#767f86"))))
 '(typescript-jsdoc-value ((t (:foreground "#9ca5ac"))))

 ;; vertico
 '(vertico-posframe-border ((t (:background "#4f5b66"))))
 '(vertico-posframe-border-2 ((t (:background "#BF616A"))))
 '(vertico-posframe-border-3 ((t (:background "#A3BE8C"))))
 '(vertico-posframe-border-4 ((t (:background "#8FA1B3"))))
 '(vertico-posframe-border-fallback ((t (:background "#ECBE7B"))))

 ;; vterm
 '(vterm-color-black ((t (:background "#54595e" :foreground "#1B2229"))))
 '(vterm-color-blue ((t (:background "#abb8c5" :foreground "#8FA1B3"))))
 '(vterm-color-cyan ((t (:background "#74e2ff" :foreground "#46D9FF"))))
 '(vterm-color-green ((t (:background "#bacea8" :foreground "#A3BE8C"))))
 '(vterm-color-magenta ((t (:background "#d499e5" :foreground "#c678dd"))))
 '(vterm-color-red ((t (:background "#cf888f" :foreground "#BF616A"))))
 '(vterm-color-white ((t (:background "#e7e7e7" :foreground "#DFDFDF"))))
 '(vterm-color-yellow ((t (:background "#f0ce9c" :foreground "#ECBE7B"))))

 ;; web
 '(web-mode-block-control-face ((t (:foreground "#D08770"))))
 '(web-mode-block-delimiter-face ((t (:foreground "#D08770"))))
 '(web-mode-doctype-face ((t (:foreground "#65737E"))))
 '(web-mode-html-entity-face ((t (:foreground "#46D9FF" :inherit italic))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#c0c5ce"))))
 '(web-mode-json-context-face ((t (:foreground "#A3BE8C"))))
 '(web-mode-json-key-face ((t (:foreground "#A3BE8C"))))
 '(web-mode-keyword-face ((t (:foreground "#b48ead"))))
 '(web-mode-string-face ((t (:foreground "#A3BE8C"))))
 '(web-mode-type-face ((t (:foreground "#ECBE7B"))))

 ;; which
 '(which-func ((t (:foreground "#8FA1B3"))))
 '(which-key-group-description-face ((t (:foreground "#b48ead"))))
 '(which-key-local-map-description-face ((t (:foreground "#c678dd"))))

 ;; whitespace
 '(whitespace-empty ((t (:background "#2F3237"))))
 '(whitespace-indentation ((t (:foreground "#4f5b66" :background "#2F3237"))))
 '(whitespace-line ((t (:background "#1B2229" :foreground "#BF616A" :weight bold))))
 '(whitespace-newline ((t (:foreground "#4f5b66"))))
 '(whitespace-space ((t (:foreground "#4f5b66"))))
 '(whitespace-tab ((t (:foreground "#4f5b66"))))
 '(whitespace-trailing ((t (:inherit trailing-whitespace))))

 ;; widget
 '(widget-button-pressed ((t (:foreground "#BF616A"))))
 '(widget-documentation ((t (:foreground "#A3BE8C"))))
 '(widget-field ((t (:background "#2F3237" :distant-foreground "#2b303b" :box (:line-width -1 :color "#4f5b66") :extend t))))
 '(widget-single-line-field ((t (:background "#2F3237" :distant-foreground "#2b303b"))))

 ;; window
 '(window-tool-bar-button ((t (:background "#2b303b" :foreground "#c0c5ce"))))
 '(window-tool-bar-button-disabled ((t (:background "#232830" :foreground "#c0c5ce"))))
 '(window-tool-bar-button-hover ((t (:inherit highlight :distant-foreground "#2b303b"))))

 ;; woman
 '(woman-bold ((t (:inherit Man-overstrike))))
 '(woman-italic ((t (:inherit Man-underline))))

 ;; xref
 '(xref-file-header ((t (:inherit success))))
 '(xref-line-number ((t (:foreground "#D08770"))))
 '(xref-match ((t (:foreground "#A3BE8C" :background "#1B2229" :weight bold))))

 ;; yas
 '(yas-field-highlight-face ((t (:inherit match))))

 ;; local preferences
 '(lsp-face-semhl-property ((t (:foreground unspecified))))
 '(lsp-face-semhl-member ((t (:foreground unspecified))))
 '(lsp-face-semhl-variable ((t (:foreground unspecified))))
 '(lsp-face-semhl-parameter ((t (:foreground unspecified))))
 '(lsp-face-semhl-macro ((t (:foreground "#BF616A"))))
 '(lsp-rust-analyzer-mutable-modifier-face ((t (:underline nil)))))

(provide-theme 'spacegray)

;;; spacegray-theme.el ends here
