;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

; 1. we need a table:

;; eggs (1)
;; peanuts (2)
;; shellfish (4)
;; strawberries (8)
;; tomatoes (16)
;; chocolate (32)
;; pollen (64)
;; cats (128)

;; The pattern is 2^x: x=0: eggs; x=1: peanuts; ...; x=7: cats; x=8...

; 2. representing the value in binary gives us 1s for the positions

;;; Code:

;; (format "%b" 5) ; this doesn't exist!
;;
;; From https://stackoverflow.com/a/20577329/1087595
;; (defun int-to-binary-string (i)
;;   "convert an integer into it's binary representation in string format"
;;   (let ((res ""))
;;     (while (not (= i 0))
;;       (setq res (concat (if (= 1 (logand i 1)) "1" "0") res))
;;       (setq i (lsh i -1)))
;;     (if (string= res "")
;;         (setq res "0"))
;;     res))

;; (logand 202212 1)

(defun return-allergen (value allergies)

  (cond
   ((or (cl-endp allergies) (= 0 value)) '())
   (t (if (= 1 (logand value 1))
          (cons (car allergies) (return-allergen (/ value 2) (cdr allergies)))
          (return-allergen (/ value 2) (cdr allergies)))
          )
   )
  )


(defun allergen-list (value)

  (return-allergen
   value
   '("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")
   )
  )

(defun product-in-list (product other_product)
  (string= product other_product)
  )

(defun allergic-to-p (value product)
  (cl-mapcar
  (apply-partially #'product-in-list product)
  ;; (seq-contains
   (allergen-list value)
   ;; product
  )
)
(provide 'allergies)
;;; allergies.el ends here
;; (setq
;; )
(allergen-list 0)
(allergic-to-p 8 "eggs")

(setq allergies '("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats"))


(cons (car allergies) (cdr allergies))
