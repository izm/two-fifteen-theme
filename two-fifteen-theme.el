;;; two-fifteen-theme.el --- Dark Emacs theme with low saturation pastel colours -*- lexical-binding: t -*-

;; Copyright (C) 2025 Steven Brown

;; Author: Steven Brown
;; URL: https://github.com/izm/two-fifteen-theme

;;; Commentary:
;; 
;; Faces are initially defined in a list `two-fifteen-simple-faces' of the the
;; form, (FACE-NAME (ATTS)):
;;      (error   (:foreground ,fg-error))
;; 
;; The complete form required is then built before calling
;; `custom-theme-set-faces', `(FACE-NAME ((,class (ATTS))):
;;      `(error ((,class (:foreground ,fg-error))))

;;; Minimal Theme Reference:
;; 
;; (custom-theme-set-faces
;;  'minimal-theme-name
;;  '(default
;;     (( ((class color) (min-colors 89))
;;        (:foreground "white") )) )
;;  '(error
;;    (( ((class color) (min-colors 89))
;;       (:foreground "red") )) )
;;  )

;;; Code:

(deftheme two-fifteen
  "Dark theme with low saturation pastel colours."
  :background-mode 'dark
  :kind 'color-scheme
  :family 'two-fifteen
  )

(custom-theme-set-variables
 'two-fifteen
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(ansi-color-names-vector ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "grey50"]))

;; -----------------------------------------------------------------------

(let* (
       ;; theme palette
       (fg1     "white")                ;#f8f8f2 -dracula
       (fg2     "LightSkyBlue2")
       (fg3     "PaleTurquoise1")
       (fg4     "thistle2")

       (fg-code "LightSkyBlue2")        ;lavender
       (fg-link "turquoise1")
       (fg-string "plum1")

       (fg-success "green")
       (fg-warning "orange")
       (fg-error   "red")

       (bg1     "grey20")                  ;#282a36 -dracula
       (bg-code "grey18")                  ;grey27

       ;; scratch palette
       ;; thistle2 plum1 pink lavender burlywood light salmon PaleGreen2 chocolate1 LightSteelBlue
       ;; turquoise1 turquoise2 turquoise3 turquoise4 PaleTurquoise1 PaleTurquoise3
       ;;

       (two-fifteen-simple-faces
       `(
         (default (:foreground ,fg1 :background ,bg1))
         (error   (:foreground ,fg-error))
         (warning (:foreground ,fg-warning))
         (success (:foreground ,fg-success))

         (bold        (:weight bold))
         (bold-italic (:slant italic :weight bold))
         (italic      (:slant italic))
         (cursor      (:background "deep sky blue"))
         (menu        (:foreground ,fg1 :background ,bg1))

         (fringe  (:foreground "#4C9ED9" :background unspecified))
         (minibuffer-prompt   (:weight bold :foreground "turquoise" :background ,bg1))

         ;; Highlighting
         (highlight           (:foreground unspecified :background "DodgerBlue3"))
         (region              (:background "DodgerBlue4"))
         (secondary-selection (:weight bold :background "RoyalBlue4")) ;Org-mode sparse trees
         (hl-line  (:background "grey33" :underline nil)) ; (global-)hl-line-mode
         (hl-line-face  (:background "grey33"))

         (isearch             (:inherit highlight :weight bold :underline ,fg-link))
         (isearch-fail        (:weight bold :foreground  "light salmon"))
         (lazy-highlight      (:inherit region))
         (trailing-whitespace (:background "light yellow"))
         (query-replace       (:inherit isearch))

         (ivy-highlight-face  (:weight bold))
         ;; (ivy-match-required-face      ())
         (ivy-current-match      (:inherit region))
         ;(ivy-prompt-match ())          ; highlighting selected prompt line
         ;; (ivy-minibuffer-match-face-1 (:inherit isearch-fail)) ; background for ivy minibuffer matches
         (ivy-minibuffer-match-face-1 (:foreground "turquoise" :underline "turquoise4"))
         (ivy-minibuffer-match-face-2 (:foreground "salmon" :underline "turquoise4"))
         (ivy-minibuffer-match-face-3 (:foreground "burlywood"))
         (ivy-minibuffer-match-face-4 (:foreground "light salmon"))
         ;; (ivy-minibuffer-match-highlight ())
         ;; (ivy-rich())

         (swiper-match-face-1 (:inherit ivy-minibuffer-match-face-1))       ;lazy highlight
         (swiper-match-face-2 (:inherit ivy-minibuffer-match-face-2))       ;isearch
         (swiper-match-face-3 (:inherit ivy-minibuffer-match-face-3))       ;match
         (swiper-match-face-4 (:inherit ivy-minibuffer-match-face-4))       ;isearch-fail
         ;; (swiper-background-match-face-1 ()) ;swiper-match-face-1
         ;; (swiper-background-match-face-2 ()) ;swiper-match-face-2
         ;; (swiper-background-match-face-3 ()) ;swiper-match-face-3
         ;; (swiper-background-match-face-4 ()) ;swiper-match-face-4

         (mode-line           (:overline "grey33" :underline ,fg1 :foreground ,fg-link :background "grey15"))
         (mode-line-inactive  (:overline "grey33" :underline "grey33" :foreground "grey80" :background "grey15"))
         (mode-line-buffer-id (:weight bold :foreground "white"))
         (mode-line-emphasis  (:weight bold :foreground "white"))
         (mode-line-highlight (:foreground "yellow"))

         (vertical-border            (:foreground "grey33")) ; non window-divider-mode
         (window-divider             (:foreground "grey33")) ; window-divider-mode
         (window-divider-first-pixel (:foreground ,bg1))
         (window-divider-last-pixel  (:foreground ,bg1))



         (escape-glyph  (:foreground ,fg-warning))


         (font-lock-bold-face                 (:weight bold :inherit font-lock-default-face))
         (font-lock-italic-face               (:slant italic :inherit font-lock-default-face))
         (font-lock-builtin-face              (:foreground "deep sky blue"))
         (font-lock-comment-delimiter-face    (:foreground "grey54"))
         (font-lock-comment-face              (:slant italic :foreground "grey54"))
         (font-lock-constant-face             (:foreground "DarkOrange1"))
         (font-lock-doc-face                  (:foreground "peach puff"))
         (font-lock-function-name-face        (:weight bold :foreground "lemon chiffon"))
         (font-lock-keyword-face              (:bold nil :foreground "deep sky blue"))
         (font-lock-preprocessor-face         (:foreground "grey54"))
         (font-lock-regexp-grouping-backslash (:weight bold :inherit nil))
         (font-lock-regexp-grouping-construct (:weight bold :inherit nil))
         (font-lock-string-face               (:foreground ,fg-string))
         (font-lock-type-face                 (:weight bold :foreground ,fg3))
         (font-lock-variable-name-face        (:weight normal :foreground ,fg-link))
         (font-lock-warning-face              (:weight bold :foreground ,fg-warning))

         (link  (:weight normal :underline t :foreground ,fg-link))
         (link-visited  (:inherit link :foreground "salmon"))
         (button (:inherit link))

         (header-line  (:weight bold :underline ,fg-link :overline ,fg-link
                                :foreground ,fg1 :background "dark slate grey"))

         (message-header-name       (:family "Sans Serif" :weight normal :foreground "grey60"))
         (message-header-cc         (:inherit message-header-to))
         (message-header-other      (:family "Sans Serif" :slant normal :foreground ,fg1))
         (message-header-subject    (:family "Sans Serif" :foreground ,fg-link))
         (message-header-to         (:family "Sans Serif" :underline nil :foreground ,fg1))
         (message-cited-text        (:foreground "#5050B0" :background "grey96"))
         (message-separator         (:family "Sans Serif" :weight normal :foreground ,fg1 :background "dark slate grey"))
         (message-header-newsgroups (:family "Sans Serif" :foreground "#3399CC"))
         (message-header-xheader    (:family "Sans Serif" :slant normal :foreground "grey40"))
         (message-mml               (:foreground "forest green"))

         (diff-added             (:foreground "#CCEECC" :background "#336633"))
         (diff-changed           (:foreground "#DDDDFF" :background "#8080FF"))
         (diff-context           (:foreground "grey70"))
         (diff-file-header       (:foreground ,fg1 :background "grey10"))
         (diff-function          (:foreground "darkgrey"))
         (diff-header            (:foreground "DodgerBlue" :background "grey10"))
         (diff-hl-change         (:inherit diff-changed))
         (diff-hunk-header       (:foreground ,fg-link :background unspecified))
         (diff-index             (:foreground "#800000" :background "#FFFFAF"))
         (diff-indicator-added   (:foreground "#CCEECC" :background "#336633"))
         (diff-indicator-changed (:background "#8080FF"))
         (diff-indicator-removed (:foreground "#EECCCC" :background "#663333"))
         (diff-refine-added      (:foreground "yellow"))
         (diff-refine-changed    (:background "#DDDDFF"))
         (diff-refine-removed    (:foreground "yellow"))
         (diff-removed           (:foreground "#EECCCC" :background "#663333"))

         (ediff-current-diff-A   (:background "#553333"))
         (ediff-current-diff-B   (:background "#335533"))
         (ediff-fine-diff-A      (:background nil :underline "#aa2222"))
         (ediff-fine-diff-B      (:background nil :underline "#22aa22"))
         (ediff-odd-diff-A       (:background "grey5"))
         (ediff-odd-diff-B       (:background "grey15"))
         (ediff-even-diff-A      (:background "grey15"))
         (ediff-even-diff-B      (:background "grey5"))

         (calendar-month-header   (:foreground "grey54" :background unspecified :weight medium :underline nil))
         (calendar-today          (:weight bold :box (:line-width 1 :style released-button)))
         (calendar-weekday-header (:forground ,fg1 :weight bold :underline "grey35"))
         (calendar-weekend-header (:foreground "burlywood" :weight bold :underline "grey35")); (:inherit org-agenda-date :foreground "burlywood")))
         (holiday                 (:foreground "burlywood"))
         (diary                   (:weight normal :foreground "lemon chiffon" :background "grey10"))
         (diary-anniversary       (:weight normal :foreground "deep sky blue" :background "grey20"))

         (comint-highlight-input     (:weight bold :foreground "light sea green" :inherit nil))
         (comint-highlight-prompt    (:weight bold :foreground "sea green" :inherit nil))

         (company-tooltip            (:background "#031A25"))
         (company-scrollbar-bg       (:inherit secondary-selection))
         (company-scrollbar-fg       (:inherit highlight))
         (company-tooltip-common     (:foreground "lemon chiffon" :weight bold))
         (company-tooltip-mouse      (:background "midnight blue"))
         (company-tooltip-selection  (:background "dark slate blue"))
         (company-tooltip-annotation (:foreground "orange"))

         (compilation-error          (:weight bold :foreground "red"))
         (compilation-info           (:weight bold :foreground "turquoise"))
         (compilation-warning        (:weight bold :foreground "orange"))
         (compilation-line-number    (:weight normal :foreground "orange"))
         (compilation-column-number  (:weight normal :foreground "orange"))
         (compilation-mode-line-exit (:weight bold :foreground "green"))
         (compilation-mode-line-fail (:weight bold :foreground "violet"))
         (compilation-mode-line-run  (:weight bold :foreground "orange"))

         (custom-button                  (:box (:line-width 2 :style released-button)
                                               :foreground "black" :background "grey80"))
         (custom-button-mouse            (:box (:line-width 2 :style released-button)
                                               :foreground "black" :background "grey90"))
         (custom-button-pressed          (:box (:line-width 2 :style pressed-button)
                                               :foreground "black" :background "grey60"))
         (custom-button-pressed-unraised (:underline t :foreground "magenta4"))
         (custom-button-unraised         (:underline t))
         (custom-changed                 (:foreground "white" :background "blue"))
         (custom-comment                 (:background "grey85"))
         (custom-comment-tag             (:foreground "blue4"))
         (custom-documentation           (nil))
         (custom-face-tag                (:height 1.2 :weight bold))
         (custom-group-tag               (:height 1.2 :weight bold :foreground ,fg1))
         (custom-variable-obsolete       (:inherit font-lock-comment-face :height 1.2 :weight bold))
         (custom-variable-tag            (:height 1.2 :weight bold :foreground ,fg1))
         (custom-group-tag-1             (:height 1.2 :weight bold :foreground "red"))
         (custom-invalid                 (:foreground "yellow" :background "red"))
         (custom-link                    (:underline t :foreground ,fg-link))
         (custom-modified                (:foreground ,fg1 :background "blue"))
         (custom-rogue                   (:foreground "pink" :background "black"))
         (custom-saved                   (:underline t))
         (custom-set                     (:foreground "blue" :background "white"))
         (custom-state                   (:foreground "violet"))
         (custom-themed                  (:foreground ,fg1 :background "blue1"))
         (custom-variable-button         (:weight bold :underline t))
         (custom-visibility              (:weight normal :underline t :foreground ,fg-link))

         (dired-directory (:foreground ,fg-link))
         (dired-header    (:weight bold :foreground ,fg-link :underline nil :height 1.3))
         (dired-ignored   (:strike-through t :foreground "red"))
         (dired-mark      (:inherit warning))
         (dired-marked    (:inherit warning))
         (dired-symlink   (:foreground "#1F8DD6"))

         (eldoc-highlight-function-argument (:weight bold :foreground "red" :background "#FFE4FF"))

         (eww-valid-certificate (:foreground ,fg-success))
         (eww-invalid-certificate (:foreground ,fg-error))

         (file-name-shadow (:foreground "grey50"))

         (help-argument-name (:foreground "grey50"))

         (info-title-1  (:height 1.3 :weight bold :overline nil :foreground ,fg1 :background "grey24" :underline t))
         (info-title-2  (:height 1.2 :weight bold :overline nil :foreground ,fg2 :background unspecified))
         (info-title-3  (:height 1.1 :weight bold :foreground ,fg3 :background unspecified))
         (info-title-4  (:height 1.0 :weight bold :slant normal :foreground ,fg4))

         (info-header-node  (:underline t :foreground "orange"))
         (info-header-xref  (:underline t :foreground "turquoise"))
         (info-index-match  (:weight bold :foreground "black" :background "orange"))
         (info-menu-header  (:height 1.0 :weight bold :underline nil :overline nil :foreground ,fg-link :background unspecified))
         (info-menu-star    (:foreground "turquoise" :background unspecified))
         (info-node         (:underline t :foreground "blue"))
         (info-xref         (:underline t :foreground "turquoise"))
         (info-xref-visited (:underline t :foreground "turquoise4"))

         (match         (:weight bold :foreground "black" :background "orange"))
         (next-error    (:height 1.1 :underline nil :foreground ,fg1 :background "#9E3699"))
         (nobreak-space (:background unspecified)) ;"#CCE8F6"

         (org-agenda-calendar-event   (:weight bold :foreground "pink" :background "grey20"))
         (org-agenda-calendar-sexp    (:foreground "DodgerBlue3" :background "grey96"))
         (org-agenda-clocking         (:foreground unspecified :background "black"))
         (org-agenda-column-dateline  (:height 1.0 :weight normal :slant normal :underline nil :strike-through nil :foreground "#E6AD4F" :background "#FFF2DE"))
         (org-agenda-current-time     (:underline t :foreground ,fg1))
         (org-agenda-date             (:inherit org-level-1 :weight normal :background unspecified))
         (org-agenda-date-today       (:inherit org-agenda-date :weight bold :underline t))
         (org-agenda-date-weekend     (:inherit org-agenda-date :foreground "burlywood"))
         ;;         (org-agenda-diary            (:weight bold :foreground "green4" :background "light blue"))
         (org-agenda-diary            (:inherit org-agenda-calendar-event))
         (org-agenda-dimmed-todo-face (:foreground "gold2"))
         (org-agenda-done             (:inherit font-lock-comment-face))
         (org-agenda-filter-category  (:weight bold :foreground "orange"))
         (org-agenda-filter-tags      (:weight bold :foreground "orange"))
         (org-agenda-restriction-lock (:background "salmon"))
         (org-agenda-structure        (:inherit org-document-title))

         (org-archived                (:foreground "grey70"))
         (org-block                   (:inherit fixed-pitch :foreground "lemon chiffon" :background ,bg-code))
         (org-block-begin-line        (:inherit fixed-pitch :underline nil :foreground ,fg-code :overline nil :background ,bg-code))
         (org-block-end-line          (:inherit fixed-pitch :overline nil :foreground ,fg-code :underline nil :background ,bg-code))
         (org-checkbox                (:inherit fixed-pitch :weight medium :foreground ,fg-code :background ,bg-code))
         (org-clock-overlay           (:foreground ,fg1 :background "SkyBlue4" :height 1))
         (org-code                    (:inherit fixed-pitch :foreground ,fg-code :background ,bg-code))
         (org-column                  (:inherit default)) ; 2021-10-01: Prevent column mode from changing height
         (org-column-title            (:height 1.0 :weight bold :slant normal)) ; see header-line
         (org-date                    (:underline t :foreground ,fg-code))
         (org-date-selected           (:inverse-video t))
         (org-default                 (:foreground ,fg1 :background ,bg1))
         (org-document-info           (:foreground "burlywood"))
         (org-document-info-keyword   (:inherit fixed-pitch :foreground ,fg1 ))
         (org-document-title          (:foreground ,fg1 :weight bold :height 1.8))
         (org-done                    (:weight bold :foreground "grey73"))
         (org-drawer                  (:foreground "light sky blue"))
         (org-ellipsis                (:underline nil :foreground "grey60"))
         (org-footnote                (:underline t :foreground "DeepSkyBlue3"))
         (org-formula                 (:foreground "orange"))
         (org-headline-done           (:height 1.0 :weight normal :strike-through nil :foreground "grey"))
         (org-hide                    (:foreground ,bg1))
         (org-latex-and-related       (:foreground "SkyBlue4" :background ,fg1))
         (org-level-1                 (:foreground ,fg1 :background unspecified :weight bold :height 1.3 :underline "grey35"))
         (org-level-2                 (:foreground ,fg2 :background unspecified :weight medium :height 1.2 :underline nil))
         (org-level-3                 (:foreground ,fg3 :overline nil :weight bold :height 1.1))
         (org-level-4                 (:foreground ,fg4 :height 1.1 :weight bold :slant normal))
         (org-level-5                 (:foreground ,fg1 :height 1.0 :weight bold :slant normal))
         (org-level-6                 (:foreground ,fg2 :height 1.0 :weight bold :slant italic))
         (org-level-7                 (:foreground ,fg3 :height 1.0 :weight bold :slant italic))
         (org-level-8                 (:foreground ,fg4 :height 1.0 :weight bold :slant italic))
         (org-link                    (:weight normal :underline t :foreground ,fg-link))
         (org-list-dt                 (:weight normal :foreground ,fg-code))
         (org-macro                   (:weight bold :foreground "orange"))
         (org-meta-line               (:inherit fixed-pitch :slant normal :foreground "grey" :background unspecified))
         (org-mode-line-clock         (:foreground "orange" ))
         (org-mode-line-clock-overrun (:weight bold :foreground ,fg1 :background "red"))
         (org-property-value          (:foreground "#00A000"))
         (org-quote                   (:inherit org-block :slant italic))
         (org-scheduled               (:foreground "lemon chiffon"))
         (org-scheduled-previously    (:foreground "light salmon"))
         (org-scheduled-today         (:weight bold :foreground "lemon chiffon"))
         (org-sexp-date               (:foreground "DodgerBlue3"))
         (org-special-keyword         (:foreground "grey" :background unspecified))
         (org-table                   (:inherit fixed-pitch :foreground ,fg-code :background ,bg-code))
         (org-tag                     (:weight normal :slant italic :foreground "grey"))
         (org-target                  (:foreground "#FF6DAF"))
         (org-time-grid               (:foreground "grey"))
         (org-todo                    (:weight bold :foreground "light salmon"))
         (org-upcoming-deadline       (:foreground "red"))
         (org-verbatim                (:inherit fixed-pitch :foreground "grey"))
         (org-verse                   (:inherit org-quote))
         (org-warning                 (:weight bold :foreground ,fg-warning :background "grey20"))

         (outline-1 (:inherit org-level-1))
         (outline-2 (:inherit org-level-2))
         (outline-3 (:inherit org-level-3))
         (outline-4 (:inherit org-level-4))
         (outline-5 (:inherit org-level-5))
         (outline-6 (:inherit org-level-6))
         (outline-7 (:inherit org-level-7))
         (outline-8 (:inherit org-level-8))

         (shadow              (:foreground "grey50"))
         (show-paren-match    (:weight bold :foreground "yellow" :underline "yellow"))
         (show-paren-mismatch (:weight bold :underline "red" :foreground "red"))
         (term                (:foreground ,bg1 :background ,fg1))

         (speedbar-button-face    (:foreground "green4"))
         (speedbar-directory-face (:foreground "turquoise"))
         (speedbar-file-face      (:foreground ,fg1))
         (speedbar-highlight-face (:underline nil :foreground ,fg1 :background "DodgerBlue3"))
         (speedbar-selected-face  (:underline t :foreground "red"))
         (speedbar-tag-face       (:foreground ,fg2))
         (speedbar-separator-face (:foreground ,fg1 :background "blue"))
         ;; TODO: not sure how to remove the image before the "Active Buffers" and "Scratch Buffers" spearators

         ;; tab-bar and tab-line mode
         (tab-bar               (:underline nil :foreground ,fg2 :background "grey15"))
         (tab-bar-tab           (:underline nil :box (:line-width 3 :color "grey15" :style nil) :inherit tab-bar))
         (tab-bar-tab-inactive  (:underline nil :box (:line-width 3 :color "grey15" :style nil) :inherit font-lock-comment-face))
         ;; No tab-bar-highlight face
         (tab-line              (:inherit tab-bar))
         (tab-line-tab          (:inherit tab-bar-tab))
         (tab-line-tab-current  (:inherit tab-bar-tab))
         (tab-line-tab-inactive (:inherit tab-bar-tab-inactive))
         (tab-line-highlight    (:inherit tab-line-tab)) ;default is to inherit trab-line-tab
         
         (tool-bar (:box (:line-width 1 :style released-button) :foreground "black" :background "grey75"))
         (tooltip  (:foreground "grey80" :background "#031A25"))

         (widget-button            (:weight normal :underline t :foreground "DodgerBlue3"))
         (widget-button-pressed    (:foreground "red"))
         (widget-documentation     (:foreground "green4"))
         (widget-field             (:foreground "blue" :background "grey85"));:foreground ,fg-code :background ,bg-code)) ;;
         (widget-inactive          (:foreground "dim grey"))
         (widget-single-line-field (:background "grey85"))
         ))
       ;; end two-fifteen-simple-faces
       (class '((class color) (min-colors 89))) ; (background dark) investigate for future light variant
       (built-faces '())
       )

  ;; build built-faces
  (while two-fifteen-simple-faces
    (let*
        ((simple-face (car two-fifteen-simple-faces))
         (fname (car simple-face))
         (fattrs (cadr simple-face)))
      (setq two-fifteen-simple-faces (cdr two-fifteen-simple-faces))
      (setq built-faces (append
                         built-faces
                         `((,fname ((,class ,fattrs))))))

      ))

  ;; pass built-faces to custom-theme-set-faces via apply
  (apply #'custom-theme-set-faces 'two-fifteen
         built-faces)
  )


(provide-theme 'two-fifteen)
