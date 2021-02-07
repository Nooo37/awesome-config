;; Copied something, just changed colors 

(require 'doom-themes)


(defun xresources-theme-color (name)
  ;; "Read the color NAME (e.g. color5) from the X resources."
  ;; (interactive)
  (format "%s"
          (shell-command-to-string (format
                                    "xrdb -q | grep \"%s\" | awk '{print $2}' | tr -d \"\\n\""
                                    (concat name ":"))))
  )


;;
(defgroup doom-mine-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-mine-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-mine-theme
  :type 'boolean)

(defcustom doom-mine-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-mine-theme
  :type 'boolean)

(defcustom doom-mine-comment-bg doom-mine-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-mine-theme
  :type 'boolean)

(defcustom doom-mine-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-mine-theme
  :type '(choice integer boolean))

(eval-and-compile
  (defcustom doom-mine-region-highlight t
    "Determines the selection highlight style. Can be 'frost, 'snowstorm or t
(default)."
    :group 'doom-mine-theme
    :type 'symbol))

;;

(defvar xbg     (xresources-theme-color "background"))
(defvar xfg     (xresources-theme-color "foreground"))
(defvar xblack  (xresources-theme-color "color0"))
(defvar xgray   (xresources-theme-color "color8"))
(defvar xred    (xresources-theme-color "color1"))
(defvar xyellow (xresources-theme-color "color3"))
(defvar xgreen  (xresources-theme-color "color2"))
(defvar xcyan   (xresources-theme-color "color6"))
(defvar xblue   (xresources-theme-color "color4"))
(defvar xpurple (xresources-theme-color "color5"))

(message "Gute Wahl")


(def-doom-theme doom-mine
  "A dark theme inspired by mine."

  ;; name        default   256       16
  ((bg         `(,xbg      nil       nil            ))
   (bg-alt     `(,xblack   nil       nil            ))
   (base0      `(,xblack   "black"   "black"        ))
   (base1      `(,xblack   "#1e1e1e" "brightblack"  ))
   (base2      `(,xgray    "#2e2e2e" "brightblack"  ))
   (base3      `(,xgray    "#262626" "brightblack"  ))
   (base4      `(,xgray    "#3f3f3f" "brightblack"  ))
   (base5      `(,xgray    "#525252" "brightblack"  ))
   (base6      `(,xgray    "#6b6b6b" "brightblack"  ))
   (base7      `(,xgray    "#979797" "brightblack"  ))
   (base8      `(,xgray    "#dfdfdf" "white"        ))
   (fg         `(,xfg      "#ECECEC" "white"        ))
   (fg-alt     `(,xfg      "#bfbfbf" "brightwhite"  ))

   (grey       base4)
   (red        `(,xred    "#ff6655" "red"          )) ;; mine11
   (orange     `(,xyellow "#dd8844" "brightred"    )) ;; mine12
   (green      `(,xgreen  "#99bb66" "green"        )) ;; mine14
   (teal       `(,xcyan   "#44b9b1" "brightgreen"  )) ;; mine7
   (yellow     `(,xyellow "#ECBE7B" "yellow"       )) ;; mine13
   (blue       `(,xblue   "#51afef" "brightblue"   )) ;; mine9
   (dark-blue  `(,xblue   "#2257A0" "blue"         )) ;; mine10
   (magenta    `(,xpurple "#c678dd" "magenta"      )) ;; mine15
   (violet     `(,xpurple "#a9a1e1" "brightmagenta")) ;; ??
   (cyan       `(,xcyan   "#46D9FF" "brightcyan"   )) ;; mine8
   (dark-cyan  `(,xcyan   "#5699AF" "cyan"         )) ;; ??

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.2))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-mine-brighter-comments dark-cyan (doom-lighten base5 0.2)))
   (doc-comments   (doom-lighten (if doom-mine-brighter-comments dark-cyan base5) 0.25))
   (constants      blue)
   (functions      teal)
   (keywords       blue)
   (methods        teal)
   (operators      blue)
   (type           teal)
   (strings        green)
   (variables      base7)
   (numbers        magenta)
   (region         (pcase doom-mine-region-highlight
                     (`frost teal)
                     (`snowstorm base7)
                     (_ base4)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-mine-brighter-modeline)
   (-modeline-pad
    (when doom-mine-padded-modeline
      (if (integerp doom-mine-padded-modeline) doom-mine-padded-modeline 4)))

   (region-fg
    (when (memq doom-mine-region-highlight '(frost snowstorm)) bg))

   (modeline-fg     nil)
   (modeline-fg-alt base6)

   (modeline-bg base0)
   ;; (if -modeline-bright
   ;;     (doom-blend bg base5 0.2)
   ;;   base1))
   (modeline-bg-l
    (if -modeline-bright
        (doom-blend bg base5 0.2)
      `(,(doom-darken (car bg) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive base0) ;;  (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  (((region &override) :foreground region-fg)

   ((line-number &override) :foreground (doom-lighten 'base5 0.2) :background base0)
   ((line-number-current-line &override) :foreground base7)
   ((paren-face-match &override) :foreground red :background base3 :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground base3 :background red :weight 'ultra-bold)
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background base3 :weight 'light)
   ((vimish-fold-fringe &override)  :foreground teal)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-mine-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (doom-modeline-project-root-dir :foreground base6)
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; ediff
   (ediff-fine-diff-A    :background (doom-darken violet 0.4) :weight 'bold)
   (ediff-current-diff-A :background (doom-darken base0 0.25))

   ;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ()
  )

