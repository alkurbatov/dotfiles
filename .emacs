(setq package-archives '(("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (require 'package)
  (package-refresh-contents)
  (package-install 'use-package)
)

(require 'use-package)
;; If a package cannot be installed, try 'M-x package-refresh-contents'.
(setq use-package-always-ensure t) ;; always precheck that package installed

;; Function for loading config files by name.
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load (expand-file-name file "~/.emacs.d/config/") nil t))

(load-user-file "bash.el")
(load-user-file "core.el")
(load-user-file "cpp.el")
(load-user-file "dired.el")
(load-user-file "docker.el")
(load-user-file "git.el")
(load-user-file "jinja2.el")
(load-user-file "js.el")
(load-user-file "json.el")
(load-user-file "markdown.el")
(load-user-file "projectile.el")
(load-user-file "python.el")
(load-user-file "r.el")
(load-user-file "restclient.el")
(load-user-file "terminal.el")
(load-user-file "vue.el")
(load-user-file "yaml.el")

;; Settings created using customize.
(setq custom-file "~/.emacs.d/config/customize.el")
(load-user-file "customize.el")
