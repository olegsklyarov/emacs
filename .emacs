(require 'package)

(add-to-list 'package-archives
	'("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; check if the packages is installed; if not, install it.
(mapc
 (lambda (package)
   (or (package-installed-p package)
	   (if (y-or-n-p (format "Package %s is missing. Install it? " package))
		   (package-install package))))
 '(php-mode))

; http://vserver1.cscs.lsa.umich.edu/~rlr/Misc/emacs_tabs.htm
(global-set-key (kbd "TAB") 'self-insert-command)
(global-set-key (kbd "<backspace>") 'backward-delete-char)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x w") 'whitespace-mode)

(add-hook 'php-mode-hook
		  (lambda ()
			(setq indent-tabs-mode t)))


(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-whitespace-mode 0)

(set-face-attribute 'default nil :height 120)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-week-start-day 1)
 '(custom-enabled-themes (quote (tango-dark)))
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
