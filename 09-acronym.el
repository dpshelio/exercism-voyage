;;; acronym.el --- Acronym (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)
(defun separate-letters (word)
  (car (split-string word "" t))
  )

(defun acronym (sentence)
    (cl-reduce
     'concat
     `(,@(cl-mapcar 'separate-letters (split-string (upcase sentence) "[ \f\t\n\r\v-]+")))
    )
  )

(provide 'acronym)
;;; acronym.el ends here


(setq words '("some" "words" "are" "here"))
(cl-mapcar #'separate-letters words)
(setq phrase "Buy One get One Free")
(acronym "Buy One get One Free")
