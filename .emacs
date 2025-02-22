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
(setq make-backup-files nil)

(ido-mode 1)
(ido-everywhere 1)

(set-frame-font "Source Code Pro-16")
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(define-key global-map [remap list-buffers] 'buffer-menu-other-window)

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package multiple-cursors
  :ensure t)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package smex
  :ensure t)
(global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; saves git messages to the magit ring. to grab when commit with M-p
(add-hook 'git-commit-setup-hook 'git-commit-save-message)




