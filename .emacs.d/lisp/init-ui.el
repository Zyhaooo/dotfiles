(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(column-number-mode 1)
(line-number-mode 1)
(size-indication-mode 1)

;; 字体缩放大小快捷键
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; display-line-numbers
(use-package display-line-numbers
  :hook
  (prog-mode . display-line-numbers-mode)
  (yaml-mode . display-line-numbers-mode)
  :custom
  (display-line-numbers-type 'relative))

;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Zyh`s Emacs !")
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-center-content t)
  (setq dashboard-items '((projects . 5)
			  (recents  . 5))))

;; diminish
(use-package diminish
  :ensure t
  :config
  (dolist (mode minor-mode-list)
    (when (symbolp mode)
      (diminish mode))))

;; breadcrumb
(use-package breadcrumb
  :ensure t
  :config
  (breadcrumb-mode 1)
  )

(cond
 ((eq system-type 'gnu/linux)
  ;; (when (member "Sarasa Mono SC" (font-family-list))
  ;;   (set-fontset-font t 'han (font-spec :family "Sarasa Mono SC" :height 110)))
  ;; (when (member "苹方-简" (font-family-list)) 
  ;;   (set-fontset-font t 'han (font-spec :family "苹方-简" :height 110)))
  (set-fontset-font t 'han (font-spec :family "苹方-简" :height 110))
  ;; (when (member "LXGW WenKai Mono" (font-family-list)) 
  ;;   (set-fontset-font t 'han (font-spec :family "LXGW WenKai Mono" :height 115)))
                                        ; (when (member "Iosevka" (font-family-list))
                                        ;   (set-face-attribute 'default nil :family "Iosevka" :height 150))
					; (when (member "JetBrainsMono Nerd Font Mono" (font-family-list))
					;   (set-face-attribute 'default nil :family "JetBrainsMono Nerd Font Mono"  :height 110))
  ;; (when (member "Fira Code" (font-family-list))
  ;;   (set-face-attribute 'default nil :family "Fira Code" :height 115))
  (when (member "Noto Color Emoji" (font-family-list))
    (set-fontset-font t 'emoji (font-spec :family "Noto Color Emoji") nil 'prepend))
  ))


(provide 'init-ui)
