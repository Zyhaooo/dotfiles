(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file nil :nomessage))

(use-package exec-path-from-shell        ;; gui启动的emacs可能会没有path变量
  :ensure t
  :if (memq window-system '(mac ns x))   ;; 仅在图形界面下加载
  :config
  (exec-path-from-shell-initialize))     ;; 将特定环境变量从 shell 加载到 Emacs
  
;; 加载自定义配置文件
(require 'init-packages) 
(require 'init-projects)
(require 'init-programming)
(require 'init-completion)
(require 'init-themes)
(require 'init-editing)
(require 'init-ui)
(require 'init-languages)
(require 'init-translation)

(setq backup-directory-alist '((".*" . "/tmp/")))     ;; 备份文件存放地址
