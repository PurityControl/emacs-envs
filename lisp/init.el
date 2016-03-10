(setq user-emacs-directory "~/emacs-envs/lisp/")

(setq make-backup-files nil)

;; changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; use spaces for tabs
(setq-default indent-tabs-mode nil)

;; set path to sbcl and use quicklisp slime helper
;; first had to run the following command in standard sbcl shell
;; (ql:quickload "quicklisp-slime-helper")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(cond
  ((eq system-type 'berkeley-unix)
   (setq inferior-lisp-program "/usr/local/bin/sbcl"))
  ((eq system-type 'darwin)
   (setq inferior-lisp-program "/opt/local/bin/sbcl"))
  (t 
   (setq inferior-lisp-program "/usr/bin/sbcl")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; PACKAGE INSTALLATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; add melpa stable to package repos
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set Package repositories ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install use-package if it's not already installed.            ;;
;; package-refresh-contents ensure packages loaded in new emacs. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package evil
  :ensure t
  :init
  (use-package key-chord
    :load-path "key-chord"
    :config (key-chord-mode 1))
  :config
  (evil-mode 0)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (define-key evil-motion-state-map ";" 'evil-ex)
  :bind (([f12] . evil-mode)))

(use-package slime
  :ensure t)
