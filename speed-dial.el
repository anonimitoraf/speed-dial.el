;;; speed-dial.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Rafael Nicdao
;;
;; Author: Rafael Nicdao <https://github.com/anonimito>
;; Maintainer: Rafael Nicdao <nicdaoraf@gmail.com>
;; Created: November 16, 2021
;; Modified: November 16, 2021
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/anonimito/speed-dial
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defvar speed-dial-keymap (make-sparse-keymap))

(defun speed-dial-apply (config)
  "CONFIG is an alist of keybind => file-path. For example:
((\"SPC 0\" . \"~/todos.org\")
 (\"SPC 1\" . \"~/work/report.pdf\")
 (\"C-0\"   . \"~/.doom.d/config.el\"))
"
  (dolist (keybind->file-path config)
    (let ((keybind (car keybind->file-path))
          (file-path (cdr keybind->file-path)))
      (define-key speed-dial-keymap
        (kbd keybind) (lambda ()
                        (interactive)
                        (find-file file-path))))))

(define-minor-mode speed-dial-mode
  "Activates speed-dial-mode"
  :keymap speed-dial-keymap)

(provide 'speed-dial)
;;; speed-dial.el ends here
