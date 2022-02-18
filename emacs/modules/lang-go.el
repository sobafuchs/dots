;;; lang-go.el --- Configures emacs for go language

;;; Commentary:
;;  Configures the necessary packages for using Emacs with the Go programming language

;;; Code:
(require 'use-package)

(use-package go-mode
  :config
  (add-hook 'go-mode-hook #'lsp-deferred))

(use-package go-eldoc)
(use-package go-gen-test)
(use-package flycheck-golangci-lint)
(use-package gorepl-mode)

(provide 'lang-go)
;;; lang-go.el ends here
