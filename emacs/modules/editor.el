;;; editor.el --- configuration for editor utilities, such as syntax checking and file explorers

;;; Commentary:

;;; Code:
(require 'use-package)

(use-package diminish)

;; upgrade to emacs 28 to get access to C-r
;; otherwise you need to download undo-fu
(use-package evil
  :config
  (evil-mode 1))

(use-package treemacs
  :config
  (setq treemacs-project-follow-mode t))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-icons-dired
  :after treemacs
  :config
  (treemacs-icons-dired-mode))

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
  (setq which-key-idle-delay 0.3)
  (which-key-mode))

(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package magit)
(provide 'editor)

;;; editor.el ends here
