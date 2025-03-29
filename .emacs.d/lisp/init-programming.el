(use-package eglot                                                ;; lsp工具,使用内置的而不是lsp-mode
  :hook
  (go-mode . eglot-ensure)                                        ;; golang
  (c-mode . eglot-ensure)                                         ;; c
  (c++-mode . eglot-ensure)                                       ;; c++
  (rust-mode . eglot-ensure)                                      ;; rust
  :config
  (setq eglot-autoshutdown t)
  (setq eglot-send-changes-idle-time 0.1)
  (add-to-list 'eglot-server-programs
               '((c-mode c-ts-mode)
                 . ("ccls")))
  (add-to-list 'eglot-server-programs
               '((c++-mode c++-ts-mode)
                 . ("clangd")))
  (add-to-list 'eglot-server-programs
               '((rust-mode rust-ts-mode)
                 . ("rust-analyzer")))
  )


(use-package eldoc
  :ensure t
  :config
  (setq eldoc-echo-area-use-multiline-p nil))
(use-package eldoc-box
  :ensure t
  :config
  (global-set-key (kbd "C-c h") 'eldoc-box-help-at-point))

(use-package rainbow-delimiters                                   ;; 彩虹括号,写lisp系非常好用 ^^
  :ensure t
  :config
  (custom-set-faces
   '(rainbow-delimiters-depth-1-face                              ;; 第一层括号
     ((t (:foreground "#FF4500" ))))
   '(rainbow-delimiters-depth-2-face                              ;; 第二层括号
     ((t (:foreground "#32CD32" ))))
   '(rainbow-delimiters-depth-3-face                              ;; 第三层括号
     ((t (:foreground "#1E90FF" ))))
   '(rainbow-delimiters-depth-4-face                              ;; 第四层括号
     ((t (:foreground "#FFD700" ))))
   '(rainbow-delimiters-depth-5-face                              ;; 第五层括号
     ((t (:foreground "#DA70D6" ))))
   '(rainbow-delimiters-depth-6-face                              ;; 第七层括号
     ((t (:foreground "#FF1493" ))))
   '(rainbow-delimiters-depth-7-face                              ;; 第八层括号
     ((t (:foreground "#00CED1" )))))
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :config
  (setq flymake-no-changes-timeout 0.1
	flymake-start-on-flymake-mode t)

  (define-key flymake-mode-map (kbd "C-c C-n") 'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "C-c C-p") 'flymake-goto-prev-error)
  (define-key flymake-mode-map (kbd "C-c !") 'flymake-show-buffer-diagnostics)
  )

(provide 'init-programming)
