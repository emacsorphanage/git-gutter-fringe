;;; git-gutter-fringe.el --- Fringe version of git-gutter.el

;; Copyright (C) 2013 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/syohex/emacs-git-gutter-fringe
;; Version: 0.12
;; Package-Requires: ((git-gutter "0.42") (fringe-helper "20130427.1608"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(eval-when-compile
  (require 'cl))

(require 'git-gutter)
(require 'fringe-helper)

(defface git-gutter-fr:modified
    '((t (:foreground "magenta" :weight bold)))
  "Face of modified"
  :group 'git-gutter)

(defface git-gutter-fr:added
    '((t (:foreground "green" :weight bold)))
  "Face of added"
  :group 'git-gutter)

(defface git-gutter-fr:deleted
    '((t (:foreground "red" :weight bold)))
  "Face of deleted"
  :group 'git-gutter)

(defcustom git-gutter-fr:side 'left-fringe
  "Side of show diff information"
  :type '(choice (const :tag "Right Fringe" right-fringe)
                 (const :tag "Left Fringe" left-fringe))
  :group 'git-gutter)

(fringe-helper-define 'git-gutter-fr:added nil
  "...XX..."
  "...XX..."
  "...XX..."
  "XXXXXXXX"
  "XXXXXXXX"
  "...XX..."
  "...XX..."
  "...XX...")

(fringe-helper-define 'git-gutter-fr:deleted nil
  "........"
  "........"
  "........"
  "XXXXXXXX"
  "XXXXXXXX"
  "........"
  "........"
  "........")

(fringe-helper-define 'git-gutter-fr:modified nil
  "........"
  "..XXXX.."
  "..XXXX.."
  "..XXXX.."
  "..XXXX.."
  "..XXXX.."
  "..XXXX.."
  "........")

(defvar git-gutter-fr:bitmap-references nil)
(make-variable-buffer-local 'git-gutter-fr:bitmap-references)
(put 'git-gutter-fr:bitmap-references 'permanent-local t)

(defsubst git-gutter-fr:select-sign (type)
  (case type
    (modified 'git-gutter-fr:modified)
    (added    'git-gutter-fr:added)
    (deleted  'git-gutter-fr:deleted)))

(defsubst git-gutter-fr:select-face (type)
  (case type
    (modified 'git-gutter-fr:modified)
    (added    'git-gutter-fr:added)
    (deleted  'git-gutter-fr:deleted)))

(defun git-gutter-fr:view-region (type start-line end-line)
  (let* ((sign (git-gutter-fr:select-sign type))
         (face (git-gutter-fr:select-face type))
         (beg (git-gutter:line-to-pos start-line))
         (end (if (eq type 'deleted) beg (git-gutter:line-to-pos end-line)))
         (reference (fringe-helper-insert-region
                     beg end sign git-gutter-fr:side face)))
    (push reference git-gutter-fr:bitmap-references)))

(defun git-gutter-fr:init ())

(defun git-gutter-fr:view-diff-info (diffinfo)
  (let ((start-line (plist-get diffinfo :start-line))
        (end-line (plist-get diffinfo :end-line))
        (type (plist-get diffinfo :type)))
    (git-gutter-fr:view-region type start-line end-line)))

(defun git-gutter-fr:view-diff-infos (diffinfos)
  (when git-gutter-fr:bitmap-references
    (git-gutter:clear))
  (save-excursion
    (mapc 'git-gutter-fr:view-diff-info diffinfos)))

(defun git-gutter-fr:clear-overlay (reference)
 (fringe-helper-remove reference))

(defun git-gutter-fr:clear ()
  (mapc 'git-gutter-fr:clear-overlay git-gutter-fr:bitmap-references)
  (setq git-gutter-fr:bitmap-references nil))

(setq git-gutter:init-function      'git-gutter-fr:init
      git-gutter:view-diff-function 'git-gutter-fr:view-diff-infos
      git-gutter:clear-function     'git-gutter-fr:clear)

(provide 'git-gutter-fringe)

;;; git-gutter-fringe.el ends here
