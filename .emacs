(setq custom-file "~/.emacs.custom.el")
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

;(setq ido-enable-flex-matching t)
;(setq ido-everywhere t)
;(ido-mode 1)

