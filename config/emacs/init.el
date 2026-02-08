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
(electric-pair-mode 1)

;; "y or n" instead of "yes or no"
(setopt use-short-answers t)

;; relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; default tab settings
(setq-default indent-tabs-mode nil
              tab-width 4)

;; ;; change selected region color
;; (set-face-attribute 'region nil :background "#e9e9e9")

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

;; ;; general (setup leader key)
;; (use-package general
;;   :after evil
;;   :config
;;   (general-evil-setup)
;;   (general-create-definer my/leader
;;     :states '(normal insert visual emacs)
;;     :keymaps 'override
;;     :prefix "SPC"
;;     :global-prefix "C-SPC")
;; 
;;   (my/leader
;;     ;; basic keybindings
;;     "SPC" 'execute-extended-command
;;     "TAB" 'evil-switch-to-windows-last-buffer
;;     "f f" 'find-file
;;     "q q" 'save-buffers-kill-terminal
;; 
;;     ;; help
;;     "h h" 'help
;;     "h f" 'describe-function
;;     "h v" 'describe-variable
;;     "h o" 'describe-symbol
;;     "h k" 'describe-key
;; 
;;     ;; buffers
;;     "b b" 'switch-to-buffer
;;     "b s" 'save-buffer
;;     "b k" 'kill-buffer
;;     "b r" 'revert-buffer
;;     "b l" 'list-buffers
;;     "b i" 'ibuffer
;;     "b n" 'evil-buffer-new
;; 
;;     ;; eval
;;     "e e" 'eval-last-sexp
;;     "e p" 'eval-print-last-sexp
;;     "e r" 'eval-region
;;     "e b" 'eval-buffer
;; 
;;     ;; dired
;;     "d d" 'dired
;;     "d o" 'dired-other-window
;; 
;;     ;; shell
;;     "s s" 'shell-command
;;     "s a" 'async-shell-command
;;     "s e" 'eshell
;; 
;;     ;; compilation
;;     "c c" 'compile
;;     "c r" 'recompile
;; 
;;     ;; windows
;;     "w w" 'evil-window-next
;;     "w s" 'evil-window-split
;;     "w v" 'evil-window-vsplit
;;     "w d" 'evil-window-delete
;;     "w h" 'evil-window-left
;;     "w j" 'evil-window-down
;;     "w k" 'evil-window-up
;;     "w l" 'evil-window-right
;;     "w H" 'evil-window-move-far-left
;;     "w J" 'evil-window-move-very-bottom
;;     "w K" 'evil-window-move-very-top
;;     "w L" 'evil-window-move-far-right
;;     "w 1" 'winum-select-window-1
;;     "w 2" 'winum-select-window-2
;;     "w 3" 'winum-select-window-3
;;     "w 4" 'winum-select-window-4
;;     "w f" 'delete-other-windows))
