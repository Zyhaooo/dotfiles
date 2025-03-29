(use-package undo-tree
  :ensure t
  :diminish t
  :init
  (global-undo-tree-mode)
  :config
  (setq undo-tree-auto-save-history nil)
  (setq undo-tree-visualizer-timestamps t)
  (add-to-list 'display-buffer-alist
             '("\\*undo-tree\\*"
               (display-buffer-in-side-window)
               (side . right)   ;; 在右侧显示
               (window-width . 20))) ;; 宽度设置为 20 列

  :bind
  (("C-x u" . undo-tree-visualize)))

(defun my-expand-region-down ()
  "Expand selection downward by moving point down."
  (interactive)
  (unless (region-active-p)
    (set-mark-command nil)) ;; 激活区域
  (next-line)) ;; 向下移动光标

(defun my-expand-region-up ()
  "Expand selection upward by moving point up."
  (interactive)
  (unless (region-active-p)
    (set-mark-command nil)) ;; 激活区域
  (previous-line)) ;; 向上移动光标

(global-set-key (kbd "M-n") 'my-expand-region-down)
(global-set-key (kbd "M-p") 'my-expand-region-up)

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper) ;; 使用 `swiper` 进行增量搜索
         ("C-r" . swiper-isearch-backward) ;; 向后搜索
         )
  :custom
  (swiper-action-recenter t) ;; 搜索后重新居中显示
  (swiper-include-line-number-in-search t) ;; 包含行号进行搜索
  (swiper-multi-match-face 'swiper-match-face-2) ;; 设置多匹配时的高亮样式
  )

(use-package ibuffer                              ;; ibuffer(内置)
  :bind (("C-x C-b" . ibuffer))
  :config
  (use-package ibuffer-projectile                 ;; 使ibuffer可以根据projectile分类
    :ensure t
    :config
    (add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-projectile-set-filter-groups)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic))))))

(use-package avy
  :ensure t                                         ;; 确保安装 avy 包
  :bind
  (("C-c '" . avy-goto-char-2)                      ;; 绑定 C-' 到 avy-goto-char-2
   ("C-c \"" . avy-goto-char)                       ;; 绑定 C-" 到 avy-goto-char
   ("M-g e" . avy-goto-word-0))                     ;; 绑定 M-g e 到 avy-goto-word-0
  )

(setq-default winum-keymap
	          (let ((map (make-sparse-keymap)))
	            (define-key map (kbd "C-`") 'winum-select-window-by-number)
	            (define-key map (kbd "C-²") 'winum-select-window-by-number)
	            (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
	            (define-key map (kbd "M-1") 'winum-select-window-1)
	            (define-key map (kbd "M-2") 'winum-select-window-2)
	            (define-key map (kbd "M-3") 'winum-select-window-3)
	            (define-key map (kbd "M-4") 'winum-select-window-4)
	            (define-key map (kbd "M-5") 'winum-select-window-5)
	            (define-key map (kbd "M-6") 'winum-select-window-6)
	            (define-key map (kbd "M-7") 'winum-select-window-7)
	            (define-key map (kbd "M-8") 'winum-select-window-8)
	            map))


(use-package winum
  :ensure t
  :config
  (winum-mode))

(use-package neotree
  :ensure t
  :defer t ;; 延迟加载以提高启动速度
  :init
  (global-set-key [f8] 'neotree-toggle)
  :config
  (setq neo-smart-open t) ;; 启用智能打开

  (use-package projectile
    :ensure t
    :config
    (setq projectile-switch-project-action 'neotree-projectile-action))
  )



(provide 'init-editing)
