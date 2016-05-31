(require 'package)

;; emacs lisp intro - Writing Defuns

(defun toggle-gui ()
  "toggles the gui. duh!"
  (interactive)
  (if menu-bar-mode
      (gui-off)
    (gui-on)))

(defun gui-off ()
  (progn
    (menu-bar-mode 0)
    (tool-bar-mode 0)
    (scroll-bar-mode 0)))

(defun gui-on ()
  (progn
    (menu-bar-mode 1)
    (tool-bar-mode 1)
    (scroll-bar-mode 1)))

(defun my-keys ()
  "Get your own keys!"
  (progn
    (global-set-key (kbd "M-b") 'switch-to-buffer)
    (global-set-key (kbd "M-f") 'find-file)
    (global-set-key (kbd "M-s") 'save-buffer)
    (global-set-key (kbd "M-o") 'other-window)
    (global-set-key (kbd "C-x C-b") 'switch-to-buffer)))

(defun my-colors ()
  "Get your own colors!"
  (progn
    (global-hl-line-mode 1)
    (set-face-background 'hl-line "#030")
    (set-background-color "black")
    (set-foreground-color "#0e0")
    (set-face-attribute
     'region nil
     :background "#666"
     :foreground "#fff")))

(defun my-fonts ()
  "Get your own fonts!"
  (set-frame-font "Liberation Mono-14"))


(progn
  (gui-off)
  (setq undo-limit 10000)
  (setq undo-strong-limit 10000)
  (my-fonts)
  (my-colors)
  (my-keys)
  (setq inhibit-startup-screen t))



(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(progn
  (package-initialize)  
  (let ((my-packages '(
                       better-defaults
                       paredit
                       idle-highlight-mode
                       ido-ubiquitous
                       find-file-in-project
                       magit
                       smex
                       go-mode
                       )))
    (dolist (p my-packages)
      (when (not (package-installed-p p))
        (package-install p)))))

(setq inferior-lisp-program "sbcl"
      lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      slime-startup-animation nil
      )
(load (expand-file-name "/home/michael/quicklisp/slime-helper.el"))
(require 'slime-autoloads)
;; Also setup the slime-fancy contrib
(add-to-list 'slime-contribs 'slime-fancy)

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

(put 'erase-buffer 'disabled nil)

;; get your own vim!
(require 'evil)
;;(evil-mode 1)

(defun strip-nl (s e)
  (interactive "r")
  (save-restriction
    (goto-char (point-min))
    (narrow-to-region s e)
    (while (re-search-forward "\n" nil t)
      (replace-match " " nil t))))
