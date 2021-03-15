(use-package json-mode)

(add-hook 'json-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)
    (setq js2-basic-offset 2)
  )
)
