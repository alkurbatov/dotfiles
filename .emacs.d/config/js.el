(use-package add-node-modules-path)
(use-package js2-mode)
(use-package json-mode)

;; Replace builtin JavaScript mode.
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-hook 'js2-mode-hook
  (lambda ()
    (add-node-modules-path)

    (setq indent-tabs-mode nil)
    (setq js2-basic-offset 2)

    ;; Disable js2-mode embedded checker in favor of flycheck.
    (setq js2-mode-show-parse-errors nil)
    (setq js2-mode-show-strict-warnings nil)

    ;; Setup flycheck.
    ;; Do C-c ! s for manual selection of a checker.
    (setq flycheck-checker 'javascript-eslint)
  )
)
