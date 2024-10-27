;; custom variables in separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; disable splash screen
(setq inhibit-startup-screen t)

;; disable menu and tool-bar
(menu-bar-mode 0)
(tool-bar-mode 0)

;; melpa
(add-to-list 'package-archives
     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; enable ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; electric pair mode
(electric-pair-mode t)
(setq electric-pair-preserve-balance nil)

;; disable backup and auto-save files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; yes or no questions to y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; resize windows
(global-set-key (kbd "s-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-<down>") 'shrink-window)
(global-set-key (kbd "s-C-<up>") 'enlarge-window)

;; switch cursor to new window
(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)
(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;; pdf and latex config
(pdf-tools-install)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(require 'tex)
(TeX-global-PDF-mode t)
(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)

;; relative line numbers
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook (lambda() (display-line-numbers-mode 1)))
(add-hook 'text-mode-hook (lambda() (display-line-numbers-mode 1)))

;; indentation config
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; ace-window keybind
(global-set-key (kbd "M-o") 'ace-window)

;; kill all other buffers
(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

