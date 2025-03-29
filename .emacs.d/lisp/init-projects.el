;; project
(use-package projectile
  :ensure t
  :config
  (setq projectile-enable-caching t)
  (setq projectile-auto-discover t)
  (setq projectile-indexing-method 'hybrid)
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-project-root-files
        '(".git" ".projectile" "Makefile" "package.json" "go.mod" "Cargo.toml"))   ;; 项目根目录识别规则
  (setq projectile-globally-ignored-directories
        '("^node_modules$" "^target$" "^build$" "^dist$" "\\.cache$"))             ;; 全局忽略的目录和文件(正则表达式)
  (setq projectile-globally-ignored-files
        '("TAGS" "*.class" "*.pyc" "*.o" "*.so" "*.dll"))

  (setq projectile-indexing-method 'alien)                                         ;; 使用外部工具加速索引
  (setq projectile-sort-order 'recently-active)                                    ;; 按最近访问排序文件
  (setq projectile-find-dir-includes-top-level t)
  (setq projectile-find-file-in-known-projects-automatically t)
  ;;(setq projectile-completion-system 'ido)
  (setq projectile-cleanup-known-projects nil)                                     ;; 清理已删除目录

  (global-set-key (kbd "C-x p") 'projectile-command-map)

  (use-package ripgrep :ensure t)

  ;; (use-package counsel-projectile
  ;;   :ensure t
  ;;   :config
  ;;   (counsel-projectile-mode 1))
  
  (projectile-mode t)
  )

;; magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch))
  :custom
  (magit-display-buffer-function #'magit-display-buffer-traditional)
  (magit-save-repository-buffers 'dontask)
  (magit-auto-revert-mode t)
  (magit-diff-refine-hunk 'all)
  :config
  (use-package transient
    :ensure t
    :config
    (transient-bind-q-to-quit)))

(provide 'init-projects)
