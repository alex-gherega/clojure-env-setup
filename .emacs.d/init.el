;; MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f36b0a4ecb6151c0ec4d51d5cafc94de326b4659aaa7ac64a663e38ebc6d71dc" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Themes ===================================================================
(load-theme 'zenburn t)

;; keybindings =========================================================
(global-set-key [C-f11] 'cider-jack-in)

;; Clojure ==================================================================
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;(autoload 'enable-eldoc-mode "eldoc" "Turn on documentation display of Lisp code." t)

(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'eldoc-mode)
(add-hook 'cider-repl-mode-hook       #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook       #'eldoc-mode)

;; auto-complete
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(setq company-idle-delay nil) ; never start completions automatically
;(global-set-key (kbd "M-TAB") #'company-complete)
                                        ; use M-TAB, a.k.a. C-M-i, as manual trigger
(global-set-key (kbd "M-TAB") #'company-indent-or-complete-common)

;; rainbow-delimiters
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook #'rainbow-delimiters-mode)

;; paren mode
(show-paren-mode 1)

;; highlighting certain words
(defun highlight-todos () (font-lock-add-keywords nil
                '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t))))

(defun highlight-goodies () (font-lock-add-keywords nil
                '(("\\<\\(DONE\\|CONT\\|DEBUG\\)" 1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'highlight-todos)
(add-hook 'prog-mode-hook 'highlight-goodies)
(put 'erase-buffer 'disabled nil)

;; stop opening the error buffer in emacs
(setq cider-show-error-buffer nil)
