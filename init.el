(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(set-default-font "DejaVu Sans Mono-10:bold")

(setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)

(require 'ace-jump-mode)
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c a") 'ace-jump-mode)

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(load-theme 'sanityinc-tomorrow-bright t)

(setq py-python-command "/usr/local/bin/python2.7")
(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))

;(require 'workgroups2)
;(setq wg-prefix-key (kbd "C-c z"));

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'undo-tree)
(global-undo-tree-mode 1)

(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-u") 'undo)
(global-set-key (kbd "C-S-u") 'redo)
(global-set-key (kbd "H-u") 'undo-tree-visualize)

;(cua-mode t)
;(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;(transient-mark-mode 1) ;; No region when it is not highlighted
;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;(require 'powerline)
;(setq powerline-arrow-shape 'arrow14) ;; best for small fonts
;(powerline-default-theme)

(setq inhibit-startup-screen t)

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key (kbd "C-c <right>") 'hs-show-block)
    (local-set-key (kbd "C-c <left>")  'hs-hide-block)
    (local-set-key (kbd "C-c <up>")    'hs-hide-all)
    (local-set-key (kbd "C-c <down>")  'hs-show-all)
    (hs-minor-mode t)))

(add-hook 'python-mode-hook
  (lambda()
    (local-set-key (kbd "C-c <right>") 'hs-show-block)
    (local-set-key (kbd "C-c <left>")  'hs-hide-block)
    (local-set-key (kbd "C-c <up>")    'hs-hide-all)
    (local-set-key (kbd "C-c <down>")  'hs-show-all)
    (hs-minor-mode t)))

; Set cursor color to white
(set-cursor-color "#cdc9c9")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-match-face (quote secondary-selection))
 '(blink-cursor-mode nil)
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "290987f8b1cbe93977fc21403c1e9bdc95013cb0cf29d0f6120768463ee61442" default)))
 '(fringe-mode 6 nil (fringe))
 '(linum-format " %5d")
 '(list-matching-lines-buffer-name-face (quote bold))
 '(list-matching-lines-face (quote bold))
 '(main-line-color1 "#191919")
 '(main-line-color2 "#111111")
 '(menu-bar-mode nil)
 '(powerline-color1 "#191919")
 '(powerline-color2 "#111111")
 '(scroll-bar-mode nil)
 '(session-use-package t nil (session))
 '(site-autoshells (quote (("localhost" "" "~/" ("*shell_l1*" "*shell_l2*" "*shell_t_cr*" "*shell_b_cr*")))))
 '(site-vendor-load-hook nil)
 '(tool-bar-mode nil)
 '(windmove-wrap-around nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(font-lock-comment-face ((t (:foreground "#E08DFF"))))
;;  '(font-lock-doc-string-face ((t (:foreground "white"))))
;;  '(font-lock-function-name-face ((t (:foreground "#F8FF95" :weight bold))))
;;  '(font-lock-keyword-face ((t (:foreground "#F8FF95"))))
;;  '(font-lock-string-face ((t (:foreground "sky blue")))))
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(font-lock-comment-face ((t (:foreground "#E08DFF"))))
;; '(font-lock-doc-string-face ((t (:foreground "white"))))
;; '(font-lock-function-name-face ((t (:foreground "#F8FF95" :weight bold))))
;; '(font-lock-keyword-face ((t (:foreground "#F8FF95"))))
;; '(font-lock-string-face ((t (:foreground "sky blue")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#2a2a2a" :foreground "white smoke" :slant normal))))
 '(mode-line ((t (:background "dark slate gray" :box (:line-width 1 :color "#eaeaea") :weight normal))))
 '(mode-line-buffer-id ((t (:foreground "snow2" :weight bold))))
 '(mode-line-highlight ((t (:foreground "snow1" :box nil :weight bold))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#2a2a2a" :foreground "#969896" :weight normal))))
 '(wg-divider-face ((t (:foreground "gainsboro"))))
 '(wg-mode-line-face ((t (:foreground "gainsboro")))))

(set-background-color "grey14")

(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

;; (add-hook 'god-mode-enabled-hook 'my-update-cursor)
;; (add-hook 'god-mode-disabled-hook 'my-update-cursor)

;; evil
;; (setq evil-toggle-key "C-`")
;; (require 'evil)
;; (evil-mode 1)


(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(require 'google-translate)

(column-number-mode 1)

(global-set-key (kbd "C-x c") 'calc)

;; Helpful sites
; http://whattheemacsd.com/
; https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org

;; Add Eventually
; Projectile
; Auto IRC https://github.com/sachac/.emacs.d/blob/gh-pages/Sacha.org#autoconnect-to-irc-so-that-i-dont-forget
; cygwin http://stackoverflow.com/questions/3286723/emacs-cygwin-setup-under-windows/13245173#13245173
; smartparens
; floobits
; bongos (music) and bongos volume.el
; gmail
; git-time machine
; move init to org file
;; machine specific init
;;; ;; Settings for currently logged in user
;;; (setq user-settings-dir
;;;       (concat user-emacs-directory "users/" user-login-name))
;;; 
;;; ;; Conclude init by setting up specifics for the current user
;;; (when (file-exists-p user-settings-dir)
;;;   (mapc 'load (directory-files user-settings-dir nil "^[^#].*el$")))
; http://www.emacswiki.org/emacs/PythonProgrammingInEmacs
; learn elisp

;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

;; This is amazing, shows line numbers with linum on M-g g
(global-set-key [remap goto-line] 'goto-line-with-feedback)
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;; Open a browser to look up quick queries
(global-set-key (kbd "C-x g") 'webjump)
;; Add Urban Dictionary to webjump
(eval-after-load "webjump"
'(add-to-list 'webjump-sites
              '("Urban Dictionary" .
                [simple-query
                 "www.urbandictionary.com"
                 "http://www.urbandictionary.com/define.php?term="
                 ""])))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; emacs speedreading
(require 'spray)
(global-set-key (kbd "<f6>") 'spray-mode)

;; M-x completions
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; IDO mode shows open buffers, runs file like smex
(require 'ido)
(ido-mode t)


(require 'ein)
