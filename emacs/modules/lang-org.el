;;; lang-org.el --- configures org mode and associated packages

;;; Commentary:

;;; Code:

(defun sm--org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :config
  (setq org-agenda-start-with-log-mode t) ;; presents log in daily planner view
  :custom
  (org-log-done 'time)
  (org-log-into-drawer t)
  (org-directory "~/storage/org")
  (org-agenda-files '("~/storage/org/agenda.org"))
  :hook (org-mode . sm--org-mode-setup))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(provide 'lang-org)

;;; lang-org.el ends here
