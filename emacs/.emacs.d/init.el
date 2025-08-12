;; disable the annoying bits
(setf backup-inhibited t
      auto-save-default nil
      auto-save-list-file-prefix (locate-user-emacs-file "local/saves")
      inhibit-startup-message t
      initial-scratch-message nil
      echo-keystrokes 0.15
      delete-active-region nil
      disabled-command-function nil
      custom-file (make-temp-file "emacs-custom")
      large-file-warning-threshold (- (* 512 1024 1024) 1) ; >=512MB
      gc-cons-threshold (* 32 1024 1024)
      ring-bell-function (lambda ()))

;; no GUI elements
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'set-horizontal-scroll-bar-mode) (set-horizontal-scroll-bar-mode nil))
(blink-cursor-mode -1)

;; sensible clipboard things
(setf select-enable-clipboard nil
      select-enable-primary t
      mouse-drag-copy-region t
      mouse-yank-at-point t)

;; lexical binding by default, must be delayed since
;; Emacs sets this to NIL after initialization
(run-at-time 0 nil (lambda ()
		     (setq-default lexical-binding t)))

;; tabs are scary
(setq-default indent-tabs-mode nil)

;; I hate typing and I love accidents
(defalias 'yes-or-no-p 'y-or-n-p)

;; I literally never want this
(bind-key "C-z" nil)

;; I only care about magit
(setf vc-handled-backends nil
      vc-follow-symlinks t)

;; stop scrolling by large chunks!
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      scroll-conservatively most-positive-fixnum
      scroll-preserve-screen-position t)

(setf use-package-always-ensure t)

;; set font size based on screen width
(set-face-attribute 'default nil
                    :height (let ((width (display-pixel-width)))
                              (or
                               (when (> width 2560) 180)
                               (when (> width 1920) 160)
                               120)))

(load-theme 'wombat)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; appearance things
(global-display-line-numbers-mode t)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode nil)
(when (version<= "29.1" emacs-version)
  (pixel-scroll-precision-mode))

(bind-keys
 :map global-map
 ("C-c x" . kill-this-buffer))

(use-package magit :defer)

(setf user-full-name "Jake Grossman"
      user-mail-address "jake.grossman@smashingstacks.com")
