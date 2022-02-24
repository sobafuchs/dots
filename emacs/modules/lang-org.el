;;; lang-org.el --- configures org mode and associated packages

;;; Commentary:

;;; Code:

(use-package org
  :config
  (setq org-agenda-start-with-log-mode t) ;; presents log in daily planner view
  :custom
  (org-log-done 'time)
  (org-log-into-drawer t)
  (org-directory "~/storage/org")
  (org-agenda-files '("~/storage/org/agenda.org"))
  :hook (org-mode . (lambda ()
                      (org-indent-mode)
                      (visual-line-mode 1))))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(provide 'lang-org)

;;; lang-org.el ends here
