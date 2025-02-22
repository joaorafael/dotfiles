;; on WINDOWS setup .emacs file with the following contents
;; (setq user-emacs-directory "C:/Users/joao.rafael/dotfiles/")
;; (load "C:/Users/joao.rafael/dotfiles/.emacs")

;; on LINUX create symbolic links to .emacs and .emacs.custom.el
;; example:
;; cd ~; ln -s ~/dotfiles/.emacs .emacs
;; cd ~/.emacs.d; ln -s .emacs ~/dotfiles/.emacs.custom.el .emacs.custom.el

(setq custom-file (expand-file-name ".emacs.custom.el" user-emacs-directory))
(load custom-file)

(tool-bar-mode 0)
;(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(global-display-line-numbers-mode)

;;disable splash screen and startup message
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

;;(add-to-list 'default-frame-alist )
;;(setq inhibit-startup-message t)

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; saves git messages to the magit ring. to grab when commit with M-p
(add-hook 'git-commit-setup-hook 'git-commit-save-message)

;(setq ido-enable-flex-matching t)
;(setq ido-everywhere t)
;(ido-mode 1)

