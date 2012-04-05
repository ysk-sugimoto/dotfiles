;;; -*- Mode: Emacs-Lisp; Coding: utf-8 -*-

;;; load path を追加する
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

(add-to-load-path "~/.emacs.d/elisp"
                  "~/.emacs.d/conf")

;;; 各種設定を読み込む
(load "init-global")
(load "init-ruby")
(load "init-js2")
(load "init-css")
(load "init-color-theme")
;(load "init-erlang")
;(load "init-git")