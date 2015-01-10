(add-hook 'after-init-hook '(lambda ()
			      (load "~/.emacs.d/my-custom.el")
			      ))

(load "~/.emacs.d/my-loadpackages.el")
(load "~/.emacs.d/my-functions.el")
(load "~/.emacs.d/ruby.el")
(load "~/.emacs.d/rails.el")


;; Disable autosave and back-up
(setq auto-save-default nil)
(setq make-backup-files nil)
