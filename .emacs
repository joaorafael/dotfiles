;; on LINUX create symbolic links to .emacs and .emacs.custom.el
;; example:
;; ln -s ~/dotfiles/.emacs ~/.emacs
;; ln -s ~/dotfiles/.emacs.custom.el ~/.emacs.d/.emacs.custom.el

;; on WINDOWS create symbolic link to .emacs and .emacs.custom.el
;;
;; open PowerShell Administator Mode
;; New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE/AppData/Roaming/.emacs" -Target "$env:USERPROFILE/me/dotfiles/.emacs"
;; New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE/AppData/Roaming/.emacs.d/.emacs.custom.el" -Target "$env:USERPROFILE/me/dotfiles/.emacs.custom.el"
;; New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE/AppData/Roaming/.emacs.rc" -Target "$env:USERPROFILE/me/dotfiles/.emacs.rc"
;;
;; or
;;
;; open Command Prompt with Administrator Mode
;; mklink %USERPROFILE%/AppData/Roaming/.emacs %USERPROFILE%/me/dotfiles/.emacs
;; mklink %USERPROFILE%/AppData/Roaming/.emacs.d/.emacs.custom.el %USERPROFILE%/me/dotfiles/.emacs.custom.el
;; mklink %USERPROFILE%/AppData/Roaming/.emacs.rc %USERPROFILE%/me/dotfiles/.emacs.rc

;;(setq custom-file (expand-file-name ".emacs.custom.el" user-emacs-directory))
;;(load custom-file)

(setq custom-file "C:/Users/joao.rafael/AppData/Roaming/.emacs.custom.el")
(package-initialize)

(add-to-list 'load-path "C:/Users/joao.rafael/AppData/Roaming/.emacs.local")

(load "C:/Users/joao.rafael/AppData/Roaming/.emacs.rc/rc.el")

(tool-bar-mode 0)
;(menu-bar-mode 0)
(setq inhibit-startup-screen 1)
(scroll-bar-mode 0)
(column-number-mode 1)
(global-display-line-numbers-mode)
(setq make-backup-files nil)
(define-key global-map [remap list-buffers] 'buffer-menu-other-window)

(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(set-frame-font "Source Code Pro-16")
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(rc/require-theme 'gruber-darker)

(rc/require 'smex 'ido-completing-read+)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(rc/require 'cl-lib)
(rc/require 'magit)

(rc/require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(rc/require 'which-key)

;;(use-package which-key :ensure t :config (which-key-mode))

;; saves git messages to the magit ring. to grab when commit with M-p
(add-hook 'git-commit-setup-hook 'git-commit-save-message)




