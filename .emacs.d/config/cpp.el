(use-package cmake-font-lock)

(add-hook 'c++-mode-hook
  (lambda ()
    (c-set-style "bsd")
    (setq indent-tabs-mode nil)
    (setq c-basic-offset 4)
  )
)
