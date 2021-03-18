(use-package add-node-modules-path)
(use-package vue-mode)

(add-hook 'vue-mode-hook
  (lambda ()
    (add-node-modules-path)

    ;; vue-mode uses the original js-mode, because
    ;; js2-mode doesn't work well with mmm-mode.
    (setq indent-tabs-mode nil)
    (setq js-indent-level 2)
    (setq vue-html-tab-width 2)
    (setq css-indent-offset 2)

    ;; Disable ugly regions background color.
    (set-face-background 'mmm-default-submode-face nil)

    ;; Enable lintier.
    (flycheck-add-mode 'javascript-eslint 'vue-mode)
  )
)
