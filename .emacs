(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

; http://vserver1.cscs.lsa.umich.edu/~rlr/Misc/emacs_tabs.htm
(global-set-key (kbd "TAB") 'self-insert-command);
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-whitespace-mode 0)

(set-face-attribute 'default nil :height 110)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-week-start-day 1)
 '(custom-enabled-themes (quote (misterioso)))
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )