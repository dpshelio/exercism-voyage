;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)

;;; Commentary:

;;; Code:
(defun string-to-power (exp str-number)
  (apply
   '*
   (cl-mapcar
    'string-to-number
    (split-string (make-string exp (string-to-char str-number)) "" t)
    )
   )
  )

(defun armstrong-p (number)

  (= number
     (apply
        '+
        (cl-mapcar
         `(,@(apply-partially #'string-to-power (length (number-to-string number))))
         (split-string (number-to-string number) "" t)
         )
      )
     )

  )



(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here


(apply '+ (cl-mapcar 'string-to-number (split-string (number-to-string 123) "" t))) ;; 6

(cl-mapcar 'string-to-number '("2" "3" "4"))

(string-to-number "2")
(length "123")

(armstrong-p 153)
(string-to-power 10 "2")
