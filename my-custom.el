;; Remove scrollbars, menu bars, and toolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Wind-move
(global-set-key (kbd "C-c C-j") 'windmove-left)
(global-set-key (kbd "C-c C-k") 'windmove-down)
(global-set-key (kbd "C-c C-l") 'windmove-up)
(global-set-key (kbd "C-c C-;") 'windmove-right)

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'sunburst t)

;; Mode line
(require 'smart-mode-line)
(sml/setup)
(sml/apply-theme 'dark)

;; Hook to delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
(windmove-default-keybindings)

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

;; Line numbers
(setq linum-format "%d ")
;;(add-hook 'prog-mode-hook 'linum-mode)

;; Highlight current line
(global-hl-line-mode)

;; Highlight parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)
(require 'paren)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#def")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)


;; set keys for Apple keyboard, for emacs in OS X
(setq mac-command-modifier 'super) ; make cmd key do Super
(setq mac-option-modifier 'meta) ; make opt key do Meta
(setq mac-control-modifier 'control) ; make Control key do Control
(setq fn-function-modifier 'hyper)  ; make Fn key do Hyper

;; Interect with Mac OS X buffer
(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(global-set-key (kbd "H-c") 'pbcopy)
(global-set-key (kbd "H-v") 'pbpaste)
(global-set-key (kbd "H-x") 'pbcut)
