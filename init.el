(setq user-full-name "Ian McNanie"
      user-mail-address "ianmcnanie@gmail.com")

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode 1)
  (scroll-bar-mode -1))

(fset 'yes-or-no-p 'y-or-n-p)


(package-initialize)
(setq package-enable-at-startup nil)

(require 'undo-tree)
(global-undo-tree-mode 1)


(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this) 
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this) 
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this) 

(global-set-key (kbd "C-x g") 'magit-status)

(load-theme 'atom-one-dark t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
