;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 3 - Design Recipe
Submit on Google Classroom by the end of class.
|#

; Question 1:
; What does code style consist of?
; Why is style important?

; Question 2:
; Rewrite the following block of code
; adhering to proper Racket style


(define
(
firstFunction num1 num2
)
  (
    * num1 (+ num2 1))
  )


; Question 3:
; What is a predicate function?
; What symbol should all predicate function names end with?

; Question 4:
#|
What are the signatures of the following functions?
- sqrt
- string-length
- substring
- string=?
|#

; Question 5:
#|
Make a function called "string-glue" that takes in two strings,
and appends the first half of the first string
to the second half of the second string.

For example:
(string-glue "Edward" "Knight") -> "Edwght"

To receieve full credit, you must use the entire design recipe
consisting of:
- A purpose statement
- A signature
- An implementation that adheres to Racket style
- Sufficient tests
|#

; Question 6
#|
Write a function called "max-length-string"
that takes in 3 strings and prints the
length of the longest string

For example,
(max-length-string "Joe" "Shmoe" "Road") -> 5

Use the complete design recipe and
sufficiently test your function
|#

; Bonus Question
#|
Write a function called "number-check"
that takes in 3 numbers, multiplies
them together and returns if
the product is greater than 100

Use the complete design recipe and
sufficiently test your function
|#