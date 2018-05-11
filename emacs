; -*-Lisp-*-
;; (require 'cl-lib) 

(progn
  ;;; Never to be uncommented
  ;; (global-set-key (kbd "M-b") 'switch-to-buffer)
  ;; (global-set-key (kbd "M-f") 'find-file)
  ;; (global-set-key (kbd "M-s") 'save-buffer)
  ;; (global-set-key (kbd "M-o") 'other-window)
  ;; (global-set-key (kbd "C-x C-b") 'switch-to-buffer)
  (load-theme 'manoj-dark)
  (set-frame-font "Liberation Mono-13")
  (setq inhibit-startup-screen t)
  (add-hook 'focus-out-hook 'garbage-collect)
  (if (display-graphic-p)
      (progn
        (show-paren-mode 1)
        )))

(add-to-list 'load-path "~/.emacs.d/better-defaults")
(require 'better-defaults)

; (setq inferior-lisp-program "/usr/bin/sbcl")
(setq inferior-lisp-program "/usr/bin/clisp")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq slime-contribs '(slime-fancy))


;; (add-to-list 'load-path "~/.emacs.d/evil")
;; (require 'evil)
;; (evil-mode 1)

; (require 'package)
; 
; (add-to-list 'package-archives
;   '("melpa" . "https://melpa.org/packages/") t)
; (package-initialize)
; 
; (unless package-archive-contents
;   (package-refresh-contents))
; 
; (setq my-packages '(intero
;                     better-defaults
;                     geiser
;                     paredit))
; 
; (dolist (p my-packages)
;   (unless (package-installed-p p)
;     (package-install p)))
; 
; (require 'better-defaults)
; (add-hook 'haskell-mode-hook 'intero-mode)
; 

; (setq slime-contribs '(slime-fancy))
