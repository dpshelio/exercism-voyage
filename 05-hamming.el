;; (string= "A" "A")

;; (setq parent '("A" "B"))
;; (setq child '("C" "D"))

;; (if (string= (car parent) (car child)) 0 1)


(defun iterate-hd (parent child)
        (cond
         ((cl-endp parent) 0)
         (t
          (+ (if (string= (car parent) (car child)) 0 1)
             (iterate-hd (cdr parent) (cdr child)))
          )
         )
        )


(defun hamming-distance (parent child)
        (cond
         ((= (length parent) (length child))
          (iterate-hd (split-string parent "" t) (split-string child "" t))
          )
         (t nil)
         )
        )

;; (hamming-distance "AC" "BD")
