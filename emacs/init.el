;; init.el -- configuration entrypoint

;;; Commentary:

;; This file sets up some global config options 
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 0)
(menu-bar-mode -1)
(set-face-attribute 'default nil :font "Fira Code Retina" :height 180)
(load-theme 'tango-dark)
(setq custom-file "~/.emacs.d/custom.el") ;; dump custom settings to another file
(load custom-file 'noerror)
;; store backups in a centralized folder so that project dirs dont get cluttered with them
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(setq straight-use-package-by-default t)

;; configure straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer 
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)

(use-package all-the-icons
  :if (display-graphic-p))
(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config))
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; upgrade to emacs 28 to get access to C-r
;; otherwise you need to download undo-fu
(use-package evil
  :config
  (evil-mode 1))

(use-package diminish)

;; completion
(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :diminish
  :config
  (ivy-mode 1)
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :bind (("C-s" . swiper)))

(defvar modules-dir (expand-file-name "modules" user-emacs-directory))
(add-to-list 'load-path modules-dir)

(require 'company)
(require 'programming)
(require 'editor)
(require 'lang-elisp)
(require 'lang-clojure)

