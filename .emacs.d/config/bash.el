(add-hook 'sh-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)
    (setq tab-width 4)

    ;; Setup flycheck.
    ;; Do C-c ! s for manual selection of a checker.
    ;; Do C-c ! v to verify which checkers used and in which order.
    (add-to-list 'flycheck-checkers 'sh-shellcheck)
  )
)
