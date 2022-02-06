(defun help-to-roman (number factor letter)
  (append
   (make-list (/ number factor) letter)   (to-roman-step (% number factor))
   )
)

;;; (help-to-roman 10 1 "I")

(defun to-roman-step (number)

  (cond
   ((>= number 1000)   (help-to-roman number 1000 "M"))
   ((>= number 500) (help-to-roman number 500 "D"))
   ((>= number 100) (help-to-roman number 100 "C"))
   ((>= number 50) (help-to-roman number 50 "L"))
   ((>= number 10) (help-to-roman number 10 "X"))
   ((>= number 5) (help-to-roman number 5 "V"))
   ((>= number 1) (help-to-roman number 1 "I"))
   )
)

(defun to-roman (number)
  (cl-reduce
   'concat
   `,@(to-roman-step number))
  )

(to-roman 2000)
(to-roman 2500)
(to-roman 2700)
(to-roman 2750)
(to-roman 2780)
(to-roman 2789)
(to-roman 1)

(setq myletter "f")
(make-string 3 f)
