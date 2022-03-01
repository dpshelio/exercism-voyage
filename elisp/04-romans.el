(defun help-to-roman (number factor letter)
  "Helper function to don't repeat the code that to-roman-step uses. How ugly is that this function call its parent?"
  (append
   (make-list (/ number factor) letter)   (to-roman-step (% number factor))
   )
)

;;; (help-to-roman 10 1 "I")

(defun to-roman-step (number)
  "maps the roman numerals with their factors; returns a list"
  (cond
   ((>= number 1000) (help-to-roman number 1000 "M"))
   ((>= number 900) (help-to-roman number 900 "CM"))
   ((>= number 500) (help-to-roman number 500 "D"))
   ((>= number 400) (help-to-roman number 400 "CD"))
   ((>= number 100) (help-to-roman number 100 "C"))
   ((>= number 90) (help-to-roman number 90 "XC"))
   ((>= number 50) (help-to-roman number 50 "L"))
   ((>= number 40) (help-to-roman number 40 "XL"))
   ((>= number 10) (help-to-roman number 10 "X"))
   ((>= number 9) (help-to-roman number 9 "IX"))
   ((>= number 5) (help-to-roman number 5 "V"))
   ((>= number 4) (help-to-roman number 4 "IV"))
   ((>= number 1) (help-to-roman number 1 "I"))
   )
)

(defun to-roman (number)
  "Converts the given number to the roman numeral. Uses to-roman-step to generate a list and return a single string"
  (cl-reduce
   'concat
   `,@(to-roman-step number))
  )


(provide 'roman-numerals)
;;; roman-numerals.el ends here


;; (to-roman 2000)
;; (to-roman 2500)
;; (to-roman 2700)
;; (to-roman 2750)
;; (to-roman 2780)
;; (to-roman 2789)
;; (to-roman 1)
;; (to-roman 1999)
;; (setq myletter "f")
;; (make-string 3 f)
