(use-package ag)
(use-package projectile)

(projectile-mode +1)

(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)

(setq
  projectile-project-search-path '("~/work/src/git.acronis.com" "~/work/src/github.com/")
  projectile-auto-discover nil
)

(projectile-register-project-type
  'npm '("package.json")
    :project-file "package.json"
    :compile "npm install"
    :test "npm test"
    :run "npm start"
    :test-suffix ".spec")
