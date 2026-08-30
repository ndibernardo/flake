;;; gruvbox-theme.el --- Dark theme with the hard variant of the Gruvbox palette  -*- lexical-binding:t -*-

;;; Commentary:
;; Dark theme with the hard variant of the Gruvbox palette.

;;; Code:

;;;###theme-autoload
(deftheme gruvbox
  "Dark theme with the hard variant of the Gruvbox palette."
  :background-mode 'dark
  :kind 'color-scheme
  :family 'gruvbox)

(custom-theme-set-faces
 'gruvbox

 '(default ((t (:background "#1d2021" :foreground "#ebdbb2"))))
 '(cursor ((t (:background "white"))))
 '(region ((t (:background "#504945" :distant-foreground "#bcaf8e" :extend t))))
 '(highlight ((t (:background "#fabd2f" :foreground "#0d1011" :distant-foreground "#fbf1c7"))))
 '(hl-line ((t (:background "#3c3836"))))
 '(fringe ((t (:inherit default :foreground "#665c54" :background unspecified))))
 '(vertical-border ((t (:background "#504945" :foreground "#504945"))))
 '(minibuffer-prompt ((t (:foreground "#8ec07c"))))
 '(isearch ((t (:foreground "#0d1011" :background "#fe8019"))))
 '(lazy-highlight ((t (:background "#fabd2f" :foreground "#0d1011" :distant-foreground "#0d1011" :bold t))))
 '(link ((t (:foreground "#d3869b" :underline t :weight bold))))
 '(link-visited ((t (:foreground "#d3869b" :underline t))))
 '(button ((t (:foreground "#8ec07c" :underline t :weight bold))))
 '(header-line ((t (:inherit mode-line))))
 '(tooltip ((t (:background "#0d1011" :foreground "#ebdbb2"))))
 '(secondary-selection ((t (:background "#928374" :extend t))))

 '(font-lock-builtin-face ((t (:foreground "#fe8019"))))
 '(font-lock-comment-face ((t (:foreground "#928374"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-constant-face ((t (:foreground "#d3869b"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground "#dfd2b8"))))
 '(font-lock-function-name-face ((t (:foreground "#b8bb26"))))
 '(font-lock-keyword-face ((t (:foreground "#fb4934"))))
 '(font-lock-negation-char-face ((t (:inherit bold :foreground "#ebdbb2"))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#fb4934"))))
 '(font-lock-string-face ((t (:foreground "#b8bb26"))))
 '(font-lock-type-face ((t (:foreground "#fabd2f"))))
 '(font-lock-variable-name-face ((t (:foreground unspecified))))
 '(font-lock-warning-face ((t (:inherit warning))))

 '(font-lock-operator-face ((t (:foreground "#ebdbb2"))))
 '(font-lock-punctuation-face ((t (:foreground "#ebdbb2"))))
 '(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit bold :foreground "#ebdbb2"))))
 '(font-lock-regexp-grouping-construct ((t (:inherit bold :foreground "#ebdbb2"))))

 '(mode-line ((t (:background "#37302f" :foreground "#dfd2b8" :box nil))))
 '(mode-line-inactive ((t (:background "#1d2021" :foreground "#665c54" :box nil))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:foreground "#fabd2f" :distant-foreground "#1d2021"))))
 '(mode-line-highlight ((t (:inherit highlight :distant-foreground "#1d2021"))))

 '(line-number ((t (:inherit default :foreground "#7c6f64" :weight normal :slant normal :background unspecified))))
 '(line-number-current-line ((t (:inherit (hl-line default) :foreground "#fabd2f" :weight normal :slant normal :background "#3c3836"))))

 '(show-paren-match ((t (:background "#7c6f64" :bold t))))
 '(show-paren-mismatch ((t (:background "red"))))

 '(match ((t (:foreground "#b8bb26" :background "#0d1011" :weight bold))))
 '(query-replace ((t (:inherit isearch))))

 '(diff-added ((t (:inherit hl-line :foreground "#b8bb26"))))
 '(diff-removed ((t (:foreground "#fb4934" :background "#3c3836"))))
 '(diff-changed ((t (:foreground "#d3869b"))))
 '(diff-header ((t (:foreground "#8ec07c"))))
 '(diff-file-header ((t (:foreground "#83a598"))))

 '(compilation-error ((t (:inherit error :weight bold))))
 '(compilation-warning ((t (:inherit warning :slant normal))))
 '(compilation-info ((t (:inherit success))))
 '(compilation-line-number ((t (:foreground "#fabd2f"))))

 '(org-todo ((t (:foreground "#b8bb26" :bold inherit))))
 '(org-done ((t (:inherit org-headline-done :weight bold))))
 '(org-headline-done ((t (:foreground "#7c6f64"))))
 '(org-date ((t (:foreground "#b8bb26"))))
 '(org-link ((t (:inherit link :foreground "#fabd2f"))))
 '(org-block ((t (:background "#3c3836" :extend t))))
 '(org-block-begin-line ((t (:inherit org-block :foreground "#928374"))))
 '(org-block-end-line ((t (:inherit org-block-begin-line))))
 '(org-code ((t (:inherit org-block :foreground "#fe8019"))))
 '(org-verbatim ((t (:foreground "#fabd2f"))))

 '(outline-1 ((t (:foreground "#d3869b" :weight bold :extend t))))
 '(outline-2 ((t (:foreground "#8ec07c" :weight bold :extend t))))
 '(outline-3 ((t (:foreground "#b8bb26" :weight bold :extend t))))
 '(outline-4 ((t (:foreground "#db9eaf" :weight bold :extend t))))
 '(outline-5 ((t (:foreground "#8db58f" :weight bold :extend t))))
 '(outline-6 ((t (:foreground "#e4b6c3" :weight bold :extend t))))
 '(outline-7 ((t (:foreground "#b3ceb4" :weight bold :extend t))))
 '(outline-8 ((t (:foreground "#edced7" :weight bold :extend t))))

 '(dired-directory ((t (:foreground "#8ec07c"))))
 '(dired-symlink ((t (:foreground "#8ec07c"))))
 '(dired-header ((t (:foreground "#8ec07c"))))

 '(eshell-prompt ((t (:foreground "#fabd2f" :weight bold))))
 '(eshell-ls-directory ((t (:foreground "#83a598"))))
 '(eshell-ls-executable ((t (:foreground "#b8bb26"))))
 '(eshell-ls-symlink ((t (:foreground "#8ec07c"))))

 '(company-tooltip ((t (:inherit tooltip))))
 '(company-tooltip-selection ((t (:background "#504945"))))
 '(company-tooltip-common ((t (:foreground "#8ec07c"))))
 '(company-scrollbar-fg ((t (:background "#8ec07c"))))
 '(company-scrollbar-bg ((t (:background "#3c3836"))))

 '(corfu-default ((t (:inherit tooltip))))
 '(corfu-current ((t (:background "#1d2021" :foreground "#ebdbb2"))))
 '(corfu-bar ((t (:background "#7c6f64"))))
 '(corfu-border ((t (:background "#665c54"))))
 '(corfu-annotations ((t (:foreground "#928374"))))
 '(corfu-deprecated ((t (:foreground "#7c6f64" :strike-through t))))
 '(corfu-echo ((t (:foreground "#928374"))))
 '(corfu-popupinfo ((t (:background "#0d1011" :foreground "#ebdbb2"))))

 '(flycheck-error ((t (:underline (:style wave :color "#fb4934") :background "#3c3836"))))
 '(flycheck-warning ((t (:underline (:style wave :color "#fabd2f") :background "#3c3836"))))
 '(flycheck-info ((t (:underline (:style wave :color "#83a598") :background "#3c3836"))))

 '(git-gutter:added ((t (:inherit fringe :foreground "#9c9e20"))))
 '(git-gutter:deleted ((t (:inherit fringe :foreground "#d53e2c"))))
 '(git-gutter:modified ((t (:inherit fringe :foreground "#78a369"))))

 '(magit-branch-current ((t (:underline "#b8bb26" :inherit magit-branch-local))))
 '(magit-branch-local ((t (:foreground "#8ec07c"))))
 '(magit-branch-remote ((t (:foreground "#b8bb26"))))
 '(magit-branch-upstream ((t (:foreground "#b8bb26"))))
 '(magit-tag ((t (:foreground "#fabd2f"))))
 '(magit-hash ((t (:foreground "#928374"))))
 '(magit-section-heading ((t (:foreground "#8ec07c" :weight bold))))
 '(magit-section-highlight ((t (:inherit hl-line))))
 '(magit-section-heading-selection ((t (:foreground "#fe8019" :weight bold :extend t))))
 '(magit-diff-file-heading ((t (:foreground "#ebdbb2" :weight bold :extend t))))
 '(magit-diff-file-heading-highlight ((t (:background "#3c3836" :foreground "#ebdbb2"))))
 '(magit-diff-hunk-heading ((t (:background "#3c3836" :foreground "#d5c4a1"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "#504945" :foreground "#ebdbb2"))))
 '(magit-diff-context ((t (:foreground "#3c3836" :foreground "#d5c4a1"))))
 '(magit-diff-context-highlight ((t (:foreground "#ebdbb2" :background "#0d1011" :extend t))))
 '(magit-diff-added ((t (:foreground "#7c7e19" :background "#292c20" :extend t))))
 '(magit-diff-added-highlight ((t (:foreground "#9c9e20" :background "#363920" :weight bold :extend t))))
 '(magit-diff-removed ((t (:foreground "#aa3123" :background "#4b3834" :extend t))))
 '(magit-diff-removed-highlight ((t (:foreground "#d53e2c" :background "#5a3934" :weight bold :extend t))))
 '(magit-diffstat-added ((t (:foreground "#9c9e20"))))
 '(magit-diffstat-removed ((t (:foreground "#d53e2c"))))
 '(magit-log-author ((t (:foreground "#fe8019"))))
 '(magit-log-date ((t (:foreground "#83a598"))))
 '(magit-log-graph ((t (:foreground "#928374"))))
 '(magit-process-ok ((t (:inherit success))))
 '(magit-process-ng ((t (:inherit error))))

 '(vertico-current ((t (:background "#504945" :extend t))))
 '(vertico-group-title ((t (:foreground "#928374" :weight bold))))
 '(vertico-group-separator ((t (:foreground "#665c54" :strike-through t))))
 '(vertico-multiline ((t (:foreground "#928374"))))
 '(vertico-quick1 ((t (:background "#0d1011" :foreground "#83a598" :weight bold))))
 '(vertico-quick2 ((t (:background "#0d1011" :foreground "#b8bb26" :weight bold))))

 '(orderless-match-face-0 ((t (:weight bold :foreground "#acbaa2" :background "#272d2c"))))
 '(orderless-match-face-1 ((t (:weight bold :foreground "#c89297" :background "#2b262b"))))
 '(orderless-match-face-2 ((t (:weight bold :foreground "#ccc75e" :background "#2c2f21"))))
 '(orderless-match-face-3 ((t (:weight bold :foreground "#f3c963" :background "#332f22"))))

 '(marginalia-documentation ((t (:inherit font-lock-doc-face))))
 '(marginalia-key ((t (:foreground "#b8bb26"))))
 '(marginalia-type ((t (:foreground "#d3869b"))))
 '(marginalia-char ((t (:foreground "#83a598"))))
 '(marginalia-lighter ((t (:foreground "#d3869b"))))
 '(marginalia-on ((t (:foreground "#b8bb26"))))
 '(marginalia-off ((t (:foreground "#fb4934"))))

 '(consult-file ((t (:foreground "#ebdbb2"))))
 '(consult-bookmark ((t (:foreground "#83a598"))))
 '(consult-async-running ((t (:foreground "#83a598"))))
 '(consult-async-finished ((t (:foreground "#b8bb26"))))
 '(consult-async-failed ((t (:foreground "#fb4934"))))
 '(consult-preview-line ((t (:background "#3c3836"))))
 '(consult-preview-match ((t (:background "#504945"))))

 '(ivy-current-match ((t (:background "#504945"))))
 '(ivy-minibuffer-match-face-1 ((t (:foreground "#fabd2f"))))
 '(helm-selection ((t (:inherit bold :background "#504945" :extend t :distant-foreground "#fabd2f"))))
 '(helm-match ((t (:inherit bold :foreground "#fabd2f" :distant-foreground "#fbf1c7"))))

 '(term-color-black ((t (:background "#0d1011" :foreground "#0d1011"))))
 '(term-color-red ((t (:background "#fb4934" :foreground "#fb4934"))))
 '(term-color-green ((t (:background "#b8bb26" :foreground "#b8bb26"))))
 '(term-color-yellow ((t (:background "#fabd2f" :foreground "#fabd2f"))))
 '(term-color-blue ((t (:background "#83a598" :foreground "#83a598"))))
 '(term-color-magenta ((t (:background "#b16286" :foreground "#b16286"))))
 '(term-color-cyan ((t (:background "#8ec07c" :foreground "#8ec07c"))))
 '(term-color-white ((t (:background "#fbf1c7" :foreground "#fbf1c7"))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#fe8019"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#b16286"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#b8bb26"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#83a598"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#8ec07c"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#83a598"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#b16286"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#b8bb26"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#d3869b"))))

 '(lsp-face-highlight-textual ((t (:weight bold :background "#3c3836" :foreground "#0d1011" :distant-foreground "#fbf1c7"))))
 '(lsp-face-highlight-read ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-face-highlight-write ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-ui-doc-background ((t (:inherit tooltip))))
 '(lsp-ui-peek-selection ((t (:foreground "#1d2021" :background "#83a598" :bold t))))
 '(lsp-ui-sideline-code-action ((t (:foreground "#d8a52c"))))

 '(which-key-key-face ((t (:foreground "#b8bb26"))))
 '(which-key-command-description-face ((t (:foreground "#83a598"))))

 '(web-mode-html-tag-face ((t (:foreground "#8ec07c"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#8ec07c"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#b8bb26"))))
 '(web-mode-css-property-name-face ((t (:foreground "#fabd2f"))))

 '(js2-function-param ((t (:foreground "#83a598"))))
 '(js2-function-call ((t (:foreground "#b8bb26"))))
 '(js2-object-property ((t (:foreground "#d3869b"))))
 '(js2-jsdoc-tag ((t (:foreground "#dfd2b8"))))
 '(js2-external-variable ((t (:foreground "#ebdbb2"))))

 '(markdown-bold-face ((t (:inherit bold :foreground "#fe8019"))))
 '(markdown-italic-face ((t (:inherit italic :foreground "#d3869b"))))
 '(markdown-link-face ((t (:inherit underline :foreground "#928374"))))
 '(markdown-url-face ((t (:foreground "#d3869b"))))
 '(markdown-code-face ((t (:background "#313131" :extend t))))
 '(markdown-blockquote-face ((t (:inherit italic :foreground "#928374"))))

 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))
 '(treemacs-directory-face ((t (:foreground "#ebdbb2"))))
 '(treemacs-file-face ((t (:foreground "#ebdbb2"))))
 '(treemacs-tags-face ((t (:foreground "#fabd2f"))))
 '(treemacs-fringe-indicator-face ((t (:foreground "#fabd2f"))))
 '(treemacs-git-added-face ((t (:foreground "#9c9e20"))))
 '(treemacs-git-modified-face ((t (:foreground "#fabd2f"))))
 '(treemacs-git-conflict-face ((t (:foreground "#fb4934"))))
 '(treemacs-git-untracked-face ((t (:foreground "#9c9e20"))))
 '(treemacs-git-renamed-face ((t (:foreground "#fabd2f"))))
 '(treemacs-git-ignored-face ((t (:foreground "#928374"))))
 '(treemacs-on-success-pulse-face ((t (:foreground "#0d1011" :background "#b8bb26" :extend t))))
 '(treemacs-on-failure-pulse-face ((t (:foreground "#0d1011" :background "#fb4934" :extend t))))

 '(window-divider ((t (:inherit vertical-border))))
 '(window-divider-first-pixel ((t (:inherit window-divider))))
 '(window-divider-last-pixel ((t (:inherit window-divider))))

 '(error ((t (:foreground "#fb4934"))))
 '(warning ((t (:foreground "#fabd2f"))))
 '(success ((t (:foreground "#b8bb26"))))

 ;; Man
 '(Man-overstrike ((t (:inherit bold :foreground "#ebdbb2"))))
 '(Man-underline ((t (:inherit underline :foreground "#fb4934"))))

 ;; ansi
 '(ansi-color-black ((t (:foreground "#1d2021" :background "#1d2021"))))
 '(ansi-color-blue ((t (:foreground "#83a598" :background "#83a598"))))
 '(ansi-color-bright-black ((t (:foreground "#665c54" :background "#665c54"))))
 '(ansi-color-bright-blue ((t (:foreground "#95b2a7" :background "#95b2a7"))))
 '(ansi-color-bright-cyan ((t (:foreground "#9ec98f" :background "#9ec98f"))))
 '(ansi-color-bright-green ((t (:foreground "#c2c546" :background "#c2c546"))))
 '(ansi-color-bright-magenta ((t (:foreground "#bc7998" :background "#bc7998"))))
 '(ansi-color-bright-red ((t (:foreground "#fb6452" :background "#fb6452"))))
 '(ansi-color-bright-white ((t (:foreground "#fbf1c7" :background "#fbf1c7"))))
 '(ansi-color-bright-yellow ((t (:foreground "#fac64e" :background "#fac64e"))))
 '(ansi-color-cyan ((t (:foreground "#8ec07c" :background "#8ec07c"))))
 '(ansi-color-green ((t (:foreground "#b8bb26" :background "#b8bb26"))))
 '(ansi-color-magenta ((t (:foreground "#b16286" :background "#b16286"))))
 '(ansi-color-red ((t (:foreground "#fb4934" :background "#fb4934"))))
 '(ansi-color-white ((t (:foreground "#ebdbb2" :background "#ebdbb2"))))
 '(ansi-color-yellow ((t (:foreground "#fabd2f" :background "#fabd2f"))))

 ;; avy
 '(avy-background-face ((t (:foreground "#928374"))))
 '(avy-lead-face ((t (:background "#fabd2f" :foreground "#1d2021" :distant-foreground "#ebdbb2" :weight bold))))
 '(avy-lead-face-0 ((t (:inherit avy-lead-face :background "#fbd06d"))))
 '(avy-lead-face-1 ((t (:inherit avy-lead-face :background "#fde4ab"))))
 '(avy-lead-face-2 ((t (:inherit avy-lead-face :background "#fef8ea"))))

 ;; bold
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:inherit (bold italic)))))

 ;; bookmark
 '(bookmark-face ((t (:background "#332f22" :extend t))))

 ;; cider
 '(cider-debug-code-overlay-face ((t (:background "#3c3836"))))
 '(cider-deprecated-face ((t (:background "#493f23"))))
 '(cider-enlightened-face ((t (:inherit cider-result-overlay-face :box (:color "#fe8019" :line-width -1)))))
 '(cider-enlightened-local-face ((t (:foreground "#fe8019" :weight bold))))
 '(cider-error-highlight-face ((t (:underline (:style wave :color "#fb4934")))))
 '(cider-fringe-good-face ((t (:foreground "#b8bb26"))))
 '(cider-instrumented-face ((t (:background "#492824"))))
 '(cider-result-overlay-face ((t (:background "#3c3836" :box (:line-width -1 :color "#7c6f64")))))
 '(cider-test-error-face ((t (:background "#fe8019"))))
 '(cider-test-failure-face ((t (:background "#5f2c26"))))
 '(cider-test-success-face ((t (:foreground "#0d1011" :background "#b8bb26"))))
 '(cider-traced-face ((t (:background "#334033"))))
 '(cider-warning-highlight-face ((t (:underline (:style wave :color "#fabd2f")))))

 ;; compilation
 '(compilation-column-number ((t (:inherit font-lock-comment-face))))
 '(compilation-mode-line-exit ((t (:inherit compilation-info))))
 '(compilation-mode-line-fail ((t (:inherit compilation-error))))

 ;; custom
 '(custom-button ((t (:foreground "#83a598" :background "#1d2021" :box (:line-width 1 :style nil)))))
 '(custom-button-mouse ((t (:foreground "#1d2021" :background "#83a598" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed ((t (:foreground "#1d2021" :background "#83a598" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed-unraised ((t (:foreground "#1d2021" :background "#d3869b" :box (:line-width 1 :style nil)))))
 '(custom-button-unraised ((t (:foreground "#d3869b" :background "#1d2021" :box (:line-width 1 :style nil)))))
 '(custom-changed ((t (:foreground "#83a598" :background "#1d2021"))))
 '(custom-comment ((t (:foreground "#ebdbb2" :background "#504945"))))
 '(custom-comment-tag ((t (:foreground "#928374"))))
 '(custom-group-subtitle ((t (:foreground "#fb4934"))))
 '(custom-group-tag ((t (:foreground "#d3869b"))))
 '(custom-group-tag-1 ((t (:foreground "#83a598"))))
 '(custom-invalid ((t (:foreground "#fb4934" :background "#492824"))))
 '(custom-modified ((t (:foreground "#83a598" :background "#313a38"))))
 '(custom-saved ((t (:foreground "#b8bb26" :background "#3c3f22" :bold t))))
 '(custom-set ((t (:foreground "#fabd2f" :background "#1d2021"))))
 '(custom-state ((t (:foreground "#b8bb26" :background "#3c3f22"))))
 '(custom-themed ((t (:foreground "#fabd2f" :background "#1d2021"))))
 '(custom-variable-button ((t (:foreground "#b8bb26" :underline t))))
 '(custom-variable-obsolete ((t (:foreground "#928374" :background "#1d2021"))))
 '(custom-variable-tag ((t (:foreground "#b16286"))))
 '(custom-visibility ((t (:foreground "#83a598"))))

 ;; diff
 '(diff-context ((t (:foreground "#cec09c"))))
 '(diff-hl-change ((t (:foreground "#78a369" :background "#78a369"))))
 '(diff-hl-delete ((t (:foreground "#d53e2c" :background "#d53e2c"))))
 '(diff-hl-insert ((t (:foreground "#9c9e20" :background "#9c9e20"))))
 '(diff-hunk-header ((t (:foreground "#d3869b"))))
 '(diff-indicator-added ((t (:foreground "#9c9e20"))))
 '(diff-indicator-changed ((t (:foreground "#78a369"))))
 '(diff-indicator-removed ((t (:foreground "#d53e2c"))))
 '(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
 '(diff-refine-changed ((t (:inherit diff-changed :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-removed :inverse-video t))))

 ;; dired
 '(dired-flagged ((t (:foreground "#fb4934"))))
 '(dired-ignored ((t (:foreground "#928374"))))
 '(dired-k-added ((t (:foreground "#9c9e20" :weight bold))))
 '(dired-k-commited ((t (:foreground "#b8bb26" :weight bold))))
 '(dired-k-directory ((t (:foreground "#83a598" :weight bold))))
 '(dired-k-ignored ((t (:foreground "#7c6f64" :weight bold))))
 '(dired-k-modified ((t (:foreground "#78a369" :weight bold))))
 '(dired-k-untracked ((t (:foreground "#8ec07c" :weight bold))))
 '(dired-mark ((t (:foreground "#fe8019" :weight bold))))
 '(dired-marked ((t (:foreground "#fabd2f"))))
 '(dired-perm-write ((t (:foreground "#ebdbb2" :underline t))))
 '(dired-subtree-depth-1-face ((t (:background "#0c0f10"))))
 '(dired-subtree-depth-2-face ((t (:background "#0c0f10"))))
 '(dired-subtree-depth-3-face ((t (:background "#0c0f0f"))))
 '(dired-subtree-depth-4-face ((t (:background "#0b0e0f"))))
 '(dired-subtree-depth-5-face ((t (:background "#0b0e0f"))))
 '(dired-subtree-depth-6-face ((t (:background "#0b0e0e"))))
 '(dired-warning ((t (:foreground "#fabd2f"))))

 ;; ediff
 '(ediff-current-diff-A ((t (:background "#492824"))))
 '(ediff-current-diff-B ((t (:foreground "#9c9e20" :background "#363920" :extend t))))
 '(ediff-current-diff-C ((t (:inherit ediff-current-diff-A))))
 '(ediff-even-diff-A ((t (:inherit hl-line))))
 '(ediff-even-diff-B ((t (:inherit ediff-even-diff-A))))
 '(ediff-even-diff-C ((t (:inherit ediff-even-diff-A))))
 '(ediff-fine-diff-A ((t (:background "#753028" :weight bold))))
 '(ediff-fine-diff-B ((t (:inherit diff-refine-added))))
 '(ediff-fine-diff-C ((t (:inherit ediff-fine-diff-A))))
 '(ediff-odd-diff-A ((t (:inherit ediff-even-diff-A))))
 '(ediff-odd-diff-B ((t (:inherit ediff-odd-diff-A))))
 '(ediff-odd-diff-C ((t (:inherit ediff-odd-diff-A))))

 ;; elfeed
 '(elfeed-log-debug-level-face ((t (:foreground "#928374"))))
 '(elfeed-log-error-level-face ((t (:inherit error))))
 '(elfeed-log-info-level-face ((t (:inherit success))))
 '(elfeed-log-warn-level-face ((t (:inherit warning))))
 '(elfeed-search-date-face ((t (:foreground "#d3869b"))))
 '(elfeed-search-feed-face ((t (:foreground "#83a598"))))
 '(elfeed-search-filter-face ((t (:foreground "#d3869b"))))
 '(elfeed-search-tag-face ((t (:foreground "#928374"))))
 '(elfeed-search-title-face ((t (:foreground "#928374"))))
 '(elfeed-search-unread-count-face ((t (:foreground "#fabd2f"))))
 '(elfeed-search-unread-title-face ((t (:foreground "#ebdbb2" :weight bold))))

 ;; elixir
 '(elixir-atom-face ((t (:foreground "#458588"))))
 '(elixir-attribute-face ((t (:foreground "#d3869b"))))

 ;; escape
 '(escape-glyph ((t (:foreground "#8ec07c"))))

 ;; eshell
 '(eshell-ls-archive ((t (:foreground "#b16286"))))
 '(eshell-ls-backup ((t (:foreground "#fabd2f"))))
 '(eshell-ls-clutter ((t (:foreground "#fb4934"))))
 '(eshell-ls-missing ((t (:foreground "#fb4934"))))
 '(eshell-ls-product ((t (:foreground "#fe8019"))))
 '(eshell-ls-readonly ((t (:foreground "#fe8019"))))
 '(eshell-ls-special ((t (:foreground "#d3869b"))))
 '(eshell-ls-unreadable ((t (:foreground "#7c6f64"))))

 ;; flycheck
 '(flycheck-fringe-error ((t (:inherit fringe :foreground "#fb4934"))))
 '(flycheck-fringe-info ((t (:inherit fringe :foreground "#b8bb26"))))
 '(flycheck-fringe-warning ((t (:inherit fringe :foreground "#fabd2f"))))
 '(flycheck-posframe-background-face ((t (:background "#0d1011"))))
 '(flycheck-posframe-error-face ((t (:inherit flycheck-posframe-face :foreground "#fb4934"))))
 '(flycheck-posframe-face ((t (:inherit default))))
 '(flycheck-posframe-info-face ((t (:inherit flycheck-posframe-face :foreground "#b8bb26"))))
 '(flycheck-posframe-warning-face ((t (:inherit flycheck-posframe-face :foreground "#fabd2f"))))

 ;; flymake
 '(flymake-error ((t (:underline (:style wave :color "#fb4934")))))
 '(flymake-note ((t (:underline (:style wave :color "#b8bb26")))))
 '(flymake-warning ((t (:underline (:style wave :color "#fe8019")))))

 ;; font
 '(font-latex-bold-face ((t (:inherit bold))))
 '(font-latex-italic-face ((t (:inherit italic))))
 '(font-latex-math-face ((t (:foreground "#689d6a"))))
 '(font-latex-script-char-face ((t (:foreground "#458588"))))
 '(font-latex-sectioning-0-face ((t (:foreground "#83a598" :weight ultra-bold))))
 '(font-latex-sectioning-1-face ((t (:foreground "#b16286" :weight semi-bold))))
 '(font-latex-sectioning-2-face ((t (:foreground "#d3869b" :weight semi-bold))))
 '(font-latex-sectioning-3-face ((t (:foreground "#a8c0b6" :weight semi-bold))))
 '(font-latex-sectioning-4-face ((t (:foreground "#c891aa" :weight semi-bold))))
 '(font-latex-sectioning-5-face ((t (:foreground "#e0aab9" :weight semi-bold))))
 '(font-latex-sedate-face ((t (:inherit font-lock-keyword-face))))
 '(font-latex-string-face ((t (:inherit font-lock-string-face))))
 '(font-latex-underline-face ((t (:inherit underline))))
 '(font-latex-verbatim-face ((t (:inherit fixed-pitch :foreground "#d3869b" :slant normal))))
 '(font-latex-warning-face ((t (:inherit font-lock-warning-face))))
 '(font-lock-escape-face ((t (:inherit font-lock-regexp-grouping-backslash))))
 '(font-lock-function-call-face ((t (:inherit font-lock-function-name-face :slant normal :foreground "#c7c450"))))
 '(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-number-face ((t (:foreground "#d3869b"))))
 '(font-lock-preprocessor-char-face ((t (:inherit bold :foreground "#ebdbb2"))))
 '(font-lock-property-name-face ((t (:foreground "#f48366" :weight bold))))
 '(font-lock-property-use-face ((t (:inherit font-lock-property-name-face :weight regular))))
 '(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face :foreground unspecified))))

 ;; git
 '(git-commit-comment-branch-local ((t (:foreground "#b16286"))))
 '(git-commit-comment-branch-remote ((t (:foreground "#b8bb26"))))
 '(git-commit-comment-detached ((t (:foreground "#fe8019"))))
 '(git-commit-comment-file ((t (:foreground "#d3869b"))))
 '(git-commit-comment-heading ((t (:foreground "#fb4934"))))
 '(git-commit-keyword ((t (:foreground "#8ec07c" :slant normal))))
 '(git-commit-known-pseudo-header ((t (:foreground "#dfd2b8" :weight bold :slant normal))))
 '(git-commit-nonempty-second-line ((t (:inherit git-commit-overlong-summary))))
 '(git-commit-overlong-summary ((t (:inherit error :background "#0d1011" :slant normal :weight bold))))
 '(git-commit-pseudo-header ((t (:foreground "#dfd2b8" :slant normal))))
 '(git-commit-summary ((t (:foreground "#b8bb26"))))
 '(git-gutter+-added ((t (:inherit fringe :foreground "#9c9e20"))))
 '(git-gutter+-deleted ((t (:inherit fringe :foreground "#d53e2c"))))
 '(git-gutter+-modified ((t (:inherit fringe :foreground "#78a369"))))
 '(git-gutter-fr:added ((t (:inherit fringe :foreground "#9c9e20"))))
 '(git-gutter-fr:deleted ((t (:inherit fringe :foreground "#d53e2c"))))
 '(git-gutter-fr:modified ((t (:inherit fringe :foreground "#78a369"))))

 ;; header
 '(header-line-highlight ((t (:inherit mode-line-highlight))))

 ;; hi
 '(hi-blue ((t (:background "#83a598"))))
 '(hi-blue-b ((t (:foreground "#83a598" :weight bold))))
 '(hi-green ((t (:background "#b8bb26"))))
 '(hi-green-b ((t (:foreground "#b8bb26" :weight bold))))
 '(hi-pink ((t (:background "#b16286"))))
 '(hi-red-b ((t (:foreground "#fb4934" :weight bold))))
 '(hi-yellow ((t (:background "#fabd2f"))))

 ;; highlight
 '(highlight-indentation-current-column-face ((t (:background "#1d2021"))))
 '(highlight-indentation-face ((t (:inherit hl-line))))
 '(highlight-indentation-guides-even-face ((t (:inherit highlight-indentation-face))))
 '(highlight-indentation-guides-odd-face ((t (:inherit highlight-indentation-face))))
 '(highlight-numbers-number ((t (:inherit bold :foreground "#d3869b"))))
 '(highlight-quoted-quote ((t (:foreground "#ebdbb2"))))
 '(highlight-quoted-symbol ((t (:foreground "#689d6a"))))
 '(highlight-symbol-face ((t (:background "#413d3c" :distant-foreground "#d5c4a1"))))
 '(highlight-thing ((t (:background "#413d3c" :distant-foreground "#d5c4a1"))))

 ;; hl
 '(hl-fill-column-face ((t (:inherit (hl-line shadow)))))
 '(hl-todo ((t (:foreground "#fb4934" :weight bold))))

 ;; imenu
 '(imenu-list-entry-face-0 ((t (:foreground "#fabd2f"))))
 '(imenu-list-entry-face-1 ((t (:foreground "#b8bb26"))))
 '(imenu-list-entry-face-2 ((t (:foreground "#fabd2f"))))
 '(imenu-list-entry-subalist-face-0 ((t (:inherit imenu-list-entry-face-0 :weight bold))))
 '(imenu-list-entry-subalist-face-1 ((t (:inherit imenu-list-entry-face-1 :weight bold))))
 '(imenu-list-entry-subalist-face-2 ((t (:inherit imenu-list-entry-face-2 :weight bold))))

 ;; indent
 '(indent-guide-face ((t (:inherit hl-line))))

 ;; isearch
 '(isearch-fail ((t (:background "#fb4934" :foreground "#0d1011" :weight bold))))

 ;; italic
 '(italic ((t (:slant normal))))

 ;; lsp
 '(lsp-headerline-breadcrumb-separator-face ((t (:inherit shadow))))
 '(lsp-ui-peek-filename ((t (:inherit mode-line-buffer-id))))
 '(lsp-ui-peek-header ((t (:foreground "#ebdbb2" :background "#333637" :bold t))))
 '(lsp-ui-peek-highlight ((t (:inherit isearch :box t))))
 '(lsp-ui-peek-line-number ((t (:foreground "#b8bb26"))))
 '(lsp-ui-peek-list ((t (:background "#1a1c1d"))))
 '(lsp-ui-peek-peek ((t (:background "#1a1c1d"))))
 '(lsp-ui-sideline-current-symbol ((t (:inherit highlight))))
 '(lsp-ui-sideline-symbol-info ((t (:foreground "#807467" :background "#0d1011" :extend t))))

 ;; magit
 '(magit-bisect-bad ((t (:foreground "#fb4934"))))
 '(magit-bisect-good ((t (:foreground "#b8bb26"))))
 '(magit-bisect-skip ((t (:foreground "#fe8019"))))
 '(magit-blame-date ((t (:foreground "#fb4934"))))
 '(magit-blame-hash ((t (:foreground "#8ec07c"))))
 '(magit-blame-heading ((t (:foreground "#fe8019" :background "#3c3836" :extend t))))
 '(magit-cherry-equivalent ((t (:foreground "#d3869b"))))
 '(magit-cherry-unmatched ((t (:foreground "#8ec07c"))))
 '(magit-diff-base ((t (:foreground "#cb6614" :background "#332920" :extend t))))
 '(magit-diff-base-highlight ((t (:foreground "#fe8019" :background "#4a331f" :weight bold :extend t))))
 '(magit-diff-file-heading-selection ((t (:foreground "#b16286" :background "#458588" :weight bold :extend t))))
 '(magit-diff-lines-heading ((t (:foreground "#fabd2f" :background "#fb4934" :extend t :extend t))))
 '(magit-dimmed ((t (:foreground "#d5c4a1"))))
 '(magit-filename ((t (:foreground "#d3869b"))))
 '(magit-header-line ((t (:background "#458588" :foreground "#fbf1c7" :weight bold :box (:line-width 3 :color "#458588")))))
 '(magit-reflog-amend ((t (:foreground "#b16286"))))
 '(magit-reflog-checkout ((t (:foreground "#83a598"))))
 '(magit-reflog-cherry-pick ((t (:foreground "#b8bb26"))))
 '(magit-reflog-commit ((t (:foreground "#b8bb26"))))
 '(magit-reflog-merge ((t (:foreground "#b8bb26"))))
 '(magit-reflog-other ((t (:foreground "#8ec07c"))))
 '(magit-reflog-rebase ((t (:foreground "#b16286"))))
 '(magit-reflog-remote ((t (:foreground "#8ec07c"))))
 '(magit-reflog-reset ((t (:inherit error))))
 '(magit-refname ((t (:foreground "#928374"))))
 '(magit-section-secondary-heading ((t (:foreground "#d3869b" :weight bold :extend t))))
 '(magit-sequence-drop ((t (:foreground "#fb4934"))))
 '(magit-sequence-head ((t (:foreground "#83a598"))))
 '(magit-sequence-part ((t (:foreground "#fe8019"))))
 '(magit-sequence-stop ((t (:foreground "#b8bb26"))))
 '(magit-signature-bad ((t (:inherit error))))
 '(magit-signature-error ((t (:inherit error))))
 '(magit-signature-expired ((t (:foreground "#fe8019"))))
 '(magit-signature-good ((t (:inherit success))))
 '(magit-signature-revoked ((t (:foreground "#b16286"))))
 '(magit-signature-untrusted ((t (:foreground "#fabd2f"))))

 ;; makefile
 '(makefile-targets ((t (:foreground "#83a598"))))

 ;; marginalia
 '(marginalia-file-priv-dir ((t (:foreground "#83a598"))))
 '(marginalia-file-priv-exec ((t (:foreground "#b8bb26"))))
 '(marginalia-file-priv-link ((t (:foreground "#d3869b"))))
 '(marginalia-file-priv-other ((t (:foreground "#b16286"))))
 '(marginalia-file-priv-rare ((t (:foreground "#ebdbb2"))))
 '(marginalia-file-priv-read ((t (:foreground "#fabd2f"))))
 '(marginalia-file-priv-write ((t (:foreground "#fb4934"))))
 '(marginalia-number ((t (:foreground "#d3869b"))))
 '(marginalia-size ((t (:foreground "#d3869b"))))

 ;; markdown
 '(markdown-header-delimiter-face ((t (:foreground "#fe8019"))))
 '(markdown-header-face ((t (:inherit bold :foreground "#b8bb26"))))
 '(markdown-html-attr-name-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-attr-value-face ((t (:inherit font-lock-string-face))))
 '(markdown-html-entity-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-tag-delimiter-face ((t (:inherit markdown-markup-face))))
 '(markdown-html-tag-name-face ((t (:inherit font-lock-keyword-face))))
 '(markdown-inline-code-face ((t (:inherit (markdown-code-face markdown-pre-face)))))
 '(markdown-list-face ((t (:foreground "#928374"))))
 '(markdown-markup-face ((t (:foreground "#ebdbb2"))))
 '(markdown-metadata-key-face ((t (:foreground "#fb4934"))))
 '(markdown-pre-face ((t (:foreground "#8ec07c"))))
 '(markdown-reference-face ((t (:foreground "#dfd2b8"))))

 ;; mc/cursor
 '(mc/cursor-face ((t (:inherit cursor))))

 ;; message
 '(message-cited-text ((t (:foreground "#d3869b"))))
 '(message-cited-text-1 ((t (:foreground "#fabd2f"))))
 '(message-cited-text-2 ((t (:foreground "#b16286"))))
 '(message-cited-text-3 ((t (:foreground "#b8bb26"))))
 '(message-cited-text-4 ((t (:foreground "#b8bb26"))))
 '(message-header-cc ((t (:inherit message-header-to :foreground "#d4a027"))))
 '(message-header-name ((t (:foreground "#b8bb26"))))
 '(message-header-newsgroups ((t (:foreground "#fabd2f"))))
 '(message-header-other ((t (:foreground "#d3869b"))))
 '(message-header-subject ((t (:foreground "#fabd2f" :weight bold))))
 '(message-header-to ((t (:foreground "#fabd2f" :weight bold))))
 '(message-header-xheader ((t (:foreground "#dfd2b8"))))
 '(message-mml ((t (:foreground "#928374" :slant normal))))
 '(message-separator ((t (:foreground "#928374"))))

 ;; mode
 '(mode-line-active ((t (:inherit mode-line))))

 ;; nobreak
 '(nobreak-space ((t (:inherit escape-glyph :underline t))))

 ;; org
 '(org-agenda-clocking ((t (:background "#313a38"))))
 '(org-agenda-date ((t (:foreground "#d3869b" :weight ultra-bold))))
 '(org-agenda-date-today ((t (:foreground "#e4b6c3" :weight ultra-bold))))
 '(org-agenda-date-weekend ((t (:foreground "#7e505d" :weight ultra-bold))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "#928374"))))
 '(org-agenda-done ((t (:inherit org-done))))
 '(org-agenda-structure ((t (:foreground "#ebdbb2" :weight ultra-bold))))
 '(org-archived ((t (:foreground "#dfd2b8"))))
 '(org-block-background ((t (:background "#3c3836" :extend t))))
 '(org-checkbox ((t (:inherit org-todo))))
 '(org-checkbox-statistics-done ((t (:inherit org-done))))
 '(org-checkbox-statistics-todo ((t (:inherit org-todo))))
 '(org-cite ((t (:foreground "#97c281"))))
 '(org-cite-key ((t (:foreground "#b3ca91" :underline t))))
 '(org-default ((t (:inherit variable-pitch))))
 '(org-document-info ((t (:foreground "#fb4934"))))
 '(org-document-title ((t (:foreground "#fb4934"))))
 '(org-drawer ((t (:foreground "#bbd9b0"))))
 '(org-ellipsis ((t (:foreground "#fe8019"))))
 '(org-footnote ((t (:foreground "#fe8019"))))
 '(org-formula ((t (:foreground "#b8bb26"))))
 '(org-habit-alert-face ((t (:weight bold :background "#836620"))))
 '(org-habit-alert-future-face ((t (:weight bold :background "#54431a"))))
 '(org-habit-clear-face ((t (:weight bold :background "#665c54"))))
 '(org-habit-clear-future-face ((t (:weight bold :background "#3c3836"))))
 '(org-habit-overdue-face ((t (:weight bold :background "#832c22"))))
 '(org-habit-overdue-future-face ((t (:weight bold :background "#54211b"))))
 '(org-habit-ready-face ((t (:weight bold :background "#485a54"))))
 '(org-habit-ready-future-face ((t (:weight bold :background "#303c39"))))
 '(org-hide ((t (:foreground "#1d2021"))))
 '(org-journal-calendar-entry-face ((t (:foreground "#b16286" :slant normal))))
 '(org-journal-calendar-scheduled-face ((t (:foreground "#fb4934" :slant normal))))
 '(org-journal-highlight ((t (:foreground "#fabd2f"))))
 '(org-latex-and-related ((t (:foreground "#fbf1c7" :weight bold))))
 '(org-list-dt ((t (:foreground "#8ec07c"))))
 '(org-meta-line ((t (:foreground "#928374"))))
 '(org-pomodoro-mode-line ((t (:foreground "#fb4934"))))
 '(org-pomodoro-mode-line-overtime ((t (:foreground "#fabd2f" :weight bold))))
 '(org-priority ((t (:foreground "#fb4934"))))
 '(org-property-value ((t (:foreground "#dfd2b8"))))
 '(org-quote ((t (:inherit italic :slant normal :foreground "#d5c4a1" :background "#282b2c"))))
 '(org-ref-acronym-face ((t (:foreground "#d3869b"))))
 '(org-ref-cite-face ((t (:foreground "#fabd2f" :weight light :underline t))))
 '(org-ref-glossary-face ((t (:foreground "#b16286"))))
 '(org-ref-label-face ((t (:foreground "#83a598"))))
 '(org-ref-ref-face ((t (:inherit link :foreground "#8ec07c"))))
 '(org-scheduled ((t (:foreground "#ebdbb2"))))
 '(org-scheduled-previously ((t (:foreground "#fbf1c7"))))
 '(org-scheduled-today ((t (:foreground "#d5c4a1"))))
 '(org-sexp-date ((t (:foreground "#ebdbb2"))))
 '(org-special-keyword ((t (:foreground "#dfd2b8"))))
 '(org-table ((t (:foreground "#8ec07c"))))
 '(org-tag ((t (:foreground "#7c6f62" :weight normal))))
 '(org-time-grid ((t (:foreground "#928374"))))
 '(org-upcoming-deadline ((t (:foreground "#c1b595"))))
 '(org-upcoming-distant-deadline ((t (:foreground "#837d69"))))
 '(org-warning ((t (:foreground "#fabd2f"))))

 ;; paren
 '(paren-face ((t (:foreground "#928374"))))
 '(paren-face-match ((t (:foreground "#fb4934" :background "#0d1011" :weight ultra-bold))))
 '(paren-face-mismatch ((t (:foreground "#0d1011" :background "#fb4934" :weight ultra-bold))))
 '(paren-face-no-match ((t (:inherit paren-face-mismatch :weight ultra-bold))))

 ;; rainbow
 '(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "#fb4934"))))
 '(rainbow-delimiters-base-face ((t (:inherit default))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#fb4934" :weight bold :inverse-video t))))

 ;; sh
 '(sh-heredoc ((t (:inherit font-lock-string-face :weight normal))))
 '(sh-quoted-exec ((t (:inherit font-lock-preprocessor-face))))

 ;; shadow
 '(shadow ((t (:foreground "#7c6f64"))))

 ;; smerge
 '(smerge-base ((t (:background "#313a38"))))
 '(smerge-lower ((t (:background "#3c3f22"))))
 '(smerge-markers ((t (:background "#928374" :foreground "#1d2021" :distant-foreground "#ebdbb2" :weight bold))))
 '(smerge-mine ((t (:background "#623b35"))))
 '(smerge-other ((t (:background "#3c3f22"))))
 '(smerge-refined-added ((t (:inherit diff-added :inverse-video t))))
 '(smerge-refined-removed ((t (:inherit diff-removed :inverse-video t))))
 '(smerge-upper ((t (:background "#623b35"))))

 ;; symbol
 '(symbol-overlay-default-face ((t (:background "#615b57" :distant-foreground "#d5c4a1"))))
 '(symbol-overlay-face-1 ((t (:background "#455550" :distant-foreground "#d5c4a1"))))
 '(symbol-overlay-face-2 ((t (:background "#654851" :distant-foreground "#d5c4a1"))))
 '(symbol-overlay-face-3 ((t (:background "#5f4f25" :distant-foreground "#d5c4a1"))))
 '(symbol-overlay-face-4 ((t (:background "#603c1e" :distant-foreground "#d5c4a1"))))
 '(symbol-overlay-face-5 ((t (:background "#5f2c26" :distant-foreground "#d5c4a1"))))
 '(symbol-overlay-face-6 ((t (:background "#49333f" :distant-foreground "#d5c4a1"))))
 '(symbol-overlay-face-7 ((t (:background "#5b5e23" :distant-foreground "#d5c4a1"))))
 '(symbol-overlay-face-8 ((t (:background "#334033" :distant-foreground "#d5c4a1"))))

 ;; tab
 '(tab-bar ((t (:background "#0d1011" :foreground "#0d1011"))))
 '(tab-bar-tab ((t (:background "#1d2021" :foreground "#ebdbb2"))))
 '(tab-bar-tab-inactive ((t (:background "#0d1011" :foreground "#d5c4a1"))))
 '(tab-line ((t (:background "#0d1011" :foreground "#0d1011"))))
 '(tab-line-close-highlight ((t (:foreground "#fabd2f"))))
 '(tab-line-highlight ((t (:inherit tab-line-tab))))
 '(tab-line-tab ((t (:background "#1d2021" :foreground "#ebdbb2"))))
 '(tab-line-tab-current ((t (:background "#1d2021" :foreground "#ebdbb2"))))
 '(tab-line-tab-inactive ((t (:background "#0d1011" :foreground "#d5c4a1"))))
 '(tab-line-tab-inactive-alternate ((t (:background "#0d1011" :foreground "#d5c4a1"))))

 ;; term
 '(term ((t (:foreground "#ebdbb2"))))
 '(term-bold ((t (:weight bold))))

 ;; trailing
 '(trailing-whitespace ((t (:background "#fb4934"))))

 ;; treemacs
 '(treemacs-nerd-icons-file-face ((t (:foreground "#dfd2b8"))))
 '(treemacs-nerd-icons-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))

 ;; typescript
 '(typescript-jsdoc-tag ((t (:foreground "#dfd2b8"))))
 '(typescript-jsdoc-type ((t (:foreground "#bdb29c"))))
 '(typescript-jsdoc-value ((t (:foreground "#e3d8c2"))))

 ;; vertico
 '(vertico-posframe-border ((t (:background "#928374"))))
 '(vertico-posframe-border-2 ((t (:background "#fb4934"))))
 '(vertico-posframe-border-3 ((t (:background "#b8bb26"))))
 '(vertico-posframe-border-4 ((t (:background "#83a598"))))
 '(vertico-posframe-border-fallback ((t (:background "#fabd2f"))))

 ;; vterm
 '(vterm-color-black ((t (:background "#494b4c" :foreground "#0d1011"))))
 '(vterm-color-blue ((t (:background "#a2bbb1" :foreground "#83a598"))))
 '(vterm-color-cyan ((t (:background "#aacf9c" :foreground "#8ec07c"))))
 '(vterm-color-green ((t (:background "#c9cb5c" :foreground "#b8bb26"))))
 '(vterm-color-magenta ((t (:background "#c489a4" :foreground "#b16286"))))
 '(vterm-color-red ((t (:background "#fb7666" :foreground "#fb4934"))))
 '(vterm-color-white ((t (:background "#fbf4d5" :foreground "#fbf1c7"))))
 '(vterm-color-yellow ((t (:background "#fbcd63" :foreground "#fabd2f"))))

 ;; web
 '(web-mode-block-control-face ((t (:foreground "#fe8019"))))
 '(web-mode-block-delimiter-face ((t (:foreground "#fe8019"))))
 '(web-mode-doctype-face ((t (:foreground "#928374"))))
 '(web-mode-html-entity-face ((t (:foreground "#8ec07c" :inherit italic))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#83a598"))))
 '(web-mode-json-context-face ((t (:foreground "#8ec07c"))))
 '(web-mode-json-key-face ((t (:foreground "#b8bb26"))))
 '(web-mode-keyword-face ((t (:foreground "#fb4934"))))
 '(web-mode-string-face ((t (:foreground "#b8bb26"))))
 '(web-mode-type-face ((t (:foreground "#fabd2f"))))

 ;; which
 '(which-func ((t (:foreground "#83a598"))))
 '(which-key-group-description-face ((t (:foreground "#fb4934"))))
 '(which-key-local-map-description-face ((t (:foreground "#fe8019"))))

 ;; whitespace
 '(whitespace-empty ((t (:background "#3c3836"))))
 '(whitespace-indentation ((t (:foreground "#665c54" :background "#3c3836"))))
 '(whitespace-line ((t (:background "#0d1011" :foreground "#fb4934" :weight bold))))
 '(whitespace-newline ((t (:foreground "#665c54"))))
 '(whitespace-space ((t (:foreground "#665c54"))))
 '(whitespace-tab ((t (:foreground "#665c54"))))
 '(whitespace-trailing ((t (:inherit trailing-whitespace))))

 ;; widget
 '(widget-button-pressed ((t (:foreground "#fb4934"))))
 '(widget-documentation ((t (:foreground "#b8bb26"))))
 '(widget-field ((t (:background "#3c3836" :distant-foreground "#1d2021" :box (:line-width -1 :color "#928374") :extend t))))
 '(widget-single-line-field ((t (:background "#3c3836" :distant-foreground "#1d2021"))))

 ;; window
 '(window-tool-bar-button ((t (:background "#1d2021" :foreground "#ebdbb2"))))
 '(window-tool-bar-button-disabled ((t (:background "#0d1011" :foreground "#d5c4a1"))))
 '(window-tool-bar-button-hover ((t (:inherit highlight :distant-foreground "#1d2021"))))

 ;; woman
 '(woman-bold ((t (:inherit Man-overstrike))))
 '(woman-italic ((t (:inherit Man-underline))))

 ;; xref
 '(xref-file-header ((t (:inherit success))))
 '(xref-line-number ((t (:foreground "#fabd2f"))))
 '(xref-match ((t (:foreground "#b8bb26" :background "#0d1011" :weight bold))))

 ;; yas
 '(yas-field-highlight-face ((t (:inherit match))))

 ;; local preferences
 '(lsp-face-semhl-property ((t (:foreground unspecified))))
 '(lsp-face-semhl-member ((t (:foreground unspecified))))
 '(lsp-face-semhl-variable ((t (:foreground unspecified))))
 '(lsp-face-semhl-parameter ((t (:foreground unspecified))))
 '(lsp-face-semhl-macro ((t (:foreground "#fb4934"))))
 '(lsp-rust-analyzer-mutable-modifier-face ((t (:underline nil)))))

(provide-theme 'gruvbox)

;;; gruvbox-theme.el ends here
