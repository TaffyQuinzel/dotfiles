(setq package-archives '(("melpa" . "http://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))
(require 'package)
(package-initialize)

(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; fix fish inside emacs
(add-hook 'term-mode-hook
	  (lambda ()
	    (toggle-truncate-lines)
	    (setq term-prompt-regexp "^.*❯❯❯ ")
	    (make-local-variable 'mouse-yank-at-point)
	    (setq mouse-yank-at-point t)
	    (make-local-variable 'transient-mark-mode)
	    (setq transient-mark-mode nil)
	    (setq yas-dont-activate t)))

;; Stop littering everywhere with save files, put them somewhere
(setq backup-directory-alist '((".*" . "~/.emacs.d/backups")))
;; (setq auto-save-file-name-transforms '((".*" ,"~/.emacs.d/autosaves" t)))

;; set color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'hopscotch t)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
  )

(require 'evil)
;;window movement
(define-key evil-normal-state-map (kbd "C-w h") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-w t") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-w n") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-w s") 'evil-window-right)

;;start evil mode
(evil-mode 1)
(setq evil-dvorak-funky-h-and-t 0)
(setq evil-dvorak-use-for-web-mode 0)
(require 'evil-dvorak)
(global-evil-dvorak-mode 1)

;; enable bracket pairs
(show-paren-mode 1)
;; display line numbers
(require 'relative-linum)
(global-linum-mode t)
;; display column/row of cursor in mode-line
(column-number-mode t) 

;; status line config
(require 'telephone-line)
(setq telephone-line-lhs
      '((evil   . (telephone-line-evil-tag-segment))
	(accent . (telephone-line-vc-segment
		   telephone-line-erc-modified-channels-segment
		   telephone-line-process-segment))
	(nil    . (telephone-line-minor-mode-segment
		   telephone-line-buffer-segment))))
(setq telephone-line-rhs
      '((nil    . (telephone-line-misc-info-segment))
	(accent . (telephone-line-major-mode-segment))
	(evil   . (telephone-line-airline-position-segment))))
(telephone-line-mode 1)


;; set color theme
;; (require 'color-theme)

;; set indent guide
(require 'indent-guide)
(indent-guide-global-mode)
(set-face-foreground 'indent-guide-face "deeppink1")
					;(setq indent-guide-recursive t)
(setq indent-guide-char "|")

;; make scrolling usable
(setq scroll-step 1)
(setq scroll-margin 7)
(setq scroll-conservatively 7)

;; auto modes
(add-to-list 'auto-mode-alist '("\\.nl\\'" . newlisp-mode))
(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.fish\\'" . fish-mode))

;; auto indent for fish files on save
(add-hook 'fish-mode-hook (lambda ()
			    (add-hook 'before-save-hook 'fish_indent-before-save)))

(require 'fsharp-mode)
 
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'evil-numbers)
;;(global-set-key (kbd "C-+") 'evil-numbers/inc-at-pt)
;;(global-set-key (kbd "C-'-'") 'evil-numbers/dec-at-pt)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(set-face-attribute 'default nil
		    :family "Source Code Pro for Powerline Regular"
		    :height 110
		    :weight 'normal)

;; automatically edit file as root 
(defadvice find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
	       (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
