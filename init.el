(require 'package)

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
    (load-theme 'misterioso)))

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

;; under .emacs.d/ run: hg clone https://bitbucket.org/lyro/evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
