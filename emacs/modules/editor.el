;;; editor.el

(use-package treemacs)
(use-package treemacs-evil
  :after (treemacs evil))
(use-package treemacs-icons-dired
  :after treemacs
  :config
  (treemacs-icons-dired-mode))

(provide 'editor)
