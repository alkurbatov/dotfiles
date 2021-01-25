(use-package yaml-mode)

(add-hook 'yaml-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)
    (setq tab-width 2)
  )
)
