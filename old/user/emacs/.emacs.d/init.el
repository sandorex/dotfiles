(require 'org)

;; custom variables file
(setq custom-file (expand-file-name "init.el" user-emacs-directory))

;; custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(clang-format-executable "/usr/bin/clang-format-7")
 '(custom-safe-themes
	(quote
	 ("bf5bdab33a008333648512df0d2b9d9710bdfba12f6a768c7d2c438e1092b633" "adf5275cc3264f0a938d97ded007c82913906fc6cd64458eaae6853f6be287ce" default)))
 '(package-selected-packages
	(quote
	 (auto-package-update doom-modeline auto-complete dashboard which-key modalka undo-tree ace-window helm org-bullets multiple-cursors neotree projectile use-package rainbow-delimiters clang-format atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282C34" :foreground "#ABB2BF" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "PfEd" :family "Hack"))))
 '(org-ellipsis ((t (:foreground "dim gray"))))
 '(org-level-1 ((t (:inherit bold :foreground "#ff79c6"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "magenta" :weight bold)))))

;; load main config
(org-babel-load-file (expand-file-name "orginit.org" user-emacs-directory))
