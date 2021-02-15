(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))

(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            ;; (dired-omit-mode 1)
            (dired-hide-details-mode 1)
            ))

(auto-compression-mode 1) ;; automatically decompress/compress files opened in Dired

;; Allow dired to delete or copy dir.
(setq dired-recursive-copies (quote always)) ; “always” means no asking
(setq dired-recursive-deletes (quote top)) ; “top” means ask once

;; Copy from one dired dir to the next dired dir shown in a split window.
(setq dired-dwim-target t)
