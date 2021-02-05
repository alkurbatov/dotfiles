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
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; Search in a line like in Vim.
(use-package avy)
(global-set-key (kbd "M-g f") 'avy-goto-char-in-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
