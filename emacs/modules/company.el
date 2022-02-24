;; company.el -- configures company

;;; Commentary:

;; Company is an in-buffer completion engine (not to be confused with ivy, helm, vertico, etc)
(require 'use-package)

(use-package company
  :config
  (setq company-idle-delay 0.5)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (global-company-mode))

(provide 'company)

;;; company.el ends here
