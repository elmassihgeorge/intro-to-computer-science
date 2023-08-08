;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Assignment 11 Rubric|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 11 - List Abstractions
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
Briefly state all of the list abstractions,
and what their purposes are
|#

; fold combines items in a list into one outcome
; ormap tells you if anything in a list satisfies a predicate
; andmap tells you if everything in a list satisfies a predicate
; filter removes items from a list that don't satisfy a predicate
; map applies an operation to everything in a list

; +1 point for each response (5 total)
; note: foldr and foldl are effectively the same

(define MT-LIST '())
(define TEST-LON (list 1 2 3 4 5))
(define TEST-LOS (list "Abc" "Bdfe"))

#| Question 2
Remake the (list-product) function
from assignment 10 using list abstraction.
|#

; Calculates the product of all numbers in a list
; list-product : List-of-Numbers -> Number
(define (list-product lon)
  (foldr * 1 lon))
(check-expect (list-product MT-LIST) 1)
(check-expect (list-product TEST-LON) 120)

; +2 points for a purpose statement
; +2 points for a signature of List-of-Numbers -> Number
; +2 points for a successful implementation using foldl/r
; +2 points for sufficient tests (one empty, one non-empty)

#| Question 3
Remake the (all-caps) function
from assignment 10 using list abstraction
|#

; Sends all strings in a list to uppercase
; all-caps : List-of-String -> List-of-String
(define (all-caps los)
  (map string-upcase los))
(check-expect (all-caps MT-LIST) MT-LIST)
(check-expect (all-caps TEST-LOS) (list "ABC" "BDFE"))

#| Question 4
Remake the (has-large-numbers?) function
from assignment 10 using list abstraction

Hint: You will need to make a helper function
|#

(define (larger-than-10? num)
  (> num 10))

; Checks if a list contains any numbers greater than 10
; has-large-numbers? : List-of-Numbers -> Boolean
(define (has-large-numbers? lon)
  (ormap larger-than-10? lon))
(check-expect (has-large-numbers? MT-LIST) #f)
(check-expect (has-large-numbers? TEST-LON) #f)
(check-expect (has-large-numbers? (list 10 30)) #t)

; +2 points for a purpose statement
; +2 points for a signature of List-of-Numbers -> Boolean
; +2 points for a successful implementation using ormap
; +2 points for sufficient tests (one empty, one non-empty true, one non-empty false)

#| Question 5
Here is the student structure you made in assignment 10:
|# (define-struct student (name id grades)) #|
Remake the (get-gpa) function
from assignment 10 using list abstraction
|#

(define BOB (make-student "Bob" 1 (list 80 70 90)))

; Calculates a student's GPA
; get-gpa : Student -> Number
(define (get-gpa stu)
  (/ (foldr + 0 (student-grades stu))
     (length (student-grades stu))))
(check-expect (get-gpa BOB) 80)