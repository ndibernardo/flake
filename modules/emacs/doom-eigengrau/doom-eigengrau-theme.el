;;; doom-eigengrau.el -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Copyright (C) 2022 Jack Rusher
;;
;; Author: Jack Rusher <https://github.com/jackrusher>
;; Created: March 19, 2022
;; Version: 0.1.0
;; Keywords: custom themes, faces
;; Homepage: https://github.com/hlissner/emacs-doom-themes
;; Package-Requires: ((emacs "25.1") (cl-lib "0.5") (doom-themes "2.2.1"))
;;
;;; Commentary:
;;
;; Somewhat inspired by Noctilux and LightTable.
;; This is a personal customization of Jack Rusher's original theme.
;;
;;; Code:

(require 'doom-themes)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Variables

(defgroup doom-eigengrau-theme nil
  "Options for the `doom-eigengrau' theme."
  :group 'doom-themes)

(defcustom doom-eigengrau-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-eigengrau-theme
  :type 'boolean)

(defcustom doom-eigengrau-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-eigengrau-theme
  :type 'boolean)

(defcustom doom-eigengrau-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-eigengrau-theme
  :type '(choice integer boolean))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Theme definition

(def-doom-theme doom-eigengrau
  "A dark theme somewhat inspired by Noctilux and Light Table.
Personal customization of Jack Rusher's original doom-eigengrau."

  ;; name        default   256           16
  ((bg         '("#16161D" "black"       "black"        )) ; hex code for actual eigengrau
   (fg         '("#b2b2bb" "#c5c5c5"     "brightwhite"  ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#1c1c24" "black"       "black"        )) ; sidebar / inactive tab bg
   (fg-alt     '("#7A8490" "#7A8490"     "white"        )) ; punctuation / ui chrome

   ;; Spectrum from bg to fg.
   ;; base0 = bg, base8 = near-white. Values match eigengrau surface tones.
   (base0      '("#16161D" "black"       "black"        ))
   (base1      '("#1c1c24" "#1e1e1e"     "brightblack"  )) ; bg-alt / sidebar
   (base2      '("#1e1e27" "#2e2e2e"     "brightblack"  )) ; tab hover
   (base3      '("#22222c" "#262626"     "brightblack"  )) ; selection / bg-highlight
   (base4      '("#3a3a48" "#3f3f3f"     "brightblack"  )) ; line numbers
   (base5      '("#7A8490" "#525252"     "brightblack"  )) ; punctuation / grey
   (base6      '("#9ca0a4" "#6b6b6b"     "brightblack"  ))
   (base7      '("#c8c8c8" "#979797"     "brightblack"  )) ; active line number
   (base8      '("#e8e8e8" "#dfdfdf"     "white"        )) ; bright white

   (grey       base4)

   ;; Named colors – kept close to doom-eigengrau originals, with three updates:
   ;;   yellow  #aaccff  (was #86DAB1) – now the "type blue" from Noctilux
   ;;   cyan    #56d4de  (was #86D9DB) – namespace / import cyan
   ;;   numbers → red   (was orange)
   (red        '("#ff463b" "#ff463b" "red"          )) ; errors, numbers, macros
   (orange     '("#DADA86" "#DADA86" "brightred"    )) ; comments, warnings (warm yellow)
   (green      '("#86DA87" "#86DA87" "green"        )) ; keywords, operators
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  )) ; functions, methods
   (yellow     '("#aaccff" "#aaccff" "cyan"         )) ; types / classes (Noctilux type-blue)
   (blue       '("#86AEDA" "#86AEDA" "brightblue"   )) ; strings
   (dark-blue  '("#597492" "#597492" "blue"         ))
   (magenta    '("#DB85D9" "#DB85D9" "brightmagenta")) ; builtins / statements
   (violet     '("#B286DB" "#B286DB" "magenta"      )) ; constants
   (cyan       '("#56d4de" "#56d4de" "brightcyan"   )) ; namespaces / imports
   (dark-cyan  '("#64a2a4" "#64a2a4" "cyan"         )) ; optional brighter comments

   ;; Universal syntax classes (mandatory in every doom theme).
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      dark-blue)
   (builtin        magenta)                             ; #DB85D9
   (comments       (if doom-eigengrau-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-eigengrau-brighter-comments dark-cyan base5) 0.25))
   (constants      violet)                              ; #B286DB
   (functions      teal)                                ; #4db5bd
   (keywords       green)                               ; #86DA87
   (methods        teal)                                ; #4db5bd (aligned with functions)
   (operators      green)                               ; #86DA87
   (type           yellow)                              ; #aaccff (Noctilux type-blue)
   (strings        blue)                                ; #86AEDA
   (variables      teal)                                ; #4db5bd
   (numbers        red)                                 ; #ff463b (was orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)                                 ; #ff463b
   (warning        orange)                              ; #DADA86 (was yellow)
   (success        green)                               ; #86DA87
   (vc-modified    orange)                              ; #DADA86
   (vc-added       green)                               ; #86DA87
   (vc-deleted     red)                                 ; #ff463b

   ;; Extra modeline color variables.
   (modeline-fg              fg)
   (modeline-fg-alt          base5)                     ; #7A8490
   (modeline-bg              (if doom-eigengrau-brighter-modeline
                                 (doom-darken blue 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if doom-eigengrau-brighter-modeline
                                 (doom-darken blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-eigengrau-padded-modeline
      (if (integerp doom-eigengrau-padded-modeline) doom-eigengrau-padded-modeline 4))))

  ;;;; Base theme face overrides
  (((font-lock-variable-name-face &override) :slant 'normal)
   ((font-lock-doc-face &override) :slant 'italic)

   ((eval-sexp-fu-flash &override) :background "#0A414C" :foreground "#84FBFF")

   ;; Line numbers: dim (#3a3a48) / active (#c8c8c8) – matches Noctilux overrides
   ((line-number &override)              :foreground base4)
   ((line-number-current-line &override) :foreground base7)

   ((font-lock-comment-face &override)
    :background (if doom-eigengrau-brighter-comments (doom-lighten bg 0.05)))

   ;; Parens: grey delimiters (#7A8490), cyan highlight for match
   ((show-paren-match    &override) :foreground bg :background cyan :weight 'ultra-bold)
   ((show-paren-mismatch &override) :foreground nil :background "red")
   ((paren-face          &override) :foreground base5)   ; grey punctuation #7A8490
   ((paren-face-match    &override) :foreground cyan :background base3 :weight 'ultra-bold)

   ;; Subtle mode-line
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-eigengrau-brighter-modeline base8 highlight))

   ;;;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)        ; #DADA86
   (css-property             :foreground green)         ; #86DA87
   (css-selector             :foreground yellow)        ; #aaccff type-blue
   ;;;; doom-modeline
   (doom-modeline-bar                  :background (if doom-eigengrau-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-file          :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path          :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root  :foreground green :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background base2 :foreground base5)
   ;;;; ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;;;; markdown-mode
   (markdown-markup-face          :foreground base5)
   (markdown-header-face          :inherit 'bold :foreground yellow) ; type-blue headers
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; rjsx-mode
   (rjsx-tag  :foreground red)
   (rjsx-attr :foreground orange)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))

  ;;;; Base theme variable overrides
  ())

;;; doom-eigengrau-theme.el ends here

;; ((clojure-keyword &override) :foreground yellow)   ;; type-blue for keywords
;; ((clojure-braces &override) :foreground violet)
;; ((clojure-brackets &override) :foreground yellow)
;; ((clojure-special &override) :foreground blue)
;; ((clojure-java-call &override) :foreground violet)
