;;; lang-clojure.el --- Configures Emacs for clojure development

;;; Commentary:
 
;;; Code:

;; clojure config

(use-package clojure-mode
  :hook ((clojure-mode . rainbow-delimiters-mode)))
(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)

(use-package cider
  :after clojure-mode
  :config
  (add-hook 'cider-mode-hook (lambda () (remove-hook 'completion-at-point-functions #'cider-complete-at-point))))

(provide 'lang-clojure)

;;; lang-clojure.el ends here
