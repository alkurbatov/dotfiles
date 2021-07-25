;;; terminal.el --- configuration settings for embedded terminal.

;;; Code:
(global-set-key (kbd "C-x `") '(lambda ()  (interactive) (ansi-term "/bin/zsh")))

(local-set-key (kbd "M-p") 'term-send-up)
(local-set-key (kbd "M-n") 'term-send-down)

(setq shell-file-name "/bin/zsh") ;; use zsh shell by default

(defun inject-hotkeys-hook ()
  ;;; Support word removal by C-w key.
  (define-key term-raw-map (kbd "C-w")
    (lambda () (interactive) (term-send-raw-string "\e\d")))
)

;;; Don't whine if there is a terminal open.
(defun set-no-process-query-on-exit ()
  (let ((proc (get-buffer-process (current-buffer))))
  (when (processp proc)
    (set-process-query-on-exit-flag proc nil)))
)

(add-hook 'term-exec-hook 'set-no-process-query-on-exit)
(add-hook 'term-mode-hook 'inject-hotkeys-hook)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt) ;; hide entered passwords

;; terminal.el ends here.
