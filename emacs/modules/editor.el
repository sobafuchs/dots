;;; editor.el --- configuration for editor utilities, such as syntax checking and file explorers

;;; Commentary:

;;; Code:
(require 'use-package)

(use-package flycheck)

(use-package treemacs)

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-icons-dired
  :after treemacs
  :config
  (treemacs-icons-dired-mode))

(provide 'editor)

;;; editor.el ends here
