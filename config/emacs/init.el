;; suppress unnecessary native-comp warnings
(setq warning-minimum-level :error)

;; redirect backup, auto-save, and customizations
(defvar my-temp-dir 
  (expand-file-name "temp/" user-emacs-directory))

(unless (file-directory-p my-temp-dir)
  (make-directory my-temp-dir))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory)
      backup-directory-alist `((".*" . ,my-temp-dir))
      auto-save-file-name-transforms `((".*" ,my-temp-dir t)))
(load custom-file t)

;; suppress startup message and bells
(setq inhibit-startup-message t
      ring-bell-function 'ignore
      visible-bell nil)

;; basic qol settings
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(global-visual-line-mode)
(electric-pair-mode 1)
(winner-mode 1)

;; "y or n" instead of "yes or no"
(setopt use-short-answers t)

;; relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; default tab settings
(setq-default indent-tabs-mode nil
              tab-width 4)

;; change selected region color
(set-face-attribute 'region nil :background "#e9e9e9")

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; evil (vi keys)
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  (setq evil-want-integration t
	    evil-want-keybinding nil
	    evil-undo-system 'undo-redo)
  :config
  (define-key evil-window-map "u" 'winner-undo)
  (define-key evil-window-map "U" 'winner-redo)
  (evil-mode))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode))

;; envrc (direnv integration)
(use-package envrc
  :hook (after-init . envrc-global-mode))

;; vertico
(use-package vertico
  :init
  (vertico-mode))

;; orderless
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

;; marginalia
(use-package marginalia
  :init
  (marginalia-mode))

;; winum (window numbers)
(use-package winum
  :config
  (winum-mode))
 
;; nix
(use-package nix-mode
  :mode "\\.nix\\'")

;; c and c++
(use-package cc-mode
  :config
  (defun my/c-style ()
    (setq c-basic-offset 4
  	      tab-width 4
  	      indent-tab-modes nil))
  (add-hook 'c-mode-common-hook 'my/c-style))

;; haskell
(use-package haskell-mode)
