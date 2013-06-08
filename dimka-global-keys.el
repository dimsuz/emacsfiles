(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-i") 'ido-goto-symbol)
(global-set-key (kbd "M-o") 'open-previous-line)
(global-set-key (kbd "C-o") 'open-next-line)
(global-set-key (kbd "C-c C-t") 'run-mocha-tests)
(global-set-key (kbd "<f3>") 'switch-to-previous-buffer)
(global-set-key (kbd "<f8>") 'other-window)
(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "M-j") 'evil-normal-state)
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)

(provide 'dimka-global-keys)
