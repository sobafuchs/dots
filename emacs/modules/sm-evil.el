;;; sm-evil -- configures evil mode

;;; Commentary:

;;; Code:

;; upgrade to emacs 28 to get access to C-r
;; otherwise you need to download undo-fu
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(defvar sm-leader-map (make-sparse-keymap)
  "Sobamacs keymap for leader key shortcuts")

(define-key evil-normal-state-map (kbd "SPC") sm-leader-map)

(provide 'sm-evil)

;;; sm-evil.el ends here
