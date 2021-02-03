(global-set-key (kbd "C-x `") '(lambda ()  (interactive) (ansi-term "/bin/zsh")))
(setq shell-file-name "/bin/zsh") ;; use zsh shell by default

;; Tweak embedded shell.
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt) ;; hide entered passwords
