;;; lang-elisp.elisp

;;; Code
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (smartparens-strict-mode)
				  (rainbow-delimiters-mode)))
(provide 'lang-elisp)
