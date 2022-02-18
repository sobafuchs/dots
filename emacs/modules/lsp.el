;;; lsp.el --- Configures lsp utilities for emacs

;;; Commentary:

;;; Code:
(require 'use-package)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq gc-cons-threshold (* 100 1024 1024)
	read-process-output-max (* 1024 1024)
	treemacs-space-between-root-nodes nil
	company-minimum-prefix-length 1
	lsp-lens-enable t
	lsp-signature-auto-activate nil)
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :after ivy
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :after treemacs
  :commands lsp-treemacs-errors-list)

(provide 'lsp)

;;; lsp.el ends here
