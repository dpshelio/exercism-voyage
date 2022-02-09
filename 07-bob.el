;; Bob answers 'Sure.' if you ask him a question, such as "How are you?".

;; He answers 'Whoa, chill out!' if you YELL AT HIM (in all capitals).

;; He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

;; He says 'Fine. Be that way!' if you address him without actually saying anything.

;; He answers 'Whatever.' to anything else.

;; Bob's conversational partner is a purist when it comes to written communication and always follows normal rules regarding sentence punctuation in English.


;; Sure. "How are you?"


(defun response-for (question)
  (cond
   ((and
     (string= (car (last (split-string question "" t))) "?")
     (string= question (upcase question)))
    "Calm down, I know what I'm doing!"
    )
   ((string= (car (last (split-string question "" t))) "?")  "Sure.")
   ((= (length (split-string question)) 0) "Fine. Be that way!")
   ((string= question (upcase question)) "Whoa, chill out!")
   (t "Whatever.")
   )
  )

(response-for "How are you?")
(response-for "TELL ME!")
(response-for "       ")
(response-for "Go away, Bob!")
(response-for "Shit")
(car (last (split-string "asdfas" "" t)))
