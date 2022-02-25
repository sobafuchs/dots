
;;; init.el --- entrypoint

;;; Commentary:
;; This file sets up some global config options.

;;; Code:

(setq inhibit-startup-message t)
;; Disable warnings from legacy advice system. They aren't useful, and what can
;; we do about them, besides changing packages upstream?
(setq ad-redefinition-action 'accept)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 0)
(menu-bar-mode -1)
(column-number-mode)
(global-display-line-numbers-mode)

(set-face-attribute 'default nil :font "Fira Code Retina" :height 140)
(load-theme 'tango-dark)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)
;; store backups in a centralized folder so that project dirs dont get cluttered with them
(setq backup-directory-alist '(("." . "~/.emacs_backups")))

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
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-org-config))
(with-eval-after-load 'doom-themes
  (doom-themes-treemacs-config))
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(defvar modules-dir (expand-file-name "modules" user-emacs-directory))
(add-to-list 'load-path modules-dir)

;; configure spaces instead of tabs
(setq-default major-mode 'text-mode
          fill-column 80
          tab-width 4
          indent-tabs-mode nil) ; permanently disables TABs

;;; performance boosts

;; PGTK builds only: this timeout adds latency to frame operations, like
;; `make-frame-invisible', which are frequently called without a guard because
;; it's inexpensive in non-PGTK builds. Lowering the timeout from the default
;; 0.1 should make childframes and packages that manipulate them (like `lsp-ui',
;; `company-box', and `posframe') feel much snappier. See emacs-lsp/lsp-ui#613.
(setq pgtk-wait-for-event-timeout 0.001)

;; Increase how much is read from processes in a single chunk (default is 4kb).
;; This is further increased elsewhere, where needed (like our LSP module).
(setq read-process-output-max (* 64 1024))  ; 64kb

;; Introduced in Emacs HEAD (b2f8c9f), this inhibits fontification while
;; receiving input, which should help a little with scrolling performance.
(setq redisplay-skip-fontification-on-input t)

;; Get rid of "For information about GNU Emacs..." message at startup, unless
;; we're in a daemon session where it'll say "Starting Emacs daemon." instead,
;; which isn't so bad.
(unless (daemonp)
  (advice-add #'display-startup-echo-area-message :override #'ignore))

;;; security
;; dont ping things that look lke domain names
(setq ffap-machine-p-known 'reject)

;;; modules
(require 'completion)
(require 'company)
(require 'sm-evil)
(require 'sm-keymap)
(require 'editor)
(require 'lsp)
(require 'lang-elisp)
(require 'lang-clojure)
(require 'lang-go)
(require 'lang-ruby)
(require 'lang-elixir)
(require 'lang-org)

