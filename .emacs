;; on LINUX create symbolic links to .emacs and .emacs.custom.el
;; example:
;; ln -s ~/dotfiles/.emacs ~/.emacs
;; ln -s ~/dotfiles/.emacs.custom.el ~/.emacs.d/.emacs.custom.el

;; on WINDOWS create symbolic link to .emacs and .emacs.custom.el
;;
;; open Command Prompt with Administrator Mode
;; mklink %USERPROFILE%\AppData\Roaming\.emacs %USERPROFILE%\dotfiles\.emacs
;; mklink %USERPROFILE%\AppData\Roaming\.emacs.d\.emacs.custom.el %USERPROFILE%\dotfiles\.emacs.custom.el
;;
;; or
;;
;; open PowerShell Administator Mode
;; New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\.emacs" -Target "$env:USERPROFILE\dotfiles\.emacs"
;; New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\.emacs.d\.emacs.custom.el" -Target "$env:USERPROFILE\dotfiles\.emacs.custom.el"

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

(use-package multiple-cursors :ensure t)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package smex :ensure t)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  
(use-package which-key :ensure t :config (which-key-mode))

;; saves git messages to the magit ring. to grab when commit with M-p
(add-hook 'git-commit-setup-hook 'git-commit-save-message)




