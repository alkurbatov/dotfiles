(use-package cmake-font-lock)

(add-hook 'c++-mode-hook
  (lambda ()
    (c-set-style "bsd")
    (setq indent-tabs-mode nil)
    (setq c-basic-offset 4)

    ;; Setup flycheck.
    ;; Do C-c ! s for manual selection of a checker.
    ;; Do C-c ! v to verify which checkers used and in which order.
    (add-to-list 'flycheck-checkers 'c/c++-clang)
    (add-to-list 'flycheck-checkers 'c/c++-cppcheck)

    ;; Default include paths.
    (setq flycheck-clang-include-path (list "/opt/local/include"))

    (add-to-list 'flycheck-clang-args "-Wno-pragma-once-outside-header")
  )
)
