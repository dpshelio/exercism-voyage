;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:
(defun replace_symbols (sentence)


  )

(defun remove_quote (word)
  (cond
   ((s-ends-with? "'" word) (remove_quote (substring word 0 -1)))
   ((s-starts-with? "'" word) (remove_quote (substring word 1 nil)))
   ((and (not (s-ends-with? "'" word)) (not (s-starts-with? "'" word)))
    word
    )
   (t (remove_quote word))
   )
  )


(defun replace_quote (sentence)
  "Replaces quotes when used as 'in something' and not as he's"
  ;; \w'\s or \s'\w but not \w'\w
  (cond
   ((cl-endp sentence) (list))
   (t
    (append
     (list (remove_quote (car sentence)))
     (replace_quote (cdr sentence))
     )
    )
   )
  )

(defun myeq_str (str1 str2)
  (string= str1 str2)
)

(defun count_words (sentence)

  (cond
   ((cl-endp sentence) nil)
   (t
    (append
     (list
      (cons (car sentence) (+ (length (remove-if-not  (apply-partially #'myeq_str (car sentence)) (cdr sentence))) 1))
     )
      (count_words (remove-if (apply-partially #'myeq_str (car sentence)) (cdr sentence)))
    )
    )
  )
  )

  (defun word-count (sentence)

    ;; lowercase the sentence
    ;; replace symbols by spaces: ?![]().,;\n\t"
    ;; replace quotes but not apostrophes
    ;; count the uniqes
    (count_words
      (replace_quote
       (remove-if
        'string-empty-p
        (split-string (downcase sentence) "[ \f\t\n\r\v!?:;,\".&~$%^&@]+")
        )
       )
     )
    )

  (provide 'word-count)
;;; word-count.el ends here


;; (setq sentence "This is, a 'sentence' - \"do you know?\" \n He said to you!")

;; (setq word "'sentence'")

;; (remove_quote word)
;; (setq sentrep (replace_quote '("this" "is'" "'some")))
;; (word-count sentence)

;; (list (car sentrep)  "bas")


;; (append (list (cons "a" "b")) (list (cons "ad" "sdf")))
(string-empty-p "asd")
