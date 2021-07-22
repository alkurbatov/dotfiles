;;; terminal.el --- configuration settings for embedded terminal.

;;; Code:
(global-set-key (kbd "C-x `") '(lambda ()  (interactive) (ansi-term "/bin/zsh")))
(setq shell-file-name "/bin/zsh") ;; use zsh shell by default

(defun inject-hotkeys-hook ()
  ;; Support word removal by C-w key.
  (define-key term-raw-map (kbd "C-w")
    (lambda () (interactive) (term-send-raw-string "\e\d"))
    )
 )

(add-hook 'term-mode-hook 'inject-hotkeys-hook)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt) ;; hide entered passwords

;; terminal.el ends here.
