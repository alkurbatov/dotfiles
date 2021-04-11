(setq
  backup-directory-alist '((".*" . "~/.emacs.d/backups/"))
  auto-save-file-name-transforms '((".*" "~/.emacs.d/backups/" t))
  require-final-newline t ;; always add newline at the end of a file
  kill-ring-max 100
  linum-format "%d " ;; add delemeter between line numbers and code
)

(load-theme 'wombat) ;; change colortheme
(global-linum-mode 1) ;; always show line numbers
(menu-bar-mode -1) ;; hide the menu bar
(tool-bar-mode -1) ;; hide the tool bar
(global-font-lock-mode t) ;; turn on font-locking globally

(kill-buffer "*scratch*") ;; we don't use this buffer

;; Tweak abbrev mode.
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)

;; Tweak bookmarks.
(setq
  bookmark-default-file "~/.emacs.d/bookmarks"
  bookmark-save-flag 1  ;; save bookmarks after each entry
)

(setq
  calendar-week-start-day 1 ;; start week from Monday in the calendar
  calendar-date-style 'european ;; use the DD/MM/YYYY format for the diary dates
)

;; Spelling.
(setq
  ispell-program-name "aspell"
  ispell-dictionary "american"
)

;; Enable mouse support in iTerm2.
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)
(put 'scroll-left 'disabled nil)

;; Better autocompletion.
(use-package helm)
(use-package helm-ag)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; Search in a line like in Vim.
(use-package avy)
(global-set-key (kbd "M-g f") 'avy-goto-char-in-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)

;; Enable snippets.
(use-package yasnippet)
(setq yas-snippet-dirs '("~/emacs.d/snippets"))

;; Multiple cursors editing.
(use-package multiple-cursors)
(global-set-key (kbd "C-c f") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c b") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-f") 'mc/mark-all-like-this)

;; Expand region.
(use-package expand-region)
(global-set-key (kbd "C-x r e") 'er/expand-region)
(global-set-key (kbd "C-x r c") 'er/contract-region)

;; Enable intellisence.
(use-package flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Tweak errors and warnings display style.
(set-face-background 'flycheck-error "#660000")
(set-face-foreground 'flycheck-error nil)
(set-face-background 'flycheck-warning "#331800")
(set-face-foreground 'flycheck-warning nil)

;; Trim trailing whitespaces on changed lines
(use-package ws-butler)
(add-hook 'prog-mode-hook #'ws-butler-mode)
