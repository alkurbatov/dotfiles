(use-package elpy)
(use-package py-autopep8)

(elpy-enable)

(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
