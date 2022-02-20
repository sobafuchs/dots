;;; lang-elisp.elisp --- Configures Emacs Lisp

;;; Code

;; Helpful is a package to improve Emacs Lisp's default
;; documentation functionality. Most importantly, Helpful
;; will show the callpoint of a function and include its
;; source code if it can.
(use-package helpful
  :after counsel
  :init
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable)
  :bind (:map emacs-lisp-mode-map
              ;; view interactive functions
              ("C-h c" . helpful-command)
              ;; describe function, macro, or special form
              ("C-h f" . helpful-callable)
              ;; looks up functions (excluding macros)
              ("C-h F" . helpful-function)
              ("C-h k" . helpful-key)
              ("C-h v" . helpful-variable)
              ("C-c C-d" . helpful-at-point)))

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (smartparens-strict-mode)
                                  (rainbow-delimiters-mode)))

(provide 'lang-elisp)
