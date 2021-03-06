; add ~/.emacs.d to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq plugins-dir (expand-file-name "lisp" dotfiles-dir))
(add-to-list 'load-path plugins-dir)

(require 'package)
(package-initialize)
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

; require evil mode before dimka-global-keys - it uses it
; to define some mappings
(require 'evil)
(evil-mode 1)

(require 'default-vars)
(require 'dimka-global-keys)
(require 'dimka-functions)
;(require 'thing-edit)
;(require 'android-setup)

(require 'whole-line-or-region)
;(require 'php-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))

; load customisations from this file
; in some cases it is required that it is loded early
;  - for exmaple for Color Theme section below
(setq custom-file "~/.emacs.d/.emacs-custom.el")
(load custom-file)

;; Color Theme
(load-theme 'solarized-light)

;; Uniqify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; Popwin
;(require 'popwin)
;(setq display-buffer-function 'popwin:display-buffer)
;; mark this buffer to be managed by popwin
;(push '("*eshell*" :noselect t :position right :width 50) popwin:special-display-config)

;; JsHint + Flymake
;; (require 'flymake-jshint)
;; (add-hook 'javascript-mode-hook
;;      (lambda () (flymake-mode t)))

;; Clojure
(add-hook 'clojure-mode-hook
          'paredit-mode
          'evil-paredit-mode)

;; Scheme/racket
(add-hook 'scheme-mode-hook
          'paredit-mode)

;; Haskell
(add-hook 'haskell-mode-hook
          'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook
          (lambda () (haskell-indentation-disable-show-indentations)) t)

;; Global modes
(whole-line-or-region-mode)
(show-paren-mode)
(ido-mode)
;(helm-mode 1)
(global-subword-mode 1)

;; Hippie-expand
(setq hippie-expand-try-functions-list
      '(try-expand-all-abbrevs
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name)
      )

;; Ido-mode customizations
;; disable auto searching for files unless called explicitly
(setq ido-auto-merge-delay-time 99999)
(define-key ido-file-dir-completion-map (kbd "C-c C-s")
  (lambda()
    (interactive)
    (ido-initiate-auto-merge (current-buffer))))

;; Generic hook customizations
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; YaSnippet
;; (add-to-list 'load-path (expand-file-name "yasnippet" plugins-dir))
;; (require 'yasnippet)
;; (setq yas/snippet-dirs '("~/.emacs.d/snippets"))
;; (yas/global-mode 1)

;; Auto Pair
;; (add-to-list 'load-path (expand-file-name "autopair" plugins-dir))
;; (require 'autopair)
;; (autopair-global-mode)

;; Fonts
(set-face-attribute 'default nil :font "Terminus-13:weight=bold")
(set-face-attribute 'variable-pitch nil :font "Terminus-13:weight=bold")

;; Turn off all alarms (visual bell, beeping)
(setq ring-bell-function 'ignore)

(add-hook 'after-init-hook '(lambda() (if window-system (set-frame-size (selected-frame) 120 35))))
