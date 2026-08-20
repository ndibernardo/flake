;;; tomorrow-night-theme.el --- Dark theme with the Tomorrow Night palette  -*- lexical-binding:t -*-

;;; Commentary:
;; Dark theme with the Tomorrow Night palette.

;;; Code:

;;;###theme-autoload
(deftheme tomorrow-night
  "Dark theme with the Tomorrow Night palette."
  :background-mode 'dark
  :kind 'color-scheme
  :family 'tomorrow)

(custom-theme-set-faces
 'tomorrow-night

 '(default ((t (:background "#1d1f21" :foreground "#c5c8c6"))))
 '(cursor ((t (:background "#81a2be"))))
 '(region ((t (:background "#333537" :distant-foreground "#9da09e" :extend t))))
 '(highlight ((t (:background "#81a2be" :foreground "#0d0d0d" :distant-foreground "#ffffff"))))
 '(hl-line ((t (:background "#161719" :extend t))))
 '(fringe ((t (:inherit default :foreground "#3f4040" :background unspecified))))
 '(vertical-border ((t (:background "#0d0d0d" :foreground "#0d0d0d"))))
 '(minibuffer-prompt ((t (:foreground "#81a2be"))))
 '(isearch ((t (:inherit lazy-highlight :weight bold))))
 '(lazy-highlight ((t (:background "#5a7185" :foreground "#ffffff" :distant-foreground "#0d0d0d" :weight bold))))
 '(link ((t (:foreground "#81a2be" :underline t :weight bold))))
 '(link-visited ((t (:foreground "#b294bb" :underline t))))
 '(button ((t (:inherit link))))
 '(header-line ((t (:inherit mode-line))))
 '(tooltip ((t (:background "#161719" :foreground "#c5c8c6"))))
 '(secondary-selection ((t (:background "#5a5b5a" :extend t))))

 '(font-lock-builtin-face ((t (:foreground "#81a2be"))))
 '(font-lock-comment-face ((t (:foreground "#5a5b5a"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-constant-face ((t (:foreground "#de935f"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground "#717171"))))
 '(font-lock-function-name-face ((t (:foreground "#81a2be"))))
 '(font-lock-keyword-face ((t (:foreground "#b294bb"))))
 '(font-lock-negation-char-face ((t (:inherit bold :foreground "#c5c8c6"))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#cc6666"))))
 '(font-lock-string-face ((t (:foreground "#b5bd68"))))
 '(font-lock-type-face ((t (:foreground "#f0c674"))))
 '(font-lock-variable-name-face ((t (:foreground unspecified))))
 '(font-lock-warning-face ((t (:inherit warning))))

 '(font-lock-operator-face ((t (:foreground "#c5c8c6"))))
 '(font-lock-punctuation-face ((t (:foreground "#c5c8c6"))))
 '(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit bold :foreground "#c5c8c6"))))
 '(font-lock-regexp-grouping-construct ((t (:inherit bold :foreground "#c5c8c6"))))

 '(mode-line ((t (:background "#0f1011" :foreground "#ffffff" :box nil))))
 '(mode-line-inactive ((t (:background "#1d1f21" :foreground "#5a5b5a" :box nil))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:foreground "#81a2be" :distant-foreground "#1d1f21"))))
 '(mode-line-highlight ((t (:inherit highlight :distant-foreground "#1d1f21"))))

 '(line-number ((t (:inherit default :foreground "#3f4040" :weight normal :slant normal :background unspecified))))
 '(line-number-current-line ((t (:inherit (hl-line default) :foreground "#81a2be" :weight normal :slant normal :bold t))))

 '(show-paren-match ((t (:foreground "#cc6666" :background "#0d0d0d" :weight ultra-bold))))
 '(show-paren-mismatch ((t (:foreground "#0d0d0d" :background "#cc6666" :weight ultra-bold))))

 '(match ((t (:foreground "#b5bd68" :background "#0d0d0d" :weight bold))))
 '(query-replace ((t (:inherit isearch))))

 '(diff-added ((t (:inherit hl-line :foreground "#b5bd68"))))
 '(diff-removed ((t (:foreground "#cc6666" :background "#292b2b"))))
 '(diff-changed ((t (:foreground "#b294bb"))))
 '(diff-header ((t (:foreground "#8abeb7"))))
 '(diff-file-header ((t (:foreground "#81a2be"))))

 '(compilation-error ((t (:inherit error :weight bold))))
 '(compilation-warning ((t (:inherit warning :slant normal))))
 '(compilation-info ((t (:inherit success))))
 '(compilation-line-number ((t (:foreground "#81a2be"))))

 '(org-todo ((t (:foreground "#b5bd68" :bold inherit))))
 '(org-done ((t (:inherit org-headline-done :weight bold))))
 '(org-headline-done ((t (:foreground "#5c5e5e"))))
 '(org-date ((t (:foreground "#f0c674"))))
 '(org-link ((t (:inherit link :foreground "#81a2be"))))
 '(org-block ((t (:background "#292b2b" :extend t))))
 '(org-block-begin-line ((t (:inherit org-block :foreground "#5a5b5a"))))
 '(org-block-end-line ((t (:inherit org-block-begin-line))))
 '(org-code ((t (:inherit org-block :foreground "#de935f"))))
 '(org-verbatim ((t (:foreground "#b5bd68"))))

 '(outline-1 ((t (:foreground "#81a2be" :weight bold :extend t))))
 '(outline-2 ((t (:foreground "#c9b4cf" :weight bold :extend t))))
 '(outline-3 ((t (:foreground "#b294bb" :weight bold :extend t))))
 '(outline-4 ((t (:foreground "#a0b9ce" :weight bold :extend t))))
 '(outline-5 ((t (:foreground "#d6c6db" :weight bold :extend t))))
 '(outline-6 ((t (:foreground "#c0d0de" :weight bold :extend t))))
 '(outline-7 ((t (:foreground "#e3d9e7" :weight bold :extend t))))
 '(outline-8 ((t (:foreground "#e5ecf2" :weight bold :extend t))))

 '(dired-directory ((t (:foreground "#81a2be"))))
 '(dired-symlink ((t (:foreground "#8abeb7" :weight bold))))
 '(dired-header ((t (:foreground "#81a2be" :weight bold))))

 '(eshell-prompt ((t (:foreground "#81a2be" :weight bold))))
 '(eshell-ls-directory ((t (:foreground "#81a2be"))))
 '(eshell-ls-executable ((t (:foreground "#b5bd68"))))
 '(eshell-ls-symlink ((t (:foreground "#8abeb7"))))

 '(company-tooltip ((t (:inherit tooltip))))
 '(company-tooltip-selection ((t (:background "#333537" :weight bold))))
 '(company-tooltip-common ((t (:foreground "#81a2be" :distant-foreground "#0d0d0d" :weight bold))))
 '(company-scrollbar-fg ((t (:background "#81a2be"))))
 '(company-scrollbar-bg ((t (:inherit tooltip))))

 '(corfu-default ((t (:inherit tooltip))))
 '(corfu-current ((t (:background "#1d1f21" :foreground "#c5c8c6"))))
 '(corfu-bar ((t (:background "#5c5e5e"))))
 '(corfu-border ((t (:background "#3f4040"))))
 '(corfu-annotations ((t (:foreground "#5a5b5a"))))
 '(corfu-deprecated ((t (:foreground "#5c5e5e" :strike-through t))))
 '(corfu-echo ((t (:foreground "#5a5b5a"))))
 '(corfu-popupinfo ((t (:background "#161719" :foreground "#c5c8c6"))))

 '(flycheck-error ((t (:underline (:style wave :color "#cc6666")))))
 '(flycheck-warning ((t (:underline (:style wave :color "#f0c674")))))
 '(flycheck-info ((t (:underline (:style wave :color "#b5bd68")))))

 '(git-gutter:added ((t (:inherit fringe :foreground "#b5bd68"))))
 '(git-gutter:deleted ((t (:inherit fringe :foreground "#cc6666"))))
 '(git-gutter:modified ((t (:inherit fringe :foreground "#767876"))))

 '(magit-branch-current ((t (:foreground "#81a2be"))))
 '(magit-branch-local ((t (:foreground "#8abeb7"))))
 '(magit-branch-remote ((t (:foreground "#b5bd68"))))
 '(magit-branch-upstream ((t (:foreground "#b5bd68"))))
 '(magit-tag ((t (:foreground "#f0c674"))))
 '(magit-hash ((t (:foreground "#5a5b5a"))))
 '(magit-section-heading ((t (:foreground "#81a2be" :weight bold :extend t))))
 '(magit-section-highlight ((t (:inherit hl-line))))
 '(magit-section-heading-selection ((t (:foreground "#de935f" :weight bold :extend t))))
 '(magit-diff-file-heading ((t (:foreground "#c5c8c6" :weight bold :extend t))))
 '(magit-diff-file-heading-highlight ((t (:background "#292b2b" :foreground "#c5c8c6"))))
 '(magit-diff-hunk-heading ((t (:foreground "#1d1f21" :background "#49424f" :extend t))))
 '(magit-diff-hunk-heading-highlight ((t (:foreground "#1d1f21" :background "#b294bb" :weight bold :extend t))))
 '(magit-diff-context ((t (:foreground "#767876" :background "#1d1f21" :extend t))))
 '(magit-diff-context-highlight ((t (:foreground "#c5c8c6" :background "#161719" :extend t))))
 '(magit-diff-added ((t (:foreground "#909753" :background "#2c2e28" :extend t))))
 '(magit-diff-added-highlight ((t (:foreground "#b5bd68" :background "#3b3e2f" :weight bold :extend t))))
 '(magit-diff-removed ((t (:foreground "#a35151" :background "#393030" :extend t))))
 '(magit-diff-removed-highlight ((t (:foreground "#cc6666" :background "#493636" :weight bold :extend t))))
 '(magit-diffstat-added ((t (:foreground "#b5bd68"))))
 '(magit-diffstat-removed ((t (:foreground "#cc6666"))))
 '(magit-log-author ((t (:foreground "#de935f"))))
 '(magit-log-date ((t (:foreground "#81a2be"))))
 '(magit-log-graph ((t (:foreground "#5a5b5a"))))
 '(magit-process-ok ((t (:inherit success))))
 '(magit-process-ng ((t (:inherit error))))

 '(vertico-current ((t (:background "#333537" :extend t))))
 '(vertico-group-title ((t (:foreground "#5a5b5a" :weight bold))))
 '(vertico-group-separator ((t (:foreground "#3f4040" :strike-through t))))
 '(vertico-multiline ((t (:foreground "#5a5b5a"))))
 '(vertico-quick1 ((t (:background "#161719" :foreground "#81a2be" :weight bold))))
 '(vertico-quick2 ((t (:background "#161719" :foreground "#b5bd68" :weight bold))))

 '(orderless-match-face-0 ((t (:weight bold :foreground "#9cb1c1" :background "#272c30"))))
 '(orderless-match-face-1 ((t (:weight bold :foreground "#c7bccb" :background "#2e2d32"))))
 '(orderless-match-face-2 ((t (:weight bold :foreground "#bbc18d" :background "#2c2e28"))))
 '(orderless-match-face-3 ((t (:weight bold :foreground "#dec694" :background "#322f29"))))

 '(marginalia-documentation ((t (:inherit font-lock-doc-face))))
 '(marginalia-key ((t (:foreground "#b5bd68"))))
 '(marginalia-type ((t (:foreground "#b294bb"))))
 '(marginalia-char ((t (:foreground "#81a2be"))))
 '(marginalia-lighter ((t (:foreground "#b294bb"))))
 '(marginalia-on ((t (:foreground "#b5bd68"))))
 '(marginalia-off ((t (:foreground "#cc6666"))))

 '(consult-file ((t (:foreground "#c5c8c6"))))
 '(consult-bookmark ((t (:foreground "#81a2be"))))
 '(consult-async-running ((t (:foreground "#81a2be"))))
 '(consult-async-finished ((t (:foreground "#b5bd68"))))
 '(consult-async-failed ((t (:foreground "#cc6666"))))
 '(consult-preview-line ((t (:background "#292b2b"))))
 '(consult-preview-match ((t (:background "#333537"))))

 '(ivy-current-match ((t (:background "#333537" :extend t))))
 '(ivy-minibuffer-match-face-1 ((t (:foreground "#717171" :weight light))))
 '(helm-selection ((t (:inherit bold :background "#333537" :extend t :distant-foreground "#81a2be"))))
 '(helm-match ((t (:inherit bold :foreground "#81a2be" :distant-foreground "#ffffff"))))

 '(term-color-black ((t (:background "#0d0d0d" :foreground "#0d0d0d"))))
 '(term-color-red ((t (:background "#cc6666" :foreground "#cc6666"))))
 '(term-color-green ((t (:background "#b5bd68" :foreground "#b5bd68"))))
 '(term-color-yellow ((t (:background "#f0c674" :foreground "#f0c674"))))
 '(term-color-blue ((t (:background "#81a2be" :foreground "#81a2be"))))
 '(term-color-magenta ((t (:background "#c9b4cf" :foreground "#c9b4cf"))))
 '(term-color-cyan ((t (:background "#8abeb7" :foreground "#8abeb7"))))
 '(term-color-white ((t (:background "#ffffff" :foreground "#ffffff"))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "#b294bb"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#81a2be"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#de935f"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#b5bd68"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#c9b4cf"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#f0c674"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#81a2be"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#b5bd68"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#b294bb"))))

 '(lsp-face-highlight-textual ((t (:weight bold :background "#292b2b" :foreground "#0d0d0d" :distant-foreground "#ffffff"))))
 '(lsp-face-highlight-read ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-face-highlight-write ((t (:inherit lsp-face-highlight-textual))))
 '(lsp-ui-doc-background ((t (:inherit tooltip))))
 '(lsp-ui-peek-selection ((t (:foreground "#1d1f21" :background "#81a2be" :bold t))))
 '(lsp-ui-sideline-code-action ((t (:foreground "#728ea6"))))

 '(which-key-key-face ((t (:foreground "#b5bd68"))))
 '(which-key-command-description-face ((t (:foreground "#81a2be"))))

 '(web-mode-html-tag-face ((t (:foreground "#81a2be"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#f0c674"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#b5bd68"))))
 '(web-mode-css-property-name-face ((t (:foreground "#f0c674"))))

 '(js2-function-param ((t (:foreground "#cc6666"))))
 '(js2-function-call ((t (:foreground "#81a2be"))))
 '(js2-object-property ((t (:foreground "#b294bb"))))
 '(js2-jsdoc-tag ((t (:foreground "#717171"))))
 '(js2-external-variable ((t (:foreground "#c5c8c6"))))

 '(markdown-bold-face ((t (:inherit bold :foreground "#de935f"))))
 '(markdown-italic-face ((t (:inherit italic :foreground "#b294bb"))))
 '(markdown-link-face ((t (:foreground "#81a2be"))))
 '(markdown-url-face ((t (:foreground "#c9b4cf" :weight normal))))
 '(markdown-code-face ((t (:background "#292b2b" :extend t))))
 '(markdown-blockquote-face ((t (:inherit italic :foreground "#717171"))))

 '(treemacs-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))
 '(treemacs-directory-face ((t (:foreground "#c5c8c6"))))
 '(treemacs-file-face ((t (:foreground "#c5c8c6"))))
 '(treemacs-tags-face ((t (:foreground "#81a2be"))))
 '(treemacs-fringe-indicator-face ((t (:foreground "#81a2be"))))
 '(treemacs-git-added-face ((t (:foreground "#b5bd68"))))
 '(treemacs-git-modified-face ((t (:foreground "#f0c674"))))
 '(treemacs-git-conflict-face ((t (:foreground "#cc6666"))))
 '(treemacs-git-untracked-face ((t (:foreground "#b5bd68"))))
 '(treemacs-git-renamed-face ((t (:foreground "#f0c674"))))
 '(treemacs-git-ignored-face ((t (:foreground "#5c5e5e"))))
 '(treemacs-on-success-pulse-face ((t (:foreground "#0d0d0d" :background "#b5bd68" :extend t))))
 '(treemacs-on-failure-pulse-face ((t (:foreground "#0d0d0d" :background "#cc6666" :extend t))))

 '(window-divider ((t (:inherit vertical-border))))
 '(window-divider-first-pixel ((t (:inherit window-divider))))
 '(window-divider-last-pixel ((t (:inherit window-divider))))

 '(error ((t (:foreground "#cc6666"))))
 '(warning ((t (:foreground "#f0c674"))))
 '(success ((t (:foreground "#b5bd68"))))

 ;; Man
 '(Man-overstrike ((t (:inherit bold :foreground "#c5c8c6"))))
 '(Man-underline ((t (:inherit underline :foreground "#b294bb"))))

 ;; ansi
 '(ansi-color-black ((t (:foreground "#1d1f21" :background "#1d1f21"))))
 '(ansi-color-blue ((t (:foreground "#81a2be" :background "#81a2be"))))
 '(ansi-color-bright-black ((t (:foreground "#3f4040" :background "#3f4040"))))
 '(ansi-color-bright-blue ((t (:foreground "#93afc7" :background "#93afc7"))))
 '(ansi-color-bright-cyan ((t (:foreground "#9bc7c1" :background "#9bc7c1"))))
 '(ansi-color-bright-green ((t (:foreground "#c0c67e" :background "#c0c67e"))))
 '(ansi-color-bright-magenta ((t (:foreground "#d1bfd6" :background "#d1bfd6"))))
 '(ansi-color-bright-red ((t (:foreground "#d37c7c" :background "#d37c7c"))))
 '(ansi-color-bright-white ((t (:foreground "#ffffff" :background "#ffffff"))))
 '(ansi-color-bright-yellow ((t (:foreground "#f2ce88" :background "#f2ce88"))))
 '(ansi-color-cyan ((t (:foreground "#8abeb7" :background "#8abeb7"))))
 '(ansi-color-green ((t (:foreground "#b5bd68" :background "#b5bd68"))))
 '(ansi-color-magenta ((t (:foreground "#c9b4cf" :background "#c9b4cf"))))
 '(ansi-color-red ((t (:foreground "#cc6666" :background "#cc6666"))))
 '(ansi-color-white ((t (:foreground "#c5c8c6" :background "#c5c8c6"))))
 '(ansi-color-yellow ((t (:foreground "#f0c674" :background "#f0c674"))))

 ;; avy
 '(avy-background-face ((t (:foreground "#5a5b5a"))))
 '(avy-lead-face ((t (:background "#81a2be" :foreground "#1d1f21" :distant-foreground "#c5c8c6" :weight bold))))
 '(avy-lead-face-0 ((t (:inherit avy-lead-face :background "#a6bdd1"))))
 '(avy-lead-face-1 ((t (:inherit avy-lead-face :background "#ccd9e4"))))
 '(avy-lead-face-2 ((t (:inherit avy-lead-face :background "#f2f5f8"))))

 ;; bold
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:inherit (bold italic)))))

 ;; bookmark
 '(bookmark-face ((t (:background "#272c30" :extend t))))

 ;; cider
 '(cider-debug-code-overlay-face ((t (:background "#292b2b"))))
 '(cider-deprecated-face ((t (:background "#474031"))))
 '(cider-enlightened-face ((t (:inherit cider-result-overlay-face :box (:color "#de935f" :line-width -1)))))
 '(cider-enlightened-local-face ((t (:foreground "#de935f" :weight bold))))
 '(cider-error-highlight-face ((t (:underline (:style wave :color "#cc6666")))))
 '(cider-fringe-good-face ((t (:foreground "#b5bd68"))))
 '(cider-instrumented-face ((t (:background "#402d2e"))))
 '(cider-result-overlay-face ((t (:background "#292b2b" :box (:line-width -1 :color "#5c5e5e")))))
 '(cider-test-error-face ((t (:background "#de935f"))))
 '(cider-test-failure-face ((t (:background "#513435"))))
 '(cider-test-success-face ((t (:foreground "#0d0d0d" :background "#b5bd68"))))
 '(cider-traced-face ((t (:background "#323e3e"))))
 '(cider-warning-highlight-face ((t (:underline (:style wave :color "#f0c674")))))

 ;; compilation
 '(compilation-column-number ((t (:inherit font-lock-comment-face))))
 '(compilation-mode-line-exit ((t (:inherit compilation-info))))
 '(compilation-mode-line-fail ((t (:inherit compilation-error))))

 ;; custom
 '(custom-button ((t (:foreground "#81a2be" :background "#1d1f21" :box (:line-width 1 :style nil)))))
 '(custom-button-mouse ((t (:foreground "#1d1f21" :background "#81a2be" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed ((t (:foreground "#1d1f21" :background "#81a2be" :box (:line-width 1 :style nil)))))
 '(custom-button-pressed-unraised ((t (:foreground "#1d1f21" :background "#b294bb" :box (:line-width 1 :style nil)))))
 '(custom-button-unraised ((t (:foreground "#b294bb" :background "#1d1f21" :box (:line-width 1 :style nil)))))
 '(custom-changed ((t (:foreground "#81a2be" :background "#1d1f21"))))
 '(custom-comment ((t (:foreground "#c5c8c6" :background "#333537"))))
 '(custom-comment-tag ((t (:foreground "#5a5b5a"))))
 '(custom-group-subtitle ((t (:foreground "#cc6666"))))
 '(custom-group-tag ((t (:foreground "#b294bb"))))
 '(custom-group-tag-1 ((t (:foreground "#81a2be"))))
 '(custom-invalid ((t (:foreground "#cc6666" :background "#402d2e"))))
 '(custom-modified ((t (:foreground "#81a2be" :background "#313940"))))
 '(custom-saved ((t (:foreground "#b5bd68" :background "#3b3e2f" :bold t))))
 '(custom-set ((t (:foreground "#f0c674" :background "#1d1f21"))))
 '(custom-state ((t (:foreground "#b5bd68" :background "#3b3e2f"))))
 '(custom-themed ((t (:foreground "#f0c674" :background "#1d1f21"))))
 '(custom-variable-button ((t (:foreground "#b5bd68" :underline t))))
 '(custom-variable-obsolete ((t (:foreground "#5a5b5a" :background "#1d1f21"))))
 '(custom-variable-tag ((t (:foreground "#c9b4cf"))))
 '(custom-visibility ((t (:foreground "#81a2be"))))

 ;; diff
 '(diff-context ((t (:foreground "#adb0ae"))))
 '(diff-hl-change ((t (:foreground "#767876" :background "#767876"))))
 '(diff-hl-delete ((t (:foreground "#cc6666" :background "#cc6666"))))
 '(diff-hl-insert ((t (:foreground "#b5bd68" :background "#b5bd68"))))
 '(diff-hunk-header ((t (:foreground "#b294bb"))))
 '(diff-indicator-added ((t (:foreground "#b5bd68"))))
 '(diff-indicator-changed ((t (:foreground "#767876"))))
 '(diff-indicator-removed ((t (:foreground "#cc6666"))))
 '(diff-refine-added ((t (:inherit diff-added :inverse-video t))))
 '(diff-refine-changed ((t (:inherit diff-changed :inverse-video t))))
 '(diff-refine-removed ((t (:inherit diff-removed :inverse-video t))))

 ;; dired
 '(dired-flagged ((t (:foreground "#cc6666"))))
 '(dired-ignored ((t (:foreground "#5a5b5a"))))
 '(dired-k-added ((t (:foreground "#b5bd68" :weight bold))))
 '(dired-k-commited ((t (:foreground "#b5bd68" :weight bold))))
 '(dired-k-directory ((t (:foreground "#81a2be" :weight bold))))
 '(dired-k-ignored ((t (:foreground "#5c5e5e" :weight bold))))
 '(dired-k-modified ((t (:foreground "#767876" :weight bold))))
 '(dired-k-untracked ((t (:foreground "#81a2be" :weight bold))))
 '(dired-mark ((t (:foreground "#de935f" :weight bold))))
 '(dired-marked ((t (:foreground "#c9b4cf" :weight bold :inverse-video t))))
 '(dired-perm-write ((t (:foreground "#c5c8c6" :underline t))))
 '(dired-subtree-depth-1-face ((t (:background "#151618"))))
 '(dired-subtree-depth-2-face ((t (:background "#151618"))))
 '(dired-subtree-depth-3-face ((t (:background "#141517"))))
 '(dired-subtree-depth-4-face ((t (:background "#141517"))))
 '(dired-subtree-depth-5-face ((t (:background "#131416"))))
 '(dired-subtree-depth-6-face ((t (:background "#131416"))))
 '(dired-warning ((t (:foreground "#f0c674"))))

 ;; ediff
 '(ediff-current-diff-A ((t (:foreground "#cc6666" :background "#493636" :extend t))))
 '(ediff-current-diff-B ((t (:foreground "#b5bd68" :background "#3b3e2f" :extend t))))
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
 '(elfeed-log-debug-level-face ((t (:foreground "#5a5b5a"))))
 '(elfeed-log-error-level-face ((t (:inherit error))))
 '(elfeed-log-info-level-face ((t (:inherit success))))
 '(elfeed-log-warn-level-face ((t (:inherit warning))))
 '(elfeed-search-date-face ((t (:foreground "#b294bb"))))
 '(elfeed-search-feed-face ((t (:foreground "#81a2be"))))
 '(elfeed-search-filter-face ((t (:foreground "#b294bb"))))
 '(elfeed-search-tag-face ((t (:foreground "#5a5b5a"))))
 '(elfeed-search-title-face ((t (:foreground "#5a5b5a"))))
 '(elfeed-search-unread-count-face ((t (:foreground "#f0c674"))))
 '(elfeed-search-unread-title-face ((t (:foreground "#c5c8c6" :weight bold))))

 ;; elixir
 '(elixir-atom-face ((t (:foreground "#41728e"))))
 '(elixir-attribute-face ((t (:foreground "#b294bb"))))

 ;; escape
 '(escape-glyph ((t (:foreground "#8abeb7"))))

 ;; eshell
 '(eshell-ls-archive ((t (:foreground "#c9b4cf"))))
 '(eshell-ls-backup ((t (:foreground "#f0c674"))))
 '(eshell-ls-clutter ((t (:foreground "#cc6666"))))
 '(eshell-ls-missing ((t (:foreground "#cc6666"))))
 '(eshell-ls-product ((t (:foreground "#de935f"))))
 '(eshell-ls-readonly ((t (:foreground "#de935f"))))
 '(eshell-ls-special ((t (:foreground "#b294bb"))))
 '(eshell-ls-unreadable ((t (:foreground "#5c5e5e"))))

 ;; flycheck
 '(flycheck-fringe-error ((t (:inherit fringe :foreground "#cc6666"))))
 '(flycheck-fringe-info ((t (:inherit fringe :foreground "#b5bd68"))))
 '(flycheck-fringe-warning ((t (:inherit fringe :foreground "#f0c674"))))
 '(flycheck-posframe-background-face ((t (:background "#161719"))))
 '(flycheck-posframe-error-face ((t (:inherit flycheck-posframe-face :foreground "#cc6666"))))
 '(flycheck-posframe-face ((t (:inherit default))))
 '(flycheck-posframe-info-face ((t (:inherit flycheck-posframe-face :foreground "#b5bd68"))))
 '(flycheck-posframe-warning-face ((t (:inherit flycheck-posframe-face :foreground "#f0c674"))))

 ;; flymake
 '(flymake-error ((t (:underline (:style wave :color "#cc6666")))))
 '(flymake-note ((t (:underline (:style wave :color "#b5bd68")))))
 '(flymake-warning ((t (:underline (:style wave :color "#de935f")))))

 ;; font
 '(font-latex-bold-face ((t (:inherit bold))))
 '(font-latex-italic-face ((t (:inherit italic))))
 '(font-latex-math-face ((t (:foreground "#81a2be"))))
 '(font-latex-script-char-face ((t (:foreground "#41728e"))))
 '(font-latex-sectioning-0-face ((t (:foreground "#81a2be" :weight ultra-bold))))
 '(font-latex-sectioning-1-face ((t (:foreground "#c9b4cf" :weight semi-bold))))
 '(font-latex-sectioning-2-face ((t (:foreground "#b294bb" :weight semi-bold))))
 '(font-latex-sectioning-3-face ((t (:foreground "#a6bdd1" :weight semi-bold))))
 '(font-latex-sectioning-4-face ((t (:foreground "#d9cadd" :weight semi-bold))))
 '(font-latex-sectioning-5-face ((t (:foreground "#c9b4cf" :weight semi-bold))))
 '(font-latex-sedate-face ((t (:inherit font-lock-keyword-face))))
 '(font-latex-string-face ((t (:inherit font-lock-string-face))))
 '(font-latex-underline-face ((t (:inherit underline))))
 '(font-latex-verbatim-face ((t (:inherit fixed-pitch :foreground "#b294bb" :slant normal))))
 '(font-latex-warning-face ((t (:inherit font-lock-warning-face))))
 '(font-lock-escape-face ((t (:inherit font-lock-regexp-grouping-backslash))))
 '(font-lock-function-call-face ((t (:inherit font-lock-function-name-face :slant normal :foreground "#95adc0"))))
 '(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 '(font-lock-number-face ((t (:foreground "#de935f"))))
 '(font-lock-preprocessor-char-face ((t (:inherit bold :foreground "#c5c8c6"))))
 '(font-lock-property-name-face ((t (:foreground "#b9a8bf" :weight bold))))
 '(font-lock-property-use-face ((t (:inherit font-lock-property-name-face :weight regular))))
 '(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face :foreground unspecified))))

 ;; git
 '(git-commit-comment-branch-local ((t (:foreground "#c9b4cf"))))
 '(git-commit-comment-branch-remote ((t (:foreground "#b5bd68"))))
 '(git-commit-comment-detached ((t (:foreground "#de935f"))))
 '(git-commit-comment-file ((t (:foreground "#b294bb"))))
 '(git-commit-comment-heading ((t (:foreground "#b294bb"))))
 '(git-commit-keyword ((t (:foreground "#8abeb7" :slant normal))))
 '(git-commit-known-pseudo-header ((t (:foreground "#717171" :weight bold :slant normal))))
 '(git-commit-nonempty-second-line ((t (:inherit git-commit-overlong-summary))))
 '(git-commit-overlong-summary ((t (:inherit error :background "#0d0d0d" :slant normal :weight bold))))
 '(git-commit-pseudo-header ((t (:foreground "#717171" :slant normal))))
 '(git-commit-summary ((t (:foreground "#b5bd68"))))
 '(git-gutter+-added ((t (:inherit fringe :foreground "#b5bd68"))))
 '(git-gutter+-deleted ((t (:inherit fringe :foreground "#cc6666"))))
 '(git-gutter+-modified ((t (:inherit fringe :foreground "#767876"))))
 '(git-gutter-fr:added ((t (:inherit fringe :foreground "#b5bd68"))))
 '(git-gutter-fr:deleted ((t (:inherit fringe :foreground "#cc6666"))))
 '(git-gutter-fr:modified ((t (:inherit fringe :foreground "#767876"))))

 ;; header
 '(header-line-highlight ((t (:inherit mode-line-highlight))))

 ;; hi
 '(hi-blue ((t (:background "#81a2be"))))
 '(hi-blue-b ((t (:foreground "#81a2be" :weight bold))))
 '(hi-green ((t (:background "#b5bd68"))))
 '(hi-green-b ((t (:foreground "#b5bd68" :weight bold))))
 '(hi-pink ((t (:background "#c9b4cf"))))
 '(hi-red-b ((t (:foreground "#cc6666" :weight bold))))
 '(hi-yellow ((t (:background "#f0c674"))))

 ;; highlight
 '(highlight-indentation-current-column-face ((t (:background "#1b1b1b"))))
 '(highlight-indentation-face ((t (:inherit hl-line))))
 '(highlight-indentation-guides-even-face ((t (:inherit highlight-indentation-face))))
 '(highlight-indentation-guides-odd-face ((t (:inherit highlight-indentation-face))))
 '(highlight-numbers-number ((t (:inherit bold :foreground "#de935f"))))
 '(highlight-quoted-quote ((t (:foreground "#c5c8c6"))))
 '(highlight-quoted-symbol ((t (:foreground "#f0c674"))))
 '(highlight-symbol-face ((t (:background "#47494a" :distant-foreground "#767876"))))
 '(highlight-thing ((t (:background "#47494a" :distant-foreground "#767876"))))

 ;; hl
 '(hl-fill-column-face ((t (:inherit (hl-line shadow)))))
 '(hl-todo ((t (:foreground "#cc6666" :weight bold))))

 ;; imenu
 '(imenu-list-entry-face-0 ((t (:foreground "#81a2be"))))
 '(imenu-list-entry-face-1 ((t (:foreground "#b5bd68"))))
 '(imenu-list-entry-face-2 ((t (:foreground "#f0c674"))))
 '(imenu-list-entry-subalist-face-0 ((t (:inherit imenu-list-entry-face-0 :weight bold))))
 '(imenu-list-entry-subalist-face-1 ((t (:inherit imenu-list-entry-face-1 :weight bold))))
 '(imenu-list-entry-subalist-face-2 ((t (:inherit imenu-list-entry-face-2 :weight bold))))

 ;; indent
 '(indent-guide-face ((t (:inherit hl-line))))

 ;; isearch
 '(isearch-fail ((t (:background "#cc6666" :foreground "#0d0d0d" :weight bold))))

 ;; italic
 '(italic ((t (:slant normal))))

 ;; lsp
 '(lsp-headerline-breadcrumb-separator-face ((t (:inherit shadow))))
 '(lsp-ui-peek-filename ((t (:inherit mode-line-buffer-id))))
 '(lsp-ui-peek-header ((t (:foreground "#c5c8c6" :background "#333537" :bold t))))
 '(lsp-ui-peek-highlight ((t (:inherit isearch :box t))))
 '(lsp-ui-peek-line-number ((t (:foreground "#b5bd68"))))
 '(lsp-ui-peek-list ((t (:background "#1a1b1d"))))
 '(lsp-ui-peek-peek ((t (:background "#1a1b1d"))))
 '(lsp-ui-sideline-current-symbol ((t (:inherit highlight))))
 '(lsp-ui-sideline-symbol-info ((t (:foreground "#505251" :background "#161719" :extend t))))

 ;; magit
 '(magit-bisect-bad ((t (:foreground "#cc6666"))))
 '(magit-bisect-good ((t (:foreground "#b5bd68"))))
 '(magit-bisect-skip ((t (:foreground "#de935f"))))
 '(magit-blame-date ((t (:foreground "#cc6666"))))
 '(magit-blame-hash ((t (:foreground "#8abeb7"))))
 '(magit-blame-heading ((t (:foreground "#de935f" :background "#292b2b" :extend t))))
 '(magit-cherry-equivalent ((t (:foreground "#b294bb"))))
 '(magit-cherry-unmatched ((t (:foreground "#8abeb7"))))
 '(magit-diff-base ((t (:foreground "#b1754c" :background "#302a27" :extend t))))
 '(magit-diff-base-highlight ((t (:foreground "#de935f" :background "#43362d" :weight bold :extend t))))
 '(magit-diff-file-heading-selection ((t (:foreground "#c9b4cf" :background "#41728e" :weight bold :extend t))))
 '(magit-diff-lines-heading ((t (:foreground "#f0c674" :background "#cc6666" :extend t :extend t))))
 '(magit-dimmed ((t (:foreground "#767876"))))
 '(magit-filename ((t (:foreground "#b294bb"))))
 '(magit-header-line ((t (:background "#41728e" :foreground "#ffffff" :weight bold :box (:line-width 3 :color "#41728e")))))
 '(magit-reflog-amend ((t (:foreground "#c9b4cf"))))
 '(magit-reflog-checkout ((t (:foreground "#81a2be"))))
 '(magit-reflog-cherry-pick ((t (:foreground "#b5bd68"))))
 '(magit-reflog-commit ((t (:foreground "#b5bd68"))))
 '(magit-reflog-merge ((t (:foreground "#b5bd68"))))
 '(magit-reflog-other ((t (:foreground "#8abeb7"))))
 '(magit-reflog-rebase ((t (:foreground "#c9b4cf"))))
 '(magit-reflog-remote ((t (:foreground "#8abeb7"))))
 '(magit-reflog-reset ((t (:inherit error))))
 '(magit-refname ((t (:foreground "#5a5b5a"))))
 '(magit-section-secondary-heading ((t (:foreground "#b294bb" :weight bold :extend t))))
 '(magit-sequence-drop ((t (:foreground "#cc6666"))))
 '(magit-sequence-head ((t (:foreground "#81a2be"))))
 '(magit-sequence-part ((t (:foreground "#de935f"))))
 '(magit-sequence-stop ((t (:foreground "#b5bd68"))))
 '(magit-signature-bad ((t (:inherit error))))
 '(magit-signature-error ((t (:inherit error))))
 '(magit-signature-expired ((t (:foreground "#de935f"))))
 '(magit-signature-good ((t (:inherit success))))
 '(magit-signature-revoked ((t (:foreground "#c9b4cf"))))
 '(magit-signature-untrusted ((t (:foreground "#f0c674"))))

 ;; makefile
 '(makefile-targets ((t (:foreground "#81a2be"))))

 ;; marginalia
 '(marginalia-file-priv-dir ((t (:foreground "#81a2be"))))
 '(marginalia-file-priv-exec ((t (:foreground "#b5bd68"))))
 '(marginalia-file-priv-link ((t (:foreground "#b294bb"))))
 '(marginalia-file-priv-other ((t (:foreground "#c9b4cf"))))
 '(marginalia-file-priv-rare ((t (:foreground "#c5c8c6"))))
 '(marginalia-file-priv-read ((t (:foreground "#f0c674"))))
 '(marginalia-file-priv-write ((t (:foreground "#cc6666"))))
 '(marginalia-number ((t (:foreground "#de935f"))))
 '(marginalia-size ((t (:foreground "#b294bb"))))

 ;; markdown
 '(markdown-header-delimiter-face ((t (:inherit markdown-header-face))))
 '(markdown-header-face ((t (:inherit bold :foreground "#81a2be"))))
 '(markdown-html-attr-name-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-attr-value-face ((t (:inherit font-lock-string-face))))
 '(markdown-html-entity-face ((t (:inherit font-lock-variable-name-face))))
 '(markdown-html-tag-delimiter-face ((t (:inherit markdown-markup-face))))
 '(markdown-html-tag-name-face ((t (:inherit font-lock-keyword-face))))
 '(markdown-inline-code-face ((t (:inherit (markdown-code-face markdown-pre-face)))))
 '(markdown-list-face ((t (:foreground "#cc6666"))))
 '(markdown-markup-face ((t (:foreground "#c5c8c6"))))
 '(markdown-metadata-key-face ((t (:foreground "#cc6666"))))
 '(markdown-pre-face ((t (:foreground "#b5bd68"))))
 '(markdown-reference-face ((t (:foreground "#717171"))))

 ;; mc/cursor
 '(mc/cursor-face ((t (:inherit cursor))))

 ;; message
 '(message-cited-text ((t (:foreground "#b294bb"))))
 '(message-cited-text-1 ((t (:foreground "#f0c674"))))
 '(message-cited-text-2 ((t (:foreground "#c9b4cf"))))
 '(message-cited-text-3 ((t (:foreground "#b5bd68"))))
 '(message-cited-text-4 ((t (:foreground "#b5bd68"))))
 '(message-header-cc ((t (:inherit message-header-to :foreground "#6d89a1"))))
 '(message-header-name ((t (:foreground "#b5bd68"))))
 '(message-header-newsgroups ((t (:foreground "#f0c674"))))
 '(message-header-other ((t (:foreground "#b294bb"))))
 '(message-header-subject ((t (:foreground "#81a2be" :weight bold))))
 '(message-header-to ((t (:foreground "#81a2be" :weight bold))))
 '(message-header-xheader ((t (:foreground "#717171"))))
 '(message-mml ((t (:foreground "#5a5b5a" :slant normal))))
 '(message-separator ((t (:foreground "#5a5b5a"))))

 ;; mode
 '(mode-line-active ((t (:inherit mode-line))))

 ;; nobreak
 '(nobreak-space ((t (:inherit escape-glyph :underline t))))

 ;; org
 '(org-agenda-clocking ((t (:background "#313940"))))
 '(org-agenda-date ((t (:foreground "#b294bb" :weight ultra-bold))))
 '(org-agenda-date-today ((t (:foreground "#d0bed6" :weight ultra-bold))))
 '(org-agenda-date-weekend ((t (:foreground "#6a5870" :weight ultra-bold))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "#5a5b5a"))))
 '(org-agenda-done ((t (:inherit org-done))))
 '(org-agenda-structure ((t (:foreground "#c5c8c6" :weight ultra-bold))))
 '(org-archived ((t (:foreground "#717171"))))
 '(org-block-background ((t (:background "#292b2b" :extend t))))
 '(org-checkbox ((t (:inherit org-todo))))
 '(org-checkbox-statistics-done ((t (:inherit org-done))))
 '(org-checkbox-statistics-todo ((t (:inherit org-todo))))
 '(org-cite ((t (:foreground "#87a5be"))))
 '(org-cite-key ((t (:foreground "#9cb1c1" :underline t))))
 '(org-default ((t (:inherit variable-pitch))))
 '(org-document-info ((t (:foreground "#81a2be"))))
 '(org-document-title ((t (:foreground "#81a2be" :weight bold))))
 '(org-drawer ((t (:foreground "#5a5b5a"))))
 '(org-ellipsis ((t (:foreground "#5a5b5a"))))
 '(org-footnote ((t (:foreground "#de935f"))))
 '(org-formula ((t (:foreground "#8abeb7"))))
 '(org-habit-alert-face ((t (:weight bold :background "#836e46"))))
 '(org-habit-alert-future-face ((t (:weight bold :background "#574b34"))))
 '(org-habit-clear-face ((t (:weight bold :background "#3f4040"))))
 '(org-habit-clear-future-face ((t (:weight bold :background "#292b2b"))))
 '(org-habit-overdue-face ((t (:weight bold :background "#713e3f"))))
 '(org-habit-overdue-future-face ((t (:weight bold :background "#4c2e30"))))
 '(org-habit-ready-face ((t (:weight bold :background "#4b5c6b"))))
 '(org-habit-ready-future-face ((t (:weight bold :background "#36404a"))))
 '(org-hide ((t (:foreground "#1d1f21"))))
 '(org-journal-calendar-entry-face ((t (:foreground "#c9b4cf" :slant normal))))
 '(org-journal-calendar-scheduled-face ((t (:foreground "#cc6666" :slant normal))))
 '(org-journal-highlight ((t (:foreground "#81a2be"))))
 '(org-latex-and-related ((t (:foreground "#ffffff" :weight bold))))
 '(org-list-dt ((t (:foreground "#81a2be"))))
 '(org-meta-line ((t (:foreground "#717171"))))
 '(org-pomodoro-mode-line ((t (:foreground "#cc6666"))))
 '(org-pomodoro-mode-line-overtime ((t (:foreground "#f0c674" :weight bold))))
 '(org-priority ((t (:foreground "#cc6666"))))
 '(org-property-value ((t (:foreground "#717171"))))
 '(org-quote ((t (:inherit org-block :slant normal))))
 '(org-ref-acronym-face ((t (:foreground "#b294bb"))))
 '(org-ref-cite-face ((t (:foreground "#f0c674" :weight light :underline t))))
 '(org-ref-glossary-face ((t (:foreground "#c9b4cf"))))
 '(org-ref-label-face ((t (:foreground "#81a2be"))))
 '(org-ref-ref-face ((t (:inherit link :foreground "#81a2be"))))
 '(org-scheduled ((t (:foreground "#c5c8c6"))))
 '(org-scheduled-previously ((t (:foreground "#ffffff"))))
 '(org-scheduled-today ((t (:foreground "#969896"))))
 '(org-sexp-date ((t (:foreground "#c5c8c6"))))
 '(org-special-keyword ((t (:foreground "#717171"))))
 '(org-table ((t (:foreground "#b294bb"))))
 '(org-tag ((t (:foreground "#717171" :weight normal))))
 '(org-time-grid ((t (:foreground "#5a5b5a"))))
 '(org-upcoming-deadline ((t (:foreground "#a3a6a5"))))
 '(org-upcoming-distant-deadline ((t (:foreground "#717373"))))
 '(org-warning ((t (:foreground "#f0c674"))))

 ;; paren
 '(paren-face ((t (:foreground "#5a5b5a"))))
 '(paren-face-match ((t (:foreground "#cc6666" :background "#0d0d0d" :weight ultra-bold))))
 '(paren-face-mismatch ((t (:foreground "#0d0d0d" :background "#cc6666" :weight ultra-bold))))
 '(paren-face-no-match ((t (:inherit paren-face-mismatch :weight ultra-bold))))

 ;; rainbow
 '(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "#cc6666"))))
 '(rainbow-delimiters-base-face ((t (:inherit default))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#cc6666" :weight bold :inverse-video t))))

 ;; sh
 '(sh-heredoc ((t (:inherit font-lock-string-face :weight normal))))
 '(sh-quoted-exec ((t (:inherit font-lock-preprocessor-face))))

 ;; shadow
 '(shadow ((t (:foreground "#5c5e5e"))))

 ;; smerge
 '(smerge-base ((t (:background "#313940"))))
 '(smerge-lower ((t (:background "#3b3e2f"))))
 '(smerge-markers ((t (:background "#5a5b5a" :foreground "#1d1f21" :distant-foreground "#c5c8c6" :weight bold))))
 '(smerge-mine ((t (:background "#493636"))))
 '(smerge-other ((t (:background "#3b3e2f"))))
 '(smerge-refined-added ((t (:inherit diff-added :inverse-video t))))
 '(smerge-refined-removed ((t (:inherit diff-removed :inverse-video t))))
 '(smerge-upper ((t (:background "#493636"))))

 ;; symbol
 '(symbol-overlay-default-face ((t (:background "#47494a" :distant-foreground "#767876"))))
 '(symbol-overlay-face-1 ((t (:background "#45535f" :distant-foreground "#767876"))))
 '(symbol-overlay-face-2 ((t (:background "#584d5e" :distant-foreground "#767876"))))
 '(symbol-overlay-face-3 ((t (:background "#5c5139" :distant-foreground "#767876"))))
 '(symbol-overlay-face-4 ((t (:background "#564133" :distant-foreground "#767876"))))
 '(symbol-overlay-face-5 ((t (:background "#513435" :distant-foreground "#767876"))))
 '(symbol-overlay-face-6 ((t (:background "#504b55" :distant-foreground "#767876"))))
 '(symbol-overlay-face-7 ((t (:background "#595e3d" :distant-foreground "#767876"))))
 '(symbol-overlay-face-8 ((t (:background "#323e3f" :distant-foreground "#767876"))))

 ;; tab
 '(tab-bar ((t (:background "#161719" :foreground "#161719"))))
 '(tab-bar-tab ((t (:background "#1d1f21" :foreground "#c5c8c6"))))
 '(tab-bar-tab-inactive ((t (:background "#161719" :foreground "#767876"))))
 '(tab-line ((t (:background "#161719" :foreground "#161719"))))
 '(tab-line-close-highlight ((t (:foreground "#81a2be"))))
 '(tab-line-highlight ((t (:inherit tab-line-tab))))
 '(tab-line-tab ((t (:background "#1d1f21" :foreground "#c5c8c6"))))
 '(tab-line-tab-current ((t (:background "#1d1f21" :foreground "#c5c8c6"))))
 '(tab-line-tab-inactive ((t (:background "#161719" :foreground "#767876"))))
 '(tab-line-tab-inactive-alternate ((t (:background "#161719" :foreground "#767876"))))

 ;; term
 '(term ((t (:foreground "#c5c8c6"))))
 '(term-bold ((t (:weight bold))))

 ;; trailing
 '(trailing-whitespace ((t (:background "#cc6666"))))

 ;; treemacs
 '(treemacs-nerd-icons-file-face ((t (:foreground "#717171"))))
 '(treemacs-nerd-icons-root-face ((t (:inherit font-lock-string-face :weight bold :height 1.2))))

 ;; typescript
 '(typescript-jsdoc-tag ((t (:foreground "#717171"))))
 '(typescript-jsdoc-type ((t (:foreground "#606060"))))
 '(typescript-jsdoc-value ((t (:foreground "#868686"))))

 ;; vertico
 '(vertico-posframe-border ((t (:background "#5a5b5a"))))
 '(vertico-posframe-border-2 ((t (:background "#cc6666"))))
 '(vertico-posframe-border-3 ((t (:background "#b5bd68"))))
 '(vertico-posframe-border-4 ((t (:background "#81a2be"))))
 '(vertico-posframe-border-fallback ((t (:background "#f0c674"))))

 ;; vterm
 '(vterm-color-black ((t (:background "#494949" :foreground "#0d0d0d"))))
 '(vterm-color-blue ((t (:background "#a0b9ce" :foreground "#81a2be"))))
 '(vterm-color-cyan ((t (:background "#a7cec9" :foreground "#8abeb7"))))
 '(vterm-color-green ((t (:background "#c7cd8d" :foreground "#b5bd68"))))
 '(vterm-color-magenta ((t (:background "#d6c6db" :foreground "#c9b4cf"))))
 '(vterm-color-red ((t (:background "#d88c8c" :foreground "#cc6666"))))
 '(vterm-color-white ((t (:background "#ffffff" :foreground "#ffffff"))))
 '(vterm-color-yellow ((t (:background "#f3d496" :foreground "#f0c674"))))

 ;; web
 '(web-mode-block-control-face ((t (:foreground "#de935f"))))
 '(web-mode-block-delimiter-face ((t (:foreground "#81a2be"))))
 '(web-mode-doctype-face ((t (:foreground "#5a5b5a"))))
 '(web-mode-html-entity-face ((t (:foreground "#8abeb7" :inherit italic))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "#c5c8c6"))))
 '(web-mode-json-context-face ((t (:foreground "#b5bd68"))))
 '(web-mode-json-key-face ((t (:foreground "#b5bd68"))))
 '(web-mode-keyword-face ((t (:foreground "#b294bb"))))
 '(web-mode-string-face ((t (:foreground "#b5bd68"))))
 '(web-mode-type-face ((t (:foreground "#f0c674"))))

 ;; which
 '(which-func ((t (:foreground "#81a2be"))))
 '(which-key-group-description-face ((t (:foreground "#b294bb"))))
 '(which-key-local-map-description-face ((t (:foreground "#c9b4cf"))))

 ;; whitespace
 '(whitespace-empty ((t (:background "#292b2b"))))
 '(whitespace-indentation ((t (:foreground "#3f4040" :background "#292b2b"))))
 '(whitespace-line ((t (:background "#0d0d0d" :foreground "#cc6666" :weight bold))))
 '(whitespace-newline ((t (:foreground "#3f4040"))))
 '(whitespace-space ((t (:foreground "#3f4040"))))
 '(whitespace-tab ((t (:foreground "#3f4040"))))
 '(whitespace-trailing ((t (:inherit trailing-whitespace))))

 ;; widget
 '(widget-button-pressed ((t (:foreground "#cc6666"))))
 '(widget-documentation ((t (:foreground "#b5bd68"))))
 '(widget-field ((t (:background "#292b2b" :distant-foreground "#1d1f21" :box (:line-width -1 :color "#5a5b5a") :extend t))))
 '(widget-single-line-field ((t (:background "#292b2b" :distant-foreground "#1d1f21"))))

 ;; window
 '(window-tool-bar-button ((t (:background "#1d1f21" :foreground "#c5c8c6"))))
 '(window-tool-bar-button-disabled ((t (:background "#161719" :foreground "#767876"))))
 '(window-tool-bar-button-hover ((t (:inherit highlight :distant-foreground "#1d1f21"))))

 ;; woman
 '(woman-bold ((t (:inherit Man-overstrike))))
 '(woman-italic ((t (:inherit Man-underline))))

 ;; xref
 '(xref-file-header ((t (:inherit success))))
 '(xref-line-number ((t (:foreground "#81a2be"))))
 '(xref-match ((t (:foreground "#b5bd68" :background "#0d0d0d" :weight bold))))

 ;; yas
 '(yas-field-highlight-face ((t (:inherit match))))

 ;; local preferences
 '(lsp-face-semhl-property ((t (:foreground unspecified))))
 '(lsp-face-semhl-member ((t (:foreground unspecified))))
 '(lsp-face-semhl-variable ((t (:foreground unspecified))))
 '(lsp-face-semhl-parameter ((t (:foreground unspecified))))
 '(lsp-face-semhl-macro ((t (:foreground "#cc6666"))))
 '(lsp-rust-analyzer-mutable-modifier-face ((t (:underline nil)))))

(provide-theme 'tomorrow-night)

;;; tomorrow-night-theme.el ends here
