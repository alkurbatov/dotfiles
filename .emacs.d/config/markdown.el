(if (version< emacs-version "25.1")
    (message "Package markdown-mode not supported.")
  (use-package markdown-mode
    :mode (("README\\.md\\'" . gfm-mode)
           ("\\.md\\'" . markdown-mode)
           ("\\.markdown\\'" . markdown-mode))
    :init (setq markdown-command "multimarkdown")
  )
)
