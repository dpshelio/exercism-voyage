(defun rnaconvert (nucl)
  "Converts a DNA nucleotides into its RNA complement"
    (cond
     ((string= nucl "G") "C")
     ((string= nucl "C") "G")
     ((string= nucl "T") "A")
     ((string= nucl "A") "U")
     (t
      (throw 'wrong-letter 1))
  )
)

(defun replace-rna (chain-ls)
  "From a given DNA sequence (as list), produce the RNA complement sequence"
  (cond
   ((cl-endp chain-ls) nil)
   (t
    (append (list (rnaconvert (car chain-ls)))
            (replace-rna (cdr chain-ls))
            )
    )
  )
)

(defun to-rna (chain)
  "From a given DNA strand, calculate its RNA complement"
  (cl-reduce
   'concat
   `(,@(replace-rna (split-string chain "" t)))
   )
  )

(setq elements '("G" "C" "T" "A"))
(replace-rna elements)
(append '("A") "B" "C")
(rnaconvert "G")


(to-rna "GCTA")
