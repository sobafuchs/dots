;;; programming.el --- utilities for the editor in general

;;; Commentary: provides a set of utilities for programming in general, including autopairing brackets and parens. Also sets sensible defaults for tabs vs spaces, tab width, etc.

(require 'use-package)

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))
(use-package which-key
  :config
  (which-key-mode))

(provide 'programming)
