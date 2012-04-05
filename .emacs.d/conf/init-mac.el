;;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-

; coding 上書き
(set-keyboard-coding-system 'sjis-mac)
(set-selection-coding-system 'sjis-mac)
(set-clipboard-coding-system 'sjis-mac)

; http://www.pqrs.org/~tekezo/macosx/doc/unix/
; Ctrl/Cmd/Option がシステムに渡されるのを防ぐ
(setq mac-pass-control-to-system nil)
(setq mac-pass-command-to-system nil)
(setq mac-pass-option-to-system nil)
; meta key
(setq mac-command-key-is-meta t)
(setq mac-command-modifier-meta t)
(setq mac-option-modifier 'meta)
; xargs
(setq grep-find-use-xargs 'bsd)
; URL は open に渡す
(setq browse-url-generic-program "open")

; 起動時ウィンドウ
(setq initial-frame-alist '((width . 120) (height . 40)))

; 半透明化
; http://homepage.mac.com/matsuan_tamachan/emacs/TransparencyPatch.html
(setq default-frame-alist
      (append (list '(alpha . (90 90))) default-frame-alist))
