;; save customizations in different file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; suppress unnecessary native-comp warnings
(setq native-comp-async-report-warnings-errors 'silent)

;; suppress startup message and bells
(setq inhibit-startup-message t
      ring-bell-function 'ignore
      visible-bell nil)

;; qol settings
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

;; relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; evil
(use-package evil
  :config
  (evil-mode)
  (evil-set-undo-system 'undo-redo))

;; nix
(use-package nix-mode
  :mode "\\.nix\\'")

;; vertico
(use-package vertico
  :init
  (vertico-mode))
