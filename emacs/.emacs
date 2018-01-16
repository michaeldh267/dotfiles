(require 'cl-lib)
(progn
  ;; (global-set-key (kbd "M-b") 'switch-to-buffer)
  ;; (global-set-key (kbd "M-f") 'find-file)
  ;; (global-set-key (kbd "M-s") 'save-buffer)
  ;; (global-set-key (kbd "M-o") 'other-window)
  ;; (global-set-key (kbd "C-x C-b") 'switch-to-buffer)
  (load-theme 'tsdh-dark)
  (set-frame-font "Liberation Mono-12")
  (show-paren-mode 1)
  (setq inhibit-startup-screen t)
  (if (display-graphic-p)
      (progn
        (show-paren-mode 1)
        )))

;; scheme goop
(setq inferior-lisp-program "/usr/bin/mit-scheme")


;; If you don't have MELPA in your package archives:
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq my-packages '(intero
		    better-defaults
		    geiser
		    paredit))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(require 'better-defaults)
(add-hook 'haskell-mode-hook 'intero-mode)

; GC when window loses focus
(add-hook 'focus-out-hook 'garbage-collect)
