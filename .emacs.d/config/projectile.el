(use-package ag)

;; See the detailed user manual at:
;; https://docs.projectile.mx/projectile/index.html
(use-package projectile)
(projectile-mode +1)

(setq projectile-indexing-method 'hybrid)

(use-package helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)

(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)

(setq projectile-auto-discover nil)

(projectile-register-project-type 'npm '("package.json")
  :project-file "package.json"
  :compile "npm install"
  :test "npm test"
  :run "npm start"
  :test-suffix ".spec")
