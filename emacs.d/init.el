(when window-system
  (setq inhibit-splash-screen t)
  (load-theme 'misterioso)
  (tool-bar-mode -1))

(transient-mark-mode 1)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;;; Load the config.org
(org-babel-load-file (concat user-emacs-directory "config.org"))

;;(load (expand-file-name "~/quicklisp/slime-helper.el"))
;;(setq inferior-lisp-program "sbcl")

;;(use-package org-evil
;;  :ensure t
;;  :config
;;  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;  )
;;
;;(use-package evil-leader
;;  :ensure t
;;  :config
;;  (global-evil-leader-mode)
;;  (evil-leader/set-leader ","))
;;
;;(use-package evil-surround
;;  :ensure t
;;  :config
;;  (global-evil-surround-mode))

;;(use-package evil
;;  :ensure t
;;  :config
;;  (evil-mode 1)
;;
;;  ;; More config goes here
;;  )
;;
;;(use-package org
;;  :ensure t
;;  :config
;;  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;;  ;; More config goes here
;;  )
;;
;;(use-package helm
;;  :ensure t
;;  :config
;;  )
;;
;;(use-package rainbow-delimiters
;;  :ensure t
;;  :config
;;  ;; Enables rainbow-delimiters-mode in Emacs Lisp buffers
;;  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
;;
;;  ;; Enables rainbow-delimiters-mode in Clojure buffers.
;;  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
;;
;;  ;; enables rainbow-delimiters-mode in other Lisp mode buffers.
;;  (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
;;  )
;;
;;(use-package powerline
;;  :ensure t
;;  :config
;;  (powerline-default-theme)
;;  )
;;
