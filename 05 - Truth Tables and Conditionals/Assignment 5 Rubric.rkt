;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 5 Rubric|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 5 - Truth Tables and Cond
Submit on Google Classroom by the end of class.

If a question asks you to make a function,
it must follow the complete design recipe
including a purpose statement, signature
and appropriate tests to recieve full credit
|#

; ALL TRUTH TABLES should be graded
; as +1 point per correct answer
; anything with a # was part of the
; original assignment

; Question 1
; Complete the following truth table:
#|
---------------------
| P | Q | (and P Q) |
| #t| #t|     T      |
| #t| #f|     F      |
| #f| #t|     F      |
| #f| #f|     F      |
---------------------
|#

; Question 2
; Complete the following truth table:

#|
-------------------------------------
| P | Q | (not P) | (and (not P) Q)) |
| #t| #t|     F    |         F         |
| #t| #f|     F    |         F         |
| #f| #t|     T    |         T         |
| #f| #f|     T    |         F         |
--------------------------------------
|#

; Question 3
; Complete the following truth table:

; NOTE: Only grade the final row, as the first
; two were done in the previous problems.
#|
--------------------------------------------------------
| P | Q | (and P Q) | (not P) | (or (not P) (and P Q)) |
| #t| #t|     T      |     F    |             T           |
| #t| #f|     F      |     F    |             F           |        
| #f| #t|     F      |     T    |             T           |       
| #f| #f|     F      |     T    |             T           |        
--------------------------------------------------------
|#

#| Question 5:
Make a function called "num-cond" that takes in 2 numbers.
If the first number is bigger, subtract the two numbers.
If the second number is bigger, multiply the two numbers.
If they are the same number, simply return that number.
|#

; Subtracts two numbers if the first is bigger,
; multiplies them if the second is bigger,
; and returns the number if the are the same.
; num-cond: Number Number -> Number
(define (num-cond n1 n2)
  (cond
    [(> n1 n2) (- n1 n2)]
    [(< n1 n2) (* n1 n2)]
    [else n1]))
(check-expect (num-cond 3 2) 1)
(check-expect (num-cond 2 3) 6)
(check-expect (num-cond 3 3) 3)

#|
+2 point for a purpose statement
+2 point for a signature
+1 point for using "cond"
+1 point for checking if n1 > n2
+1 point for subtracting if so
+1 point for checking if n1 < n2
+1 point for multiplying if so
+1 point for an else case that returns n1 or n2
+2 point for testing the > case
+2 point for testing the < case
+2 point for testing the = case
|#

#| Question 6:
Make a function called "super-cond" that takes in 3 numbers.
If all three numbers are negative, return 0
If the first two numbers are negative, return 1
If the first and third numbers are negative, return 2.
If the second and third numbers are negative, return 3.
If all of the numbers are positive, return the product of all 3 numbers.
|#

; Does what the block above says
; super-cond: Number Number Number -> Number
(define (super-cond n1 n2 n3)
  (cond
    [(and (negative? n1) (negative? n2) (negative? n3)) 0]
    [(and (negative? n1) (negative? n2)) 1]
    [(and (negative? n1) (negative? n3)) 2]
    [(and (negative? n2) (negative? n3)) 3]
    [else (* n1 n2 n3)]))
(check-expect (super-cond -1 -2 -3) 0)
(check-expect (super-cond -1 -2 3) 1)
(check-expect (super-cond -1 2 -3) 2)
(check-expect (super-cond 1 -2 -3) 3)
(check-expect (super-cond 1 2 3) 6)

#|
+2 points for a purpose statement
+2 points for a signature of Number Number Number -> Number
+1 point for each correct case (total 5)
+1 point for testing each case (total 5)
|#
#|

|#

#| Bonus Question:
Make a function called "vowel-check" that takes in 1 string.
If the function contains a vowel, return the first vowel the string contains.
If the function contains no vowels, return "No Vowels".

For example,
(vowel-check "airplane") -> "a"
(vowel-check "bear") -> "e"
(vowel-check "xyz") -> "No Vowels"
|#

; Checks if a word contains vowels
; vowel-check: String -> String
(define (vowel-check str)
  (cond
    [(string-contains? "a" str) "a"]
    [(string-contains? "e" str) "e"]
    [(string-contains? "i" str) "i"]
    [(string-contains? "o" str) "o"]
    [(string-contains? "u" str) "u"]
    [else "No Vowels"]))
(check-expect (vowel-check "airplane") "a")
(check-expect (vowel-check "etc") "e")
(check-expect (vowel-check "idk") "i")
(check-expect (vowel-check "ok") "o")
(check-expect (vowel-check "us") "u")
(check-expect (vowel-check "xyz") "No Vowels")

; NOTE: This function won't work as intended
; in the description due to short circuiting.
; For example, "bear" will actually return
; "a" instead of "e" since the program sees
; "a" first. A simple implementation will
; suffice for the extra credit.

#|
+2 points for a purpose statement
+2 points for a signature of String -> String
+1 point for correct case of using string-contains? (5 total)
+1 point for else case
+1 point for each correct test (6 total)
|#