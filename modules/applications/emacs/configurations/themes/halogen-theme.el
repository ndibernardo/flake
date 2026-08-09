;;; halogen-theme.el --- A dark theme based on Focus editor's Halogen theme -*- lexical-binding: t -*-

;;; Commentary:

;; A dark theme inspired by the Halogen theme from the Focus editor.

;;; Code:

(deftheme halogen
  "A dark theme based on Focus editor's Halogen theme.")

(let ((class '((class color) (min-colors 89)))
      ;; Color palette extracted from the Focus Halogen theme
      (bg0 "#181818")           ; background0
      (bg1 "#181818")           ; background1
      (bg2 "#383838")           ; background2
      (bg3 "#181818")           ; background3 (with alpha, using base)
      (bg4 "#181818")           ; background4 (with alpha, using base)

      (fg-default "#BFC9DB")    ; ui_default/code_default
      (fg-dim "#87919D")        ; ui_dim
      (fg-neutral "#4C4C4C")    ; ui_neutral

      (selection "#BFC9DB38")   ; selection_active (using without alpha)
      (selection-bg "#2A2A2A")  ; Approximation of selection with alpha
      (highlight "#FCEDFC26")   ; selection_highlight (using without alpha)
      (highlight-bg "#2A2A2A")  ; Approximation of highlight with alpha

      (cursor "#BFC9DB")        ; cursor
      (search-active "#8E772E") ; search_result_active
      (search-inactive "#2A2A2A") ; search_result_inactive approximation

      (scrollbar "#282828")     ; scrollbar_hover
      (border "#8296C1")        ; splitter (using without alpha)

      ;; Syntax highlighting colors
      (comment "#536371")       ; code_comment
      (comment-dim "#87919D")   ; code_multiline_comment
      (type "#6E8EB8")         ; code_type/code_function
      (string "#D4BC7D")       ; code_string_literal
      (keyword "#3AA982")      ; code_keyword
      (builtin "#E0AD82")      ; code_builtin_function/code_macro
      (constant "#D699B5")     ; code_number/code_builtin_variable
      (variable "#BFC9DB")     ; code_identifier/code_enum_variant
      (function "#6E8EB8")     ; code_function
      (operator "#FFFFFF")     ; code_operation
      (punctuation "#BFC9DB")  ; code_punctuation
      (highlight-code "#D89B75") ; code_highlight
      (modifier "#E67D74")     ; code_modifier/code_attribute
      (warning "#E4D97D")      ; code_warning
      (error "#FF0000")        ; code_error/ui_error_bright
      (success "#3AA982")      ; region_success

      ;; UI colors
      (warning-ui "#F8AD34")   ; ui_warning
      (error-ui "#772222")     ; ui_error
      (success-ui "#18181850") ; ui_success (approximation)

      ;; Diff colors, kept in the palette's own key: the green of
      ;; keyword/success, the salmon of modifier and the yellow of warning,
      ;; over backgrounds tinted from bg0
      (added "#3AA982")        ; as keyword/success
      (deleted "#E67D74")      ; as modifier
      (changed "#E4D97D")      ; as warning
      (added-bg "#1C3A30")
      (added-bg-hl "#264F41")
      (deleted-bg "#3E2523")
      (deleted-bg-hl "#553330")
      (changed-bg "#3A3628")
      (changed-bg-hl "#4C4835"))

  (custom-theme-set-faces
   'halogen

   ;; Basic faces
   `(default ((,class (:foreground ,fg-default :background ,bg0))))
   `(cursor ((,class (:background ,cursor))))
   `(region ((,class (:background ,selection-bg))))
   `(highlight ((,class (:background ,highlight-bg))))
   `(hl-line ((,class (:background ,bg2))))
   `(fringe ((,class (:background unspecified :foreground ,fg-dim))))
   `(vertical-border ((,class (:foreground ,fg-neutral :background ,bg0))))
   `(show-paren-match ((,class (:background ,highlight-bg :weight bold))))
   `(show-paren-mismatch ((,class (:background ,error :foreground ,fg-default :weight bold))))
   `(success ((,class (:foreground ,success))))
   `(warning ((,class (:foreground ,warning))))

   ;; Mode line
   `(mode-line ((,class (:background ,bg2 :foreground ,fg-default :box nil))))
   `(mode-line-inactive ((,class (:background ,bg1 :foreground ,fg-dim))))
   `(mode-line-buffer-id ((,class (:foreground ,type :weight bold))))

   ;; Font lock (syntax highlighting)
   `(font-lock-builtin-face ((,class (:foreground ,builtin))))
   `(font-lock-comment-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,comment))))
   `(font-lock-constant-face ((,class (:foreground ,constant))))
   `(font-lock-doc-face ((,class (:inherit font-lock-comment-face :foreground ,comment-dim))))
   `(font-lock-function-name-face ((,class (:foreground ,function))))
   `(font-lock-keyword-face ((,class (:foreground ,keyword :weight bold))))
   `(font-lock-negation-char-face ((,class (:foreground ,operator))))
   `(font-lock-preprocessor-face ((,class (:foreground ,modifier))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,operator))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,operator))))
   `(font-lock-string-face ((,class (:foreground ,string))))
   `(font-lock-type-face ((,class (:foreground ,type))))
   `(font-lock-variable-name-face ((,class (:foreground unspecified))))
   `(font-lock-warning-face ((,class (:foreground ,warning :weight bold))))

   ;; Isearch
   `(isearch ((,class (:background ,search-active :foreground ,bg0 :weight bold))))
   `(lazy-highlight ((,class (:background ,search-inactive :foreground ,fg-default))))

   ;; Line numbers
   `(line-number ((,class (:foreground ,fg-dim :background unspecified))))
   `(line-number-current-line ((,class (:foreground ,fg-default :background unspecified :weight bold))))

   ;; Minibuffer
   `(minibuffer-prompt ((,class (:foreground ,type :weight bold))))

   ;; Company (autocompletion)
   `(company-tooltip ((,class (:background ,bg2 :foreground ,fg-default))))
   `(company-tooltip-selection ((,class (:background ,selection-bg))))
   `(company-tooltip-common ((,class (:foreground ,type :weight bold))))
   `(company-tooltip-common-selection ((,class (:foreground ,type :weight bold))))
   `(company-scrollbar-bg ((,class (:background ,scrollbar))))
   `(company-scrollbar-fg ((,class (:background ,border))))

   ;; Corfu
   `(corfu-default ((,class (:background ,bg2 :foreground ,fg-default))))
   `(corfu-current ((,class (:background ,selection-bg :foreground ,fg-default))))
   `(corfu-bar ((,class (:background ,border))))
   `(corfu-border ((,class (:background ,bg2))))
   `(corfu-annotations ((,class (:foreground ,comment-dim :underline nil))))
   `(corfu-deprecated ((,class (:foreground ,comment :strike-through t))))
   `(corfu-echo ((,class (:foreground ,comment-dim :underline nil))))
   `(corfu-popupinfo ((,class (:background ,bg2 :foreground ,fg-default))))

   ;; Vertico
   `(vertico-current ((,class (:background ,selection-bg :extend t))))
   `(vertico-group-title ((,class (:foreground ,comment :weight bold :underline nil))))
   `(vertico-group-separator ((,class (:foreground ,comment :strike-through t))))
   `(vertico-multiline ((,class (:foreground ,comment))))

   ;; Orderless
   `(orderless-match-face-0 ((,class (:foreground ,type :weight bold :underline nil))))
   `(orderless-match-face-1 ((,class (:foreground ,keyword :weight bold :underline nil))))
   `(orderless-match-face-2 ((,class (:foreground ,builtin :weight bold :underline nil))))
   `(orderless-match-face-3 ((,class (:foreground ,constant :weight bold :underline nil))))

   ;; Consult
   `(consult-file ((,class (:foreground ,fg-default))))
   `(consult-bookmark ((,class (:foreground ,type))))
   `(consult-async-running ((,class (:foreground ,type))))
   `(consult-async-finished ((,class (:foreground ,success))))
   `(consult-async-failed ((,class (:foreground ,deleted))))
   `(consult-preview-line ((,class (:background ,highlight-bg))))
   `(consult-preview-match ((,class (:background ,selection-bg))))

   ;; Marginalia and completion annotations: descriptions are never underlined
   `(completions-annotations ((,class (:foreground ,comment-dim :slant normal :underline nil))))
   `(completions-common-part ((,class (:foreground ,type :weight bold :underline nil))))
   `(shadow ((,class (:foreground ,comment :underline nil))))
   `(marginalia-documentation ((,class (:foreground ,comment-dim :underline nil))))
   `(marginalia-key ((,class (:foreground ,keyword :underline nil))))
   `(marginalia-type ((,class (:foreground ,type :underline nil))))
   `(marginalia-char ((,class (:foreground ,builtin :underline nil))))
   `(marginalia-value ((,class (:foreground ,fg-default :underline nil))))
   `(marginalia-number ((,class (:foreground ,constant :underline nil))))
   `(marginalia-size ((,class (:foreground ,constant :underline nil))))
   `(marginalia-version ((,class (:foreground ,constant :underline nil))))
   `(marginalia-date ((,class (:foreground ,string :underline nil))))
   `(marginalia-mode ((,class (:foreground ,keyword :underline nil))))
   `(marginalia-modified ((,class (:foreground ,modifier :underline nil))))
   `(marginalia-file-name ((,class (:foreground ,fg-default :underline nil))))
   `(marginalia-file-owner ((,class (:foreground ,comment :underline nil))))
   `(marginalia-file-priv-dir ((,class (:foreground ,type :underline nil))))
   `(marginalia-file-priv-link ((,class (:foreground ,builtin :underline nil))))
   `(marginalia-file-priv-read ((,class (:foreground ,success :underline nil))))
   `(marginalia-file-priv-write ((,class (:foreground ,modifier :underline nil))))
   `(marginalia-file-priv-exec ((,class (:foreground ,keyword :underline nil))))
   `(marginalia-file-priv-no ((,class (:foreground ,comment :underline nil))))
   `(marginalia-file-priv-other ((,class (:foreground ,constant :underline nil))))
   `(marginalia-file-priv-rare ((,class (:foreground ,constant :underline nil))))
   `(marginalia-function ((,class (:foreground ,type :underline nil))))
   `(marginalia-symbol ((,class (:foreground ,type :underline nil))))
   `(marginalia-list ((,class (:foreground ,constant :underline nil))))
   `(marginalia-null ((,class (:foreground ,comment :underline nil))))
   `(marginalia-true ((,class (:foreground ,keyword :underline nil))))
   `(marginalia-on ((,class (:foreground ,success :underline nil))))
   `(marginalia-off ((,class (:foreground ,deleted :underline nil))))
   `(marginalia-lighter ((,class (:foreground ,comment :underline nil))))
   `(marginalia-archive ((,class (:foreground ,warning-ui :underline nil))))
   `(marginalia-installed ((,class (:foreground ,success :underline nil))))

   ;; Links and buttons, without the default underline
   `(link ((,class (:foreground ,type :underline nil))))
   `(link-visited ((,class (:foreground ,constant :underline nil))))
   `(button ((,class (:foreground ,type :underline nil))))
   `(custom-link ((,class (:foreground ,type :underline nil))))
   `(help-key-binding ((,class (:foreground ,keyword :background ,bg2 :box nil))))

   ;; Flycheck (syntax checking)
   `(flycheck-error ((,class (:underline (:style wave :color ,error)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,warning-ui)))))
   `(flycheck-info ((,class (:underline (:style wave :color ,type)))))

   ;; Elfeed
   `(elfeed-log-debug-level-face ((,class (:foreground ,comment))))
   `(elfeed-log-error-level-face ((,class (:foreground ,error))))
   `(elfeed-log-info-level-face ((,class (:foreground ,success))))
   `(elfeed-log-warn-level-face ((,class (:foreground ,warning))))
   `(elfeed-search-date-face ((,class (:foreground ,constant))))
   `(elfeed-search-feed-face ((,class (:foreground ,type))))
   `(elfeed-search-filter-face ((,class (:foreground ,constant))))
   `(elfeed-search-last-modified-face ((,class (:foreground ,comment))))
   `(elfeed-search-tag-face ((,class (:foreground ,comment))))
   `(elfeed-search-title-face ((,class (:foreground ,comment))))
   `(elfeed-search-unread-count-face ((,class (:foreground ,warning))))
   `(elfeed-search-unread-title-face ((,class (:foreground ,fg-default :weight bold))))

   ;; Dired
   `(dired-directory ((,class (:foreground ,type :weight bold))))
   `(dired-symlink ((,class (:foreground ,builtin))))
   `(dired-executable ((,class (:foreground ,success))))

   ;; Org mode
   `(org-level-1 ((,class (:foreground ,type :weight bold :height 1.3))))
   `(org-level-2 ((,class (:foreground ,builtin :weight bold :height 1.2))))
   `(org-level-3 ((,class (:foreground ,keyword :weight bold :height 1.1))))
   `(org-level-4 ((,class (:foreground ,string :weight bold))))
   `(org-level-5 ((,class (:foreground ,constant :weight bold))))
   `(org-level-6 ((,class (:foreground ,modifier :weight bold))))
   `(org-link ((,class (:foreground ,type :underline nil))))
   `(org-code ((,class (:foreground ,builtin :background ,bg2))))
   `(org-block ((,class (:background ,bg2))))
   `(org-block-begin-line ((,class (:foreground ,comment :slant italic))))
   `(org-block-end-line ((,class (:foreground ,comment :slant italic))))

   ;; Magit (Git interface)
   `(magit-section-heading ((,class (:foreground ,type :weight bold))))
   `(magit-branch-local ((,class (:foreground ,keyword))))
   `(magit-branch-remote ((,class (:foreground ,builtin))))
   `(magit-diff-added ((,class (:foreground ,added :background ,added-bg :extend t))))
   `(magit-diff-added-highlight ((,class (:foreground ,added :background ,added-bg-hl :extend t))))
   `(magit-diff-removed ((,class (:foreground ,deleted :background ,deleted-bg :extend t))))
   `(magit-diff-removed-highlight ((,class (:foreground ,deleted :background ,deleted-bg-hl :extend t))))
   `(magit-diff-context ((,class (:foreground ,fg-dim :extend t))))
   `(magit-diff-context-highlight ((,class (:foreground ,fg-default :background ,bg2 :extend t))))
   `(magit-diff-file-heading ((,class (:foreground ,fg-default :weight bold :extend t))))
   `(magit-diff-file-heading-highlight ((,class (:foreground ,fg-default :background ,bg2 :weight bold :extend t))))
   `(magit-diff-hunk-heading ((,class (:background ,bg2 :foreground ,type :extend t))))
   `(magit-diff-hunk-heading-highlight ((,class (:background ,highlight-bg :foreground ,type :extend t))))
   `(magit-diff-lines-heading ((,class (:background ,type :foreground ,bg0 :extend t))))
   `(magit-diffstat-added ((,class (:foreground ,added))))
   `(magit-diffstat-removed ((,class (:foreground ,deleted))))

   ;; Diff
   `(diff-added ((,class (:foreground ,added :background ,added-bg :extend t))))
   `(diff-removed ((,class (:foreground ,deleted :background ,deleted-bg :extend t))))
   `(diff-changed ((,class (:foreground ,changed :background ,changed-bg :extend t))))
   `(diff-refine-added ((,class (:foreground ,added :background ,added-bg-hl :weight bold))))
   `(diff-refine-removed ((,class (:foreground ,deleted :background ,deleted-bg-hl :weight bold))))
   `(diff-refine-changed ((,class (:foreground ,changed :background ,changed-bg-hl :weight bold))))
   `(diff-indicator-added ((,class (:foreground ,added :background ,added-bg))))
   `(diff-indicator-removed ((,class (:foreground ,deleted :background ,deleted-bg))))
   `(diff-indicator-changed ((,class (:foreground ,changed :background ,changed-bg))))
   `(diff-context ((,class (:foreground ,fg-dim :extend t))))
   `(diff-header ((,class (:foreground ,type :background ,bg2 :extend t))))
   `(diff-file-header ((,class (:foreground ,fg-default :background ,bg2 :weight bold :extend t))))
   `(diff-hunk-header ((,class (:foreground ,type :background ,bg2 :extend t))))

   ;; Smerge
   `(smerge-upper ((,class (:background ,deleted-bg :extend t))))
   `(smerge-lower ((,class (:background ,added-bg :extend t))))
   `(smerge-base ((,class (:background ,changed-bg :extend t))))
   `(smerge-markers ((,class (:foreground ,comment :background ,bg2 :weight bold :extend t))))
   `(smerge-refined-added ((,class (:foreground ,added :background ,added-bg-hl))))
   `(smerge-refined-removed ((,class (:foreground ,deleted :background ,deleted-bg-hl))))

   ;; Git gutter
   `(git-gutter:added ((,class (:foreground ,added :background ,bg0))))
   `(git-gutter:deleted ((,class (:foreground ,deleted :background ,bg0))))
   `(git-gutter:modified ((,class (:foreground ,changed :background ,bg0))))
   `(git-gutter-fr:added ((,class (:foreground ,added :background ,bg0))))
   `(git-gutter-fr:deleted ((,class (:foreground ,deleted :background ,bg0))))
   `(git-gutter-fr:modified ((,class (:foreground ,changed :background ,bg0))))

   ;; Which-key
   `(which-key-key-face ((,class (:foreground ,keyword :weight bold))))
   `(which-key-command-description-face ((,class (:foreground ,fg-default))))
   `(which-key-separator-face ((,class (:foreground ,comment))))
   `(which-key-group-description-face ((,class (:foreground ,type))))

   ;; Helm
   `(helm-source-header ((,class (:foreground ,type :weight bold :height 1.3))))
   `(helm-selection ((,class (:background ,selection-bg))))
   `(helm-match ((,class (:foreground ,search-active :weight bold))))

   ;; Ivy
   `(ivy-current-match ((,class (:background ,selection-bg :weight bold))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,search-active))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,type :weight bold))))

   ;; Web mode
   `(web-mode-html-tag-face ((,class (:foreground ,type))))
   `(web-mode-html-attr-name-face ((,class (:foreground ,modifier))))
   `(web-mode-html-attr-value-face ((,class (:foreground ,string))))

   ;; Rust specific (since you mentioned Rust in preferences)
   `(rust-builtin-formatting-macro ((,class (:foreground ,builtin))))
   `(rust-question-mark ((,class (:foreground ,operator :weight bold))))

   ;; Additional programming modes
   `(sh-quoted-exec ((,class (:foreground ,builtin))))
   `(sh-heredoc ((,class (:foreground ,string))))

   ;; LSP Mode
   `(lsp-modeline-code-actions-face ((,class (:foreground ,builtin))))
   `(lsp-modeline-code-actions-preferred-face ((,class (:foreground ,keyword :weight bold))))
   `(lsp-face-highlight-textual ((,class (:background ,highlight-bg))))
   `(lsp-face-highlight-read ((,class (:background ,selection-bg))))
   `(lsp-face-highlight-write ((,class (:background ,selection-bg :weight bold))))
   `(lsp-headerline-breadcrumb-path-face ((,class (:foreground ,fg-dim))))
   `(lsp-headerline-breadcrumb-symbols-face ((,class (:foreground ,type :weight bold))))
   `(lsp-headerline-breadcrumb-project-prefix-face ((,class (:foreground ,keyword :weight bold))))
   `(lsp-headerline-breadcrumb-separator-face ((,class (:foreground ,comment))))

   ;; LSP UI (if using lsp-ui)
   `(lsp-ui-doc-background ((,class (:background ,bg2))))
   `(lsp-ui-doc-header ((,class (:background ,bg2 :foreground ,type :weight bold))))
   `(lsp-ui-sideline-code-action ((,class (:foreground ,builtin))))
   `(lsp-ui-sideline-current-symbol ((,class (:foreground ,highlight-code :weight bold))))
   `(lsp-ui-sideline-symbol ((,class (:foreground ,fg-dim))))
   `(lsp-ui-peek-filename ((,class (:foreground ,type :weight bold))))
   `(lsp-ui-peek-header ((,class (:background ,bg2 :foreground ,fg-default))))
   `(lsp-ui-peek-footer ((,class (:background ,bg2 :foreground ,fg-default))))
   `(lsp-ui-peek-selection ((,class (:background ,selection-bg))))
   `(lsp-ui-peek-list ((,class (:background ,bg1))))
   `(lsp-ui-peek-peek ((,class (:background ,bg1))))
   `(lsp-ui-peek-highlight ((,class (:foreground ,highlight-code :weight bold))))

   ;; Flycheck modeline
   `(flycheck-fringe-error ((,class (:foreground ,error))))
   `(flycheck-fringe-warning ((,class (:foreground ,warning-ui))))
   `(flycheck-fringe-info ((,class (:foreground ,type))))
   `(flycheck-error-list-error ((,class (:foreground ,error :weight bold))))
   `(flycheck-error-list-warning ((,class (:foreground ,warning-ui))))
   `(flycheck-error-list-info ((,class (:foreground ,type))))
   `(flycheck-error-list-line-number ((,class (:foreground ,fg-dim))))
   `(flycheck-error-list-column-number ((,class (:foreground ,fg-dim))))
   `(flycheck-error-list-id ((,class (:foreground ,builtin))))
   `(flycheck-error-list-id-with-explainer ((,class (:foreground ,builtin :underline nil))))
   `(flycheck-error-list-checker-name ((,class (:foreground ,comment))))
   `(flycheck-error-list-filename ((,class (:foreground ,string))))

   ;; Mode line indicators for LSP and Flycheck
   `(doom-modeline-lsp-error ((,class (:foreground ,error))))
   `(doom-modeline-lsp-warning ((,class (:foreground ,warning-ui))))
   `(doom-modeline-lsp-success ((,class (:foreground ,success))))
   `(doom-modeline-flycheck-error ((,class (:foreground ,error))))
   `(doom-modeline-flycheck-warning ((,class (:foreground ,warning-ui))))
   `(doom-modeline-flycheck-info ((,class (:foreground ,type))))

   ;; Eglot (alternative LSP client)
   `(eglot-mode-line ((,class (:foreground ,type :weight bold))))
   `(eglot-diagnostic-tag-unnecessary-face ((,class (:foreground ,fg-dim :strike-through t))))
   `(eglot-diagnostic-tag-deprecated-face ((,class (:foreground ,warning :strike-through t))))

    ;; IDO
   `(ido-first-match ((,class (:foreground ,keyword :weight bold))))
   `(ido-only-match ((,class (:foreground ,success :weight bold))))
   `(ido-subdir ((,class (:foreground ,type))))
   `(ido-virtual ((,class (:foreground ,comment))))
   `(ido-incomplete-regexp ((,class (:foreground ,error :weight bold))))
   `(ido-indicator ((,class (:foreground ,warning-ui :background ,bg2))))

   ;; Smex
   `(smex-leading-digits ((,class (:foreground ,constant))))

   ;; Treemacs
   `(treemacs-root-face ((,class (:inherit font-lock-string-face :weight bold :height 1.2))))
   `(treemacs-directory-face ((,class (:foreground ,fg-default))))
   `(treemacs-file-face ((,class (:foreground ,fg-default))))
   `(treemacs-tags-face ((,class (:foreground ,type))))
   `(treemacs-fringe-indicator-face ((,class (:foreground ,type))))
   `(treemacs-git-added-face ((,class (:foreground ,added))))
   `(treemacs-git-modified-face ((,class (:foreground ,constant))))
   `(treemacs-git-conflict-face ((,class (:foreground ,deleted))))
   `(treemacs-git-untracked-face ((,class (:inherit font-lock-doc-face))))
   `(treemacs-on-success-pulse-face ((,class (:foreground ,bg0 :background ,added :extend t))))
   `(treemacs-on-failure-pulse-face ((,class (:foreground ,bg0 :background ,deleted :extend t))))

   ;; Window dividers
   `(window-divider ((,class (:inherit vertical-border))))
   `(window-divider-first-pixel ((,class (:inherit window-divider))))
   `(window-divider-last-pixel ((,class (:inherit window-divider))))

   ;; Local preferences
   `(font-lock-variable-use-face ((,class (:foreground unspecified))))
   `(lsp-face-semhl-property ((,class (:foreground unspecified))))
   `(lsp-face-semhl-member ((,class (:foreground unspecified))))
   `(lsp-face-semhl-variable ((,class (:foreground unspecified))))
   `(lsp-face-semhl-parameter ((,class (:foreground unspecified))))
   `(lsp-face-semhl-macro ((,class (:foreground ,modifier))))
   `(lsp-rust-analyzer-mutable-modifier-face ((,class (:underline nil))))

   ;; Terminal
   `(term-color-black ((,class (:foreground ,bg0 :background ,bg0))))
   `(term-color-red ((,class (:foreground ,error :background ,error))))
   `(term-color-green ((,class (:foreground ,success :background ,success))))
   `(term-color-yellow ((,class (:foreground ,warning-ui :background ,warning-ui))))
   `(term-color-blue ((,class (:foreground ,type :background ,type))))
   `(term-color-magenta ((,class (:foreground ,constant :background ,constant))))
   `(term-color-cyan ((,class (:foreground ,builtin :background ,builtin))))
   `(term-color-white ((,class (:foreground ,fg-default :background ,fg-default))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'halogen)

;;; halogen-theme.el ends here
