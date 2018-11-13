;;; cloudy-savefile-mode.el --- 
;; 
;; Filename: cloudy-savefile-mode.el
;; Description: Major mode for viewing Cloudy save files
;; Author: William Henney
;; Maintainer: William Henney
;; Created: Tue Nov 13 13:42:38 2018 (-0600)
;; Version: 0.1
;; Package-Requires: (csv-mode)
;; Last-Updated: Tue Nov 13 13:43:47 CST 2018
;;           By: William Henney
;;     Update #: 0
;; URL: 
;; Doc URL: 
;; Keywords: 
;; Compatibility: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; See README.org
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


(define-derived-mode cloudy-savefile-mode
  csv-mode "Cloudy save file"
  "Major mode for viewing Cloudy save files"
  ;; Prevent accidental edits
  (setq buffer-read-only t)
  ;; Real comments have space following the "#" - we don't want the
  ;; header line to be parsed as a comment
  (csv-set-comment-start "# ")
  ;; Align fields
  (setq csv-align-style 'auto)
  (setq csv-align-padding 1)
  (csv-align-fields nil (point-min) (point-max))
  (view-mode))

(add-hook 'cloudy-savefile-mode-hook
          '(lambda ()
             ;; Turn of flyspell if present to avoid unsightly wiggly
             ;; lines
             (when (featurep 'flyspell) (flyspell-mode-off))
             ;; Avoid wrapping - must be done in hook so as to undo
             ;; effects of text-mode-hook
             (setq truncate-lines t)))

(provide cloudy-savefile-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; cloudy-savefile-mode.el ends here
