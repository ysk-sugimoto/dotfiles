;;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-

(require 'css-mode)

(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

(add-hook 'css-mode-hook '(lambda () (setq css-indent-level 4)))
