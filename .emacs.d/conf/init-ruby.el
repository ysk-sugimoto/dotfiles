;;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-

(require 'ruby-mode)
;(autoload 'ruby-mode "ruby-mode" "Ruby mode" t)
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")

(add-to-list 'auto-mode-alist '("\\.rb$"   . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rjs$"  . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

; インデントは 2 スペース，深いインデントはしない
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             (setq indent-tabs-mode nil)
             (setq ruby-indent-level 2)
             (setq ruby-deep-indent-paren-style nil)
             ))

; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
