(use-package company
  :ensure t
  :diminish
  :hook (after-init . global-company-mode)
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
	      ("<tab>" . company-complete-common-or-cycle)
	      ("TAB" . company-complete-common-or-cycle))
  :config
  (advice-add 'company-detect-icons-margin :override #'company-text-icons-margin)
  :custom
  (company-idle-delay 0.1)
  (company-minimum-prefix-length 1)
  (company-show-numbers t)
  (company-tooltip-align-annotations t)
  (company-tooltip-limit 15)
  (company-dabbrev-downcase nil))

(use-package yasnippet
  :ensure t
  :diminish
  :config
  (yas-global-mode 1)
  (yas-minor-mode 1))

(use-package ido
  :ensure t
  :init
  ;; 启用全局模糊匹配（支持非连续字符）
  (setq ido-enable-flex-matching nil
        ido-use-virtual-buffers t    ; 显示最近关闭的虚拟缓冲区
        ido-auto-merge-work-directories-length -1) ; 无限级目录缓存
  
  (setq ido-case-fold nil)

  ;; 智能路径预测（参考网页7的路径缓存机制）
  (setq ido-use-filename-at-point 'guess
        ido-create-new-buffer 'prompt) ; 新建缓冲区需二次确认

  :config
  ;; 跨模式兼容（如Dired/Projectile）
  (ido-everywhere 1)
  (ido-mode 1))

;; ========== 垂直布局增强 ==========
(use-package ido-vertical-mode
  :ensure t
  :after ido
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-show-count t     ; 显示候选数量
        ido-vertical-define-keys 'C-n-C-p-up-down-left-right)) ; 全键盘导航

;; ========== 模糊算法升级 ==========
(use-package flx-ido
  :ensure t
  :after ido
  :config
  (flx-ido-mode 1))

;; ========== 命令补全扩展 ==========
(use-package smex                    ; M-x命令智能补全（网页5/6）
  :ensure t
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands))
  :config
  (setq smex-history-length 35
        smex-auto-update t))

;; ========== 跨项目文件检索 ==========
(use-package ido-completing-read+          ; 统一所有补全接口（网页8）
  :ensure t
  :after ido
  :config
  (ido-ubiquitous-mode 1))

;; ========== 智能缓存管理 ==========
(setq ido-file-extensions-order '(".org" ".py" ".el" ".js" "" t) ; 优先级扩展名
      ido-ignore-files '("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./")) ; 忽略版本控制文件

;; ========== 快捷键定制 ==========
(define-key ido-file-completion-map (kbd "C-j") 'ido-next-work-directory) ; 快速切换工作目录
(define-key ido-common-completion-map (kbd "M-DEL") 'ido-delete-backward-updir) ; 退格键返回上级目录

;; 使用 use-package 管理插件
(use-package fancy-compilation
  :ensure t
  :after compile
  :config
  ;; 启用 fancy-compilation 模式
  (fancy-compilation-mode 1)
  
  ;; 自定义编译窗口行为
  (setq fancy-compilation-override-existing t)     ; 覆盖已有的编译缓冲区
  (setq compilation-scroll-output t)
  )

(provide 'init-completion)
