;;; modules/lang-ruby.el --- Configuration for ruby

;;; Commentary:

;;; Code:

;; TODO: Move yas snippets to its own module

;; Ruby REPL
(use-package inf-ruby
  :hook ((ruby-mode . inf-ruby-minor-mode)))

;; Ruby mode
(use-package ruby-mode
  :hook ((ruby-mode . lsp-deferred)
         (ruby-mode . smartparens-mode)))

(use-package rbs-mode)
(provide 'lang-ruby)

;;; lang-ruby.el ends here
