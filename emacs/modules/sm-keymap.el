;;; sm-keymap.el -- defines global and specific keybindings that may not be tied to a specific mode

;;; Commentary:
;; Most of these keybindings represent sane defaults. Some specific modes may override them.

;;; Code:
(define-key sm-leader-map (kbd "SPC") 'find-file) ;; TODO: find package that can preview file
(define-key sm-leader-map "b" 'list-buffers)

(provide 'sm-keymap)

;;; sm-keymap.el ends here
