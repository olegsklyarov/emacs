(require 'package)

(add-to-list 'package-archives
	'("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)


; check if the packages is installed; if not, install it.
(mapc (lambda (package) (or (package-installed-p package)
	(if (y-or-n-p (format "Package %s is missing. Install it? " package))
		(package-install package)))) '(mocha magit))


(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x w") 'whitespace-mode)
(global-whitespace-mode 0)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(set-face-attribute 'default nil :height 120)




(defun sudo-edit-current-file (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (let ((position (point)))
        (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))
        (goto-char position))))

(global-set-key (kbd "\C-x!")       'sudo-edit-current-file)


(defun swap-buffers-in-windows ()
  "Put the buffer from the selected window in next window"
  (interactive)
  (let* ((this (selected-window))
         (other (next-window))
         (this-buffer (window-buffer this))
         (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)
    (select-window other)
    )
  )

(defun toggle-window-split ()
  "Switches from a horizontal split to a vertical split and vice versa."
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "\C-c s")      'swap-buffers-in-windows)
(global-set-key (kbd "\C-c f")      'toggle-window-split)
(global-set-key (kbd "\C-c g")      'goto-line)


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
 '(whitespace-indentation ((t (:foreground "dim gray")))))
