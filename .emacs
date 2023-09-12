(setq make-backup-files nil) 
(setq truncate-partial-width-windows t)
(setq truncate-lines t)
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq-default tab-width 4)
(setq auto-save-default nil)
(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2

 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode t)  ; use spaces only if nil
 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq mode-require-final-newline nil)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(defun open-previous-line (arg)
      "Open a new line before the current one. 
     See also `newline-and-indent'."
      (interactive "p")
      (beginning-of-line)
      (open-line arg)
      (when newline-and-indent
        (indent-according-to-mode)))

(defun open-next-line (arg)
      "Move to the next line and then opens a line.
    See also `newline-and-indent'."
      (interactive "p")
      (end-of-line)
      (open-line arg)
      (forward-line 1)
      (when newline-and-indent
        (indent-according-to-mode)))

(global-set-key (kbd "M-o") 'open-next-line)
(global-set-key (kbd "C-w") 'open-previous-line)



(defvar newline-and-indent t
  "Modify the behavior of the open-*-line functions to cause them to autoindent.")

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(global-set-key [f1] 'eshell)
(global-set-key [f2] 'compile)
(global-set-key [f4] 'rgrep)
(global-set-key [f3] 'eval-buffer)
(global-set-key [?\C-\;] 'back-to-indentation)
(global-set-key [?\C-o] 'other-window)
(global-set-key [?\C-'] 'end-of-line)
(global-set-key [?\C-,] 'beginning-of-buffer)
(global-set-key [?\C-/] 'goto-line)
(global-set-key [?\M-l] 'forward-word)
(global-set-key [?\M-h] 'backward-word)
(global-set-key [?\C-.] 'end-of-buffer)
(global-set-key [?\C-0] 'delete-window)
(global-set-key [?\C-1] 'delete-other-windows)
(global-set-key [?\C-2] 'split-window-vertically)
(global-set-key [?\C-3] 'split-window-horizontally)
(global-set-key [?\C-z] 'undo)
(global-set-key [?\C-l] 'forward-char)
(global-set-key [?\C-h] 'backward-char)
(global-set-key [?\C-j] 'next-line)
(global-set-key [?\C-k] 'previous-line)
(global-set-key [?\C-p] 'kill-line)



;; Add this to your init.el to make packages from MELPA available through package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'tree-sitter)
(require 'tree-sitter-langs)
(require 'ein)
(global-tree-sitter-mode)

(tree-sitter-require 'python)
(tree-sitter-require 'css)
(tree-sitter-require 'bash)
(tree-sitter-require 'html)
(tree-sitter-require 'java)
(tree-sitter-require 'json)
(tree-sitter-require 'c)
(tree-sitter-require 'tsx)
(tree-sitter-require 'typescript)
(tree-sitter-require 'php)
(tree-sitter-require 'cpp)


(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;;(load-theme 'solarized-dark t)


(add-to-list 'default-frame-alist '(font . "Ubuntu Mono-11" ))
(set-face-attribute 'default t :font "Ubuntu Mono-11" )

;; (custom-set-faces
;;  '(default ((t (:foreground "#d3b58d" :background "#072626"))))
;; 	'(custom-group-tag-face ((t (:underline t :foreground "lightblue"))) t)
;; 	'(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))) t)
;; 	'(font-lock-builtin-face ((t nil)))
;; 	'(font-lock-comment-face ((t (:foreground "#3fdf1f"))))
;; 	'(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
;; 	'(font-lock-string-face ((t (:foreground "#0fdfaf"))))
;; 	'(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "c8d4ec"))))
;; 	'(font-lock-warning-face ((t (:foreground "#504038"))))
;; 	'(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
;; 	'(mode-line ((t (:inverse-video t))))
;; 	'(region ((t (:background "blue"))))
;; 	'(widget-field-face ((t (:foreground "white"))) t)
;; 	'(widget-single-line-field-face ((t (:background "darkgray"))) t))


 
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :background "#24283b" :foreground "#d3b58d" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "SRC" :family "Iosevka Curmfly"))))
;;  '(custom-comment-tag ((t (:foreground "magenta"))))
;;  '(custom-face-tag ((t (:inherit default))))
;;  '(custom-group-tag-face ((t (:underline t :foreground "lightblue"))))
;;  '(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))))
;;  '(font-lock-builtin-face ((t (:foreground "#657b83"))))
;;  '(font-lock-comment-face ((t (:foreground "#276908"))))
;;  '(font-lock-constant-face ((t (:foreground "#859900"))))
;;  '(font-lock-function-name-face ((t (:foreground "#7aa2f7"))))
;;  '(font-lock-keyword-face ((t (:foreground "#f7768e"))))
;;  '(font-lock-string-face ((t (:foreground "#9ece6a"))))
;;  '(font-lock-variable-name-face ((t (:foreground "#859900"))))
;;  '(fringe ((t (:background "#24283b"))))
;;  '(highlight ((t (:background "olive drab" :foreground "magenta"))))
;;  '(mode-line ((t (:background "#070327" :foreground "#d3b58d" :box (:line-width -1 :style released-button)))))
;;  '(widget-button ((t (:weight normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(solarized-dark-high-contrast))
 '(custom-safe-themes
   '("7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default))
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(ein auctex color-theme-sanityinc-tomorrow zenburn-theme solarized-theme tree-sitter-langs gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
