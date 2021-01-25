(use-package js2-mode)
(use-package json-mode)

;; Replace builtin JavaScript mode.
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-hook 'js2-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)
    (setq js2-basic-offset 2)
  )
)
