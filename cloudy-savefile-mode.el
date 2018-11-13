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
