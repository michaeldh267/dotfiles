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

; (setq inferior-lisp-program "/usr/bin/sbcl")
(setq inferior-lisp-program "/usr/bin/clisp")
(ignore-errors (load (expand-file-name "~/quicklisp/slime-helper.el")))
(setq slime-contribs '(slime-fancy))


;; (add-to-list 'load-path "~/.emacs.d/evil")
;; (require 'evil)
;; (evil-mode 1)

(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives
;; 	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq my-packages '(better-defaults
		    flycheck
		    paredit))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(global-flycheck-mode)

(cua-mode t)
