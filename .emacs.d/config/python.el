;;; python.el --- configures Python support.

;;; Code:
(use-package elpy)
(use-package blacken)

(elpy-enable)

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-black-fix-code nil t)))

;; python.el ends here.
