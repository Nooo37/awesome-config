;; utils.el
;;
;;; Code:
(require 'straight)
;; (require 'colors)

;;; PACKAGES

;; -- Elescope search and clone Git repos directly within Emacs
(use-package elescope
  :config
  (setf elescope-root-folder (concat (getenv "$HOME") "/home/jimmy"))
  (setf elescope-clone-depth nil
        elescope-use-full-path t))

;; -- Good to have packages
(use-package transient)
(use-package posframe)

(use-package which-key                            ; It is useful to know `which-key' to use
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.25)
  (which-key-mode +1))

;; -- Flycheck -- unused for now :(
(use-package flycheck
  :hook (after-init . global-flycheck-mode)
  ;; :config
  ;; (custom-set-faces
   ;; '(flycheck-error        ((t (:underline (:color "#B4637A" :style wave)))))
   ;; '(flycheck-info         ((t (:underline (:color "#286983" :style wave)))))
   ;; '(flycheck-info-face    ((t (:underline (:color "#286983" :style wave)))))
   ;; '(flycheck-warning      ((t (:underline (:color "#ea9d34" :style wave)))))
   ;; '(flycheck-warning-face ((t (:underline (:color "#ea9d34" :style wave))))))
  :custom
  (flycheck-check-syntax-automatically '(save mode-enabled)))

;; -- Visuals (colors)
(straight-use-package                             ; Handy `color-tools' by `nee' ~
 '(ct
   :host github
   :repo "neeasade/ct.el"
   :branch "master"))

(use-package dash)                                ; Dependencies of `color-tools'
(use-package dash-functional)
(use-package hsluv)

(use-package rainbow-mode)                        ; More colors!

(use-package rainbow-delimiters                   ; `Elegant' weapons for a more civilized age
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package git-gutter)
  ; :hook (prog-mode . git-gutter-mode))

;; Autocomplete parens ()
(use-package parinfer
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults        ; should be included.
             pretty-parens  ; different paren styles for different modes.
             smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
             smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))

;; -- `Counsel' the joy of doing fuzzy search

(setq ivy-height 8)                               ; `Ivy' !!!
(setq ivy-count-format "")
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-initial-inputs-alist: '((counsel-minor .            "^+")
                                  (counsel-package .          "^+")
                                  (counsel-org-capture .      "^")
                                  (counsel-M-x .              "^")
                                  (counsel-describe-symbol .  "^")
                                  (org-refile .               "")
                                  (org-agenda-refile .        "")
                                  (org-capture-refile .       "")
                                  (Man-completion-table .     "^")
                                  (woman .                    "^")))

(use-package counsel
   :config
   (ivy-mode)
         (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
         (setq ivy-initial-inputs-alist nil)
         (counsel-mode 1)
   :bind
   ("C-f" . swiper)
   ("C-s" . save-buffer)
   ("M-x" . counsel-M-x)
   ("C-c r" . counsel-recentf)
   ("C-c b" . counsel-bookmark)
   ("C-x C-b" . counsel-switch-buffer)
   ("C-c c" . counsel-org-capture))


(use-package flx)                                 ; Does fancy fuzzy matching with good sorting

(use-package magit                                ; magit gud
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; -- Screenshot - swiftly grab pretty images of your code
(straight-use-package
 '(screenshot
  :host github
  :repo "tecosaur/screenshot"
  :branch "master"))

(use-package transient)
(use-package posframe)

(use-package highlight-indent-guides
    :hook (prog-mode . highlight-indent-guides))

(setq highlight-indent-guides-method 'character)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)


(provide 'utils)