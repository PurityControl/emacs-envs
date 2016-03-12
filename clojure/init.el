(setq user-emacs-directory "~/emacs-envs/clojure/")

(setq make-backup-files nil)

;; changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; use spaces for tabs
(setq-default indent-tabs-mode nil)

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

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)
