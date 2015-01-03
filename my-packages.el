(require 'cl)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar required-packages
  '(
    auto-complete
    rvm
    ag
    magit
    exec-path-from-shell
    smart-mode-line
    enh-ruby-mode
    grizzl
    projectile
    smartparens
    rainbow-mode
    robe
    highlight-indentation
    yasnippet
    flyspell
    rinari
    dash-at-point
    multiple-cursors
    textmate
    web-mode
    scss-mode
    ) "a list of packages to ensure are installed at launch.")


;; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
	when (not (package-installed-p p)) do (return nil)
	finally (return t)))

;; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)

  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")

  (dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p))))
