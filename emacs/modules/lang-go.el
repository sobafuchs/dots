;;; lang-go.el --- Configures emacs for go language

;;; Commentary:
;;  Configures the necessary packages for using Emacs with the Go programming language

;;; Code:
(require 'use-package)

(use-package go-mode
  :config
  (add-hook 'go-mode-hook 'lsp))

(use-package go-eldoc)
(use-package go-gen-test)
(use-package flycheck-golangci-lint)
(use-package gorepl-mode)
(use-package gotest
  :bind (:map go-mode-map
              ("C-c t f" . go-test-current-file)
              ("C-c t t" . go-test-current-test)))

(use-package go-playground
  :diminish
  :commands (go-playground-mode))

(use-package go-dlv)

(provide 'lang-go)
;;; lang-go.el ends here
