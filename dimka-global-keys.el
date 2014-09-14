(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-i") 'ido-goto-symbol)
(global-set-key (kbd "M-o") 'open-previous-line)
(global-set-key (kbd "C-o") 'open-next-line)
(global-set-key (kbd "C-c C-t") 'run-mocha-tests)
(global-set-key (kbd "<f3>") 'switch-to-previous-buffer)
(global-set-key (kbd "<f8>") 'other-window)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "s-j") 'windmove-down)
(global-set-key (kbd "s-k") 'windmove-up)
(global-set-key (kbd "s-h") 'windmove-left)
(global-set-key (kbd "s-l") 'windmove-right)

(global-set-key (kbd "M-j") 'evil-normal-state)

(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
(define-key evil-normal-state-map "\C-u" 'evil-scroll-up)
;;; C-c as general purpose escape key sequence.
   ;;;
(defun my-esc (prompt)
  "Functionality for escaping generally.  Includes exiting Evil insert state and C-g binding. "
  (cond
   ;; If we're in one of the Evil states that defines [escape] key, return [escape] so as
   ;; Key Lookup will use it.
   ((or (evil-insert-state-p) (evil-normal-state-p) (evil-replace-state-p) (evil-visual-state-p)) [escape])
   ;; This is the best way I could infer for now to have C-c work during evil-read-key.
   ;; Note: As long as I return [escape] in normal-state, I don't need this.
   ;;((eq overriding-terminal-local-map evil-read-key-map) (keyboard-quit) (kbd ""))
   (t (kbd "C-g"))))
(define-key key-translation-map (kbd "C-c") 'my-esc)
;; Works around the fact that Evil uses read-event directly when in operator state, which
;; doesn't use the key-translation-map.
(define-key evil-operator-state-map (kbd "C-c") 'keyboard-quit)
;; Not sure what behavior this changes, but might as well set it, seeing the Elisp manual's
;; documentation of it.
(set-quit-char "C-c")

;; undefine this key because it messes up paredit-kill (and other kill commands)
;; (define-key evil-insert-state-map "\C-k" nil)
;; ;; and this one to normally delete char
;; (define-key evil-insert-state-map "\C-d" nil)

(provide 'dimka-global-keys)
