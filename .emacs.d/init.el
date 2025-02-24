;; Initialize package system
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure packages are installed
(dolist (package '(evil vterm))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;; Enable evil-mode
(require 'evil)
(evil-mode 1)

;; Configure vterm
(require 'vterm)
(setq vterm-shell (getenv "SHELL"))
(setq vterm-max-scrollback 10000)

(load-theme 'misterioso t)

;; Key binding for quick terminal access
(global-set-key (kbd "C-c t") 'vterm)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Provide the init
(provide 'init)
