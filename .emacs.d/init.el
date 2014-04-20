
;; better-defaults
;; https://github.com/technomancy/better-defaults
(progn
  (ido-mode t)
  (setq ido-enable-flex-matching t)
  (set-default-font "DejaVu Sans Mono-10")

  (defalias 'yes-or-no-p 'y-or-n-p)
  ;; (load-theme 'manoj-dark t)   
  (setq inhibit-splash-screen t)

  (menu-bar-mode -1)
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
  
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)
  
  (require 'saveplace)
  (setq-default save-place t)
  
  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  
  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)
;; I can't stop hitting this on my way to "C-x b", so switching it with...
;; (global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
;; Ack. Find a better keybind for this.
  
  '(blink-cursor-mode nil)
  '(cursor-type (quote (bar . 2)))
  
  (show-paren-mode 1)
  (setq-default indent-tabs-mode nil)
  (setq x-select-enable-clipboard t
        x-select-enable-primary t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))



(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)


;; Elisp
;; (require 'rainbow-delimiters) ; not installed yet
;; (global-rainbow-delimiters-mode)

;; OCaml // Tuareg Mode
;; http://www.emacswiki.org/emacs/TuaregMode
(add-to-list 'load-path "~/.elisp/tuareg-mode")
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'tuareg-imenu-set-imenu "tuareg-imenu" 
  "Configuration of imenu for tuareg" t)
(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist 
      (append '(("\\.ml[ily]?$" . tuareg-mode)
		("\\.topml$" . tuareg-mode))
	      auto-mode-alist))

;; Haskell Mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


;; Linux Kernel Style
;; Uses tabs instead of spaces!
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
	 (column (c-langelem-2nd-pos c-syntactic-element))
	 (offset (- (1+ column) anchor))
	 (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/projects/c/")
                                       filename))
                (setq indent-tabs-mode t)
                (c-set-style "linux-tabs-only")))))


;; Always load the shell
(shell)
