;;; lang-clojure.el

;;; Code

;; This lsp code should be moved to its own module
;; :commands autoloads a command and defers loading a module until used
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
(use-package flycheck)
(use-package lsp-ui
  :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; clojure config
(use-package clojure-mode
  :hook (clojure-mode . rainbow-delimiters-mode))
(use-package cider
  :after clojure-mode
  :config
  (add-hook 'cider-mode-hook (lambda () (remove-hook 'completion-at-point-functions #'cider-complete-at-point))))
(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)

(provide 'lang-clojure)
