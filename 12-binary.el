;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:

(defun by-two (a)
  (* 2 a)
  )


(defun bin-seq-dec (binseq prev)

  (cond
   ((not (or (= 1 (car binseq)) (= 0 (car binseq))))
    (throw 'not-binary 1)
    )
   ((= (length binseq) 1) (append prev binseq))
   (
    (bin-seq-dec
     (cdr binseq)
     (cl-mapcar
      #'by-two
      (append
       prev
       (list (car binseq)))
      ))
    )

   )
  )

(defun to-decimal (binnum)

  (apply
   #'+
   (bin-seq-dec
    (cl-mapcar
     #'string-to-number
     (split-string binnum "" t)
     )

    '()
    )
   )
  )


(provide 'binary)
;;; binary.el ends here

(by-two 3)
(split-string "010001" "" t)
(append '(1 2 3) '(2))
(string-to-number "1")
(by-two 0)

(to-decimal "10")
