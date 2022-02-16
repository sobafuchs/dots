;;; programming.el --- utilities for the editor in general

;;; Commentary: provides a set of utilities for programming in general, including autopairing brackets and parens. Also sets sensible defaults for tabs vs spaces, tab width, etc.

(require 'use-package)

(use-package rainbow-delimiters)

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))

;; evil-smartparens is necessary for smartparens to work in evil mode.
;; if you try using `dd` for instance to delete a line, this package will
;; apply smartparens to that command. Otherwise it will not balance properly.
(use-package evil-smartparens
  :after smartparens
  :init
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))

(use-package which-key
  :config
  (which-key-mode))

(provide 'programming)
