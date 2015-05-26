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


;; list the packages you want to install - will be preserved in src control
(defvar my-packages '(magit
                      evil
		      slime))

;; install the packages  if not installed
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

