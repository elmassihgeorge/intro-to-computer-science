;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 3 Rubric|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 3 - Design Recipe
Submit on Google Classroom by the end of class.
|#

; Question 1:
; What does code style consist of?
; Why is style important?

; +1 point for anything about style being how our code looks
; +1 point for anything about style making our code easier to read

; Question 2:
; Rewrite the following block of code
; adhering to proper Racket style

#|
(define
(
firstFunction num1 num2
)
  (
    * num1 (+ num2 1))
  )
|#

; +1 point for moving the parenthesis to the correct spots
; +1 point for renaming the function to "first-function"

; Question 3:
; What is a predicate function?
; What symbol should all predicate function names end with?

; +1 point for a predicate being a function that returns true or false / a boolean
; +1 point for "?"

; Question 4:
#|
What are the signatures of the following functions?
- sqrt
- string-length
- substring
- string=?
|#

; +1 point for Number -> Number
; +1 point for String -> Number
; +1 point for String Number Number -> String or String Number -> String
; +1 point for String String -> Boolean

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

; This function append the first half of the first string to the
; second half of the second string
; string-glue: String String -> String
(define (string-glue str1 str2)
  (string-append (substring str1 0 (/ (string-length str1) 2))
                 (substring str2 (/ (string-length str2) 2))))
(check-expect (string-glue "George" "Harrison") "Geoison")

; +2 points for a purpose statement
; +2 points for a signature of String String -> String
; +1 point for defining a function called string-glue
; +1 point for using string-append
; +1 point for creating the first substring
; +1 point for creating the second substring
; +4 points for any functional check-expects

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

; Takes in three strings and returns
; the length of the longest one
(define (max-length-string str1 str2 str3)
  (max (string-length str1)
       (string-length str2)
       (string-length str3)))
(check-expect (max-length-string "abc" "a" "cb") 3)

; +2 points for a purpose statement
; +2 points for a signature
; +2 points for using max
; +2 points for calling string-length 3 times
; +4 points for any functioning check-expects

; Bonus Questions
#|
Write a function called "number-check"
that takes in 3 numbers, multiplies
them together and returns if
the product is greater than 100

Use the complete design recipe and
sufficiently test your function
|#

; Multiplies 3 numbers and checks if the result is greater than 100
; number-check: Number Number Number -> Boolean
(define (number-check n1 n2 n3)
  (> (* n1 n2 n3) 100))
(check-expect (number-check 10 10 10) #t)
(check-expect (number-check 1 2 3) #f)

; +2 points for a purpose statement
; +2 points for a signature of Number Number Number -> Boolean
; +1 point for defining the function
; +1 point for multiplying n1, n2, n3
; +2 points for checking if the product is greater than 100
; +2 points for a test checking the #true case
; +2 points for a test checking the #false case
