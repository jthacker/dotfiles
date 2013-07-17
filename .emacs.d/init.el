(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Use command buffer as visual bell
(load-file "~/.emacs.d/elisp/visual-bell.el")

;; Add local directory of themes to path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Use vim keybindings by default
(require 'evil)
(evil-mode 1)
;;(setq evil-default-cursor t)
;;(setq-default cursor-type 'bar)
(setq evil-normal-state-cursor '("white" bar))
(setq evil-insert-state-cursor '("red" bar))
;;(set-cursor-color 'red)

;; Turn off current row highlighting
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)

;; Load the solarized dark theme
(load-theme 'zenburn t)

;; Paredit enabled in repl
(add-hook 'inferior-lisp-mode-hook 'paredit-mode)

;; Paredit enabled with nrepl
(add-hook 'nrepl-mode-hook 'paredit-mode)

;; Enable Auto Completion
(require 'auto-complete-config)
(ac-config-default)

;; Enable nrepl auto completion
(require 'ac-nrepl)
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'nrepl-mode))
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
