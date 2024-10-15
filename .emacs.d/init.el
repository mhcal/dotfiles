(setq inhibit-startup-screen t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "pdflatex")
 '(TeX-PDF-mode t)
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "PDF Tools")
     (output-html "xdg-open")))
 '(cl-font-lock-built-in-mode t)
 '(cursor-type 'bar)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("ba323a013c25b355eb9a0550541573d535831c557674c8d59b9ac6aa720c21d3" "a5270d86fac30303c5910be7403467662d7601b821af2ff0c4eb181153ebfc0a" default))
 '(display-line-numbers 'visual)
 '(electric-pair-mode t)
 '(latex-run-command "pdflatex")
 '(package-selected-packages
   '(haskell-tng-mode hasklig-mode haskell-mode pdf-tools latex-preview-pane auctex))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(pdf-tools-install)
(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq TeX-auto-save t)
(setq-default TeX-master nil)
(require 'package 'hi2)
(add-to-list 'package-archives
     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(latex-preview-pane-enable)
(add-hook 'haskell-mode-hook 'turn-on-hi2)
(set-face-attribute 'default nil
                    :family "Hasklig"
                    :height '120
                    :weight 'normal
                    :width 'normal)
(use-package hasklig-mode
  :hook (haskell-mode))

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

