;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

;;; -----------------------------------------------------------------------
;;; At first I had understood that we wanted the ones that are the reverse!
;;; -----------------------------------------------------------------------

(defun reverse-list (&rest alist)
  (cond
   ((endp alist) nil)
   (t
    (append (reverse-list (cdr alist)) (car alist))   )
   )
  )

(defun reverse-word (word)
  "What the label says. Thanks to https://emacs.stackexchange.com/a/12295 I could understand what to use!"
  (cl-reduce ;; Only way to "expand" (unfolding) the content of the stuff we want to concatenate. Better than apply for the reasons exposed above
   'concat
   `(,@(reverse-list (split-string word "" t))) ;; Reading the docs understood you can use ` and ,@ to execute bits and pass other bits
   )
  )

(defun reverse-for (word candidates)
  "Returns the anagram of the input word if it's one of the candidates"
  (cond
   ((cl-endp candidates)
    nil
    )
   ((string= (reverse-word word) (car candidates))
    (car candidates)
    )
   (t
    (reverse-for word (cdr candidates))
    )
   )
  )

;;; -----------------------------------------------------------------------
;;; Then... I understood what an anagram was!
;;; -----------------------------------------------------------------------

(defun same-elements (list another-list)
  " This will delete elements from one list that are in the other; problem: if list has repeated elements will break on the second one as delete will remove both at once."
  (cond
   ((and (cl-endp list) (cl-endp another-list)) t)
   ((and (= (length list) (length another-list)))
    (same-elements (cdr list)
                   (delete (car list) another-list)
                   )
    )
   (t nil)
   )
  )



;;; -----------------------------------------------------------------------
;;; As expected, that same-elements fail with elements that are repeated
;;;                   and it doesn't consider the case of the characters.
;;; -----------------------------------------------------------------------


(defun word-sorted-down (word)
  "Helper function to sort all the characters of a word in lower case"
  (cl-reduce
   'concat
   `,@(sort (split-string (downcase word) "" t) 'string-collate-lessp)
   )
  )

(defun same-elements-str (word another-word)
  "Compares whether two strings are equal after being sorted - nil if they are the same"
  (cond
   ((string= word (downcase another-word)) nil)
   (t
    (string=
     (word-sorted-down word)
     (word-sorted-down another-word)
     )
    )
   )
  )

;;; (same-elements-str "word" "Dlow")


(defun anagrams-for (word candidates)
  "returns a list with the good candidates that are anagrams"
  (cond
   ((cl-endp candidates) nil)
   (t (delq nil (nconc (list (if (same-elements-str word (car candidates))
                                 (car candidates)
                               ))
                       (anagrams-for word (cdr candidates)))))
   )
  )

;;; (anagrams-for "word" '("drow" "Rowd" "hellow"))
;;; (anagrams-for "banana" '("banana" "Banana"))



(provide 'anagram)
;;; anagram.el ends here
