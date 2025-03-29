
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :init
  (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
	      ("C-c C-e" . markdown-export)))


(use-package go-mode                                              ;; go-mode
  :ensure t
  :config
  (setq-default eglot-workspace-configuration                     ;; gopls的配置
                '((:gopls .
                          ((staticcheck . t)
                           (analyses . ((unusedparams . t)
                                        (unusedwrite . t)
                                        (nilness . t)))
                           (hints . ((assignVariableTypes . t)
                                     (compositeLiteralFields . t)
                                     (compositeLiteralTypes . t)
                                     (constantValues . t)
                                     (functionTypeParameters . t)
                                     (parameterNames . t)
                                     (rangeVariableTypes . t)))
                           (usePlaceholders . t)                  ;; 函数占位符
                           (hoverKind . "SynopsisDocumentation")
                           (matcher . "Fuzzy")
                           (symbolStyle . "Full")))))
  (setq-default gofmt-command "goimports")                                ;; 使用goimports而不是gofmt
  (add-hook 'before-save-hook 'gofmt-before-save)                 ;; 保存时自动格式化
  :hook
  (go-mode . (lambda ()
	       (setq tab-width 4)
	       (setq indent-tabs-mode nil))))

(use-package cc-mode
  :ensure t
  :hook
  (c-mode-common . (lambda ()
		     (setq tab-width 2)
		     (setq c-basic-offset 2)
		     (setq indent-tabs-mode nil))))

(use-package google-c-style
  :ensure t
  :hook
  (c-mode-common . (lambda ()
                     (google-set-c-style)
                     ))
  :config
  (add-hook 'c-mode-common-hook (lambda ()
                                  (add-hook 'before-save-hook nil t))))

(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode)
  :config
  (setq rust-format-on-save t)
  (add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
  ;; (add-hook 'rust-mode-hook
  ;;           (lambda () (prettify-symbols-mode)))
  )

(use-package cargo
  :ensure t
  :diminish
  :hook (rust-mode . cargo-minor-mode))

(provide 'init-languages)
;;; init-languages.el ends here
