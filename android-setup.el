
(add-hook 'java-mode-hook
          (lambda ()
            (add-to-list (make-local-variable 'paredit-space-for-delimiter-predicates)
                            (lambda (_ _) nil))
            (paredit-mode)
            (define-key paredit-mode-map (kbd "{") 'paredit-open-curly-java-style)
            (define-key java-mode-map (kbd  "C-c g") 'gradle-assemble-debug)))


(defun gradle-assemble-debug ()
  (interactive)
  (compile "gradle assembleDebug"))

(provide 'android-setup)
