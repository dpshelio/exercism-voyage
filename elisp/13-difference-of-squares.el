;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun square (number)
  (* number number)
  )

(setq numbers '(1 2 3))
(defun sum-of-squares (number)
  "Sum of the squares: 1² + 2² + 3² + ..."
  (apply
   '+
   ;; `(,@(cl-mapcar ;; This all `(,@ is not needed
   (cl-mapcar
        'square
        (number-sequence 1 number)
        ;; )
    )
   )
  )

(defun square-of-sum (number)
  "Sum of the squares: (1 + 2 + 3 + ...)²"
  (square
   (apply
    '+
    (number-sequence 1 number)
    )
   )
  )

(defun difference (number)

  (- (square-of-sum number)
     (sum-of-squares number)
     )

  )

;; (number-sequence 1 10)
;; (square-of-sums 10)
;; (sum-of-squares 10)
;; (difference  10)

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
