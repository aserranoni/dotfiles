(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(aw-reverse-frame-list t)
 '(company-global-modes
   '(not erc-mode circe-mode message-mode help-mode gud-mode vterm-mode pact-mode))
 '(custom-safe-themes
   '("835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "e22ab8293621667768e6dffb4168856d46902b06bdef4dd1df7d9956d718bfbb" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" default))
 '(find-file-hook
   '(auto-revert--global-adopt-current-buffer auto-revert-find-file-function evil-mode-check-buffers doom-optimize-for-large-files-h global-eldoc-mode-check-buffers global-font-lock-mode-check-buffers epa-file-find-file-hook vc-refresh-state))
 '(lsp-csharp-server-install-dir
   "/home/futebolousado/.doom-emacs.d/.local/etc/lsp/omnisharp-roslyn/latest/omnisharp-roslyn/")
 '(package-selected-packages
   '(org-notifications org-notify flymake-jslint flymake-gjshint chess pact-mode svg-clock org-noter-pdftools define-word powerthesaurus transient))
 '(send-mail-function 'sendmail-send-it)
 '(warning-suppress-log-types '((server) (find-file-hook) (find-file-hook)))
 '(warning-suppress-types '((find-file-hook) (find-file-hook))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "orange red" :height 2.5)))))
(put 'customize-group 'disabled nil)
(put 'customize-variable 'disabled nil)
(put 'customize-face 'disabled nil)
