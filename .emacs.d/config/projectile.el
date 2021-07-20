;;; projectile.el --- configuration settings for project management.

;;; Code:
(use-package ag)
(use-package helm)
(use-package helm-ag)
(use-package projectile)
(use-package helm-projectile)

;; Integrate Helm.
(helm-mode 1)

(global-set-key (kbd "C-x b") #'helm-mini)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "M-x") #'helm-M-x)

;; See the detailed user manual at:
;; https://docs.projectile.mx/projectile/index.html
(projectile-mode +1)
(helm-projectile-on)

(setq projectile-auto-discover nil)
(setq projectile-completion-system 'helm)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'hybrid)
(setq projectile-switch-project-action 'helm-projectile)

(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)

;; Setup project types.
(projectile-register-project-type 'npm '("package.json")
  :project-file "package.json"
  :compile "npm install"
  :test "npm test"
  :run "npm start"
  :test-suffix ".spec")

;; projectile.el ends here.
