;;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-

; coding は基本 UTF-8
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

; バックアップしない
(setq auto-save-defalut nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)
(setq delete-auto-save-files t)
(setq make-backup-files nil)
; samba でパーミッション変わる対策．バックアップしないから意味無い？
(setq backup-by-copying t)

; emacsclient を使う
(if (locate-library "server")
    (progn
      (load-library "server")
      (server-start)))

; スタートアップ時の表示抑制
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

; vbell 止める
(setq visible-bell nil)
; beep 止める
(setq ring-bell-function '(lambda ()))

; デフォルトのタブ幅は 4
(setq-default tab-width 4)
; タブやめてスペース使う
(setq-default indent-tabs-mode nil)

; タイトル表示
(setq frame-title-format
      (format "Emacs@%s : %%f" (system-name)))

; 行・桁を表示する
(line-number-mode t)
(column-number-mode t)
(setq linum-format "%5d")
; 時間も表示する
(setq display-time-string-forms
      '(month "/" day "(" dayname ")" 24-hours ":" minutes))
(display-time)

; フリンジに行番号を常に表示したい
(require 'linum)
(global-linum-mode t)

; カーソルの点滅を抑制する
(blink-cursor-mode 0)
; 括弧をハイライトする
(show-paren-mode t)
; マーク位置をハイライトする
(transient-mark-mode t)

; スクロール
(setq scroll-step 1)
(setq scroll-conservatively 4)
(setq scroll-preserve-screen-position t)
(setq mouse-yank-at-point t)
; やたらと最後に空行が増えていくのが嫌だ
(setq next-line-add-newlines nil)

; 置換
(global-set-key "\C-cr" 'replace-string)

; SHIFT + 矢印で選択可能にする
(pc-selection-mode t)

; リージョンを C-h で削除
(delete-selection-mode 1)

; yes,no を y,n で選べるように
(fset 'yes-or-no-p 'y-or-n-p)

; *.gz を読みたい
(auto-compression-mode t)

; スクリプトの場合は自動で実行属性を付ける
(add-hook 'after-save-hook
          '(lambda ()
             (save-restriction
               (widen)
               (if (string= "#!" (buffer-substring 1 (min 3 (point-max))))
                   (let ((name (buffer-file-name)))
                     (or (char-equal ?. (string-to-char (file-name-nondirectory name)))
                         (let ((mode (file-modes name)))
                           (set-file-modes name (logior mode (logand (/ mode 4) 73)))
                           (message (concat "Wrote " name " (+x)"))))
                     )))))

; バッファを復元する
; http://www.hasta-pronto.org/archives/2008/01/30-0235.php
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)
(define-key ctl-x-map "R" 'resume)                      ; C-x R で復元
(define-key ctl-x-map "K" 'wipe)                        ; C-x K で Kill
(add-hook 'kill-emacs-hook 'save-current-configuration) ; 終了時に保存
