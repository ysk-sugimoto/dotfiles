;;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-

; coding 上書き
(set-terminal-coding-system 'sjis)
(set-keyboard-coding-system 'sjis)
(set-selection-coding-system 'sjis)
(set-file-name-coding-system 'sjis)

; IME の on/off でカーソルの色を変える
(add-hook 'mw32-ime-on-hook
          (lambda () (set-cursor-color "brown"))) ; on
(add-hook 'mw32-ime-off-hook
          (lambda () (set-cursor-color "black"))) ; off

; 起動時ウィンドウ
(setq initial-frame-alist '((width . 140) (height . 60)))

; 半透明化パッチ（動きが重くなる？）
; http://homepage.mac.com/matsuan_tamachan/emacs/TransparencyPatch.html
;(setq default-frame-alist
;      (append (list '(alpha . (95 95))) default-frame-alist))

; color-theme
; http://www.emacswiki.org/cgi-bin/wiki?ColorTheme
; https://gna.org/projects/color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-taming-mr-arneson)

;;; フォント設定
(require 'ntemacs-font)

; VL Gothic + Consolas
(setq ntemacs-font-encode-family-list-vlgothic
      '((ascii . "Consolas*")
        (cyrillic-iso8859-5 . "Consolas*")
        (japanese-jisx0208 . "VL ゴシック*")
        (katakana-jisx0201 . "VL ゴシック*")
        (chinese-gb2312 . "Microsoft Yahei*")
        (chinese-big5-1 . "Microsoft JhengHei*")
        (korean-ksc5601 . "Malgun Gothic*")
        (mule-unicode-0100-24ff . "Arial Unicode MS*")
        (mule-unicode-2500-33ff . "Arial Unicode MS*")
        (mule-unicode-e000-ffff . "Arial Unicode MS*")))
(fixed-width-create-fontset "vlgothic"
                            ntemacs-font-defined-sizes
                            ntemacs-font-encode-family-list-vlgothic)

; Meiryo + Consolas
(setq ntemacs-font-encode-family-list-meiryo
      '((ascii . "Consolas*")
        (cyrillic-iso8859-5 . "Consolas*")
        (japanese-jisx0208 . "Meiryo*")
        (katakana-jisx0201 . "Meiryo*")
        (chinese-gb2312 . "Microsoft Yahei*")
        (chinese-big5-1 . "Microsoft JhengHei*")
        (korean-ksc5601 . "Malgun Gothic*")
        (mule-unicode-0100-24ff . "Arial Unicode MS*")
        (mule-unicode-2500-33ff . "Arial Unicode MS*")
        (mule-unicode-e000-ffff . "Arial Unicode MS*")))
(fixed-width-create-fontset "meiryo"
                            ntemacs-font-defined-sizes
                            ntemacs-font-encode-family-list-meiryo)

; default-frame に適用
(add-to-list 'default-frame-alist '(font . "fontset-vlgothic"))
; initial-frame に適用
(add-to-list 'initial-frame-alist '(font . "fontset-vlgothic"))
