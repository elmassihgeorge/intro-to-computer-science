;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Assignment 12 Rubric|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 12 - Local and Lambda
Submit on Google Classroom by the end of class.

If a question asks you to make a function,
it must follow the complete design recipe
including a purpose statement, signature
and appropriate tests to recieve full credit

If a question asks you to make a structure,
it must follow the complete design recipe
including a definition, interpretation,
and appropriate examples to recieve full credit
|#

#| Question 1
Remake the (has-large-numbers?) function
from assignment 11 using list abstractions
AND a lambda expression
|#

; Checks if a list contains any numbers greater than 10
; has-large-numbers? : List-of-Numbers -> Boolean
(define (has-large-numbers? lon)
  (local
    [(define (gt-10 num)
       (> num 10))]
    (ormap gt-10 lon)))
(check-expect (has-large-numbers? '()) #f)
(check-expect (has-large-numbers? (list 1 2 3)) #f)
(check-expect (has-large-numbers? (list 10 20 30)) #t)

; +2 points for a purpose statement
; +2 points for a signature of List-of-Numbers -> Boolean
; +2 points for a successful implementation using local
; to define a helper function within the function's scope
; +2 points for sufficient tests (one empty, one non-empty true, one non-empty false)

#| Question 2
Create a function that filters a list of
numbers to include numbers that are both
odd and negative. Use a lambda expression.

For example,
(filter-neg-odds (list -1 2 -3 -4 5)) -> (list -1 -3)
|#

; Filters a list to only contain negative odd numbers
; filter-neg-odds : List-of-Numbers -> List-of-Numbers
(define (filter-neg-odds lon)
  (filter (λ (num) (and (negative? num) (odd? num))) lon))
(check-expect (filter-neg-odds (list 1 -2 -3 4 -5)) (list -3 -5))

; +2 points for a purpose statement
; +2 points for a signature of List-of-Numbers -> List-of-Numbers
; +2 points for a successful implementation using a lambda expression
; +2 points for sufficient tests

#| Question 3
Create a function that takes in a list of strings
and maps the following function to the list:

If the string is 3 or less characters long,
turn it into "Short Word"

If the string is between 3 and 8 characters long,
turn it into "Medium Word"

If the string is longer than 8 characters long,
turn it into "Long Word".

Create a local scope and define your helper
function within that local scope.
|#

; Converts strings in a list to long, medium, or short
; string-convert : List-of-Strings -> List-of-Strings
(define (string-convert los)
  (local
    [(define (string-checker str)
       (cond
         [(<= (string-length str) 3) "Short Word"]
         [(<= (string-length str) 8) "Medium Word"]
         [else "Long Word"]))]
    (map string-checker los)))
(check-expect (string-convert (list "abc" "defge" "thinkings"))
              (list "Short Word" "Medium Word" "Long Word"))

#| Question 4
A company wants to create a program
that will check if a passphrase inputted
by the user is correct.

The company wants to make sure the
passphrase is only accessible in this function,
so that the passphrase can't be found
in any other part of the code.

Create a funcion that takes in a string
and checks if it matches the passphrase.

Define your passphrase within a local scope.
|#

; Checks if a passphrase is correct
; check-passphrase : String -> Boolean
(define (check-passphrase str)
  (local
    [(define passphrase "fishbowl")]
    (string=? str passphrase)))
(check-expect (check-passphrase "thinkings") #f)
(check-expect (check-passphrase "fishbowl") #t)

; +2 points for a purpose statement
; +2 points for a signature of String -> Boolean
; +2 points for a successful implementation defining the passphrase in a local scope
; +2 points for sufficient tests (one true, one false)