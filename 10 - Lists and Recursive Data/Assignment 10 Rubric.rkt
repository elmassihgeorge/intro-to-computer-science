;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 10 Rubric|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 10 - Lists and Recursion
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
Create the following lists:

- An empty list called MT-LIST
- A list called LIST-1 with 3 cons-ed to MT-LIST
- A list called LIST-2 with 2 cons-ed to LIST-1
- A list called LIST-3 with 1 cons-ed to LIST-2
- A list called "NAMES" with at least 3 names.

|#

(define MT-LIST '())
(define LIST-1 (cons 3 MT-LIST))
(define LIST-2 (cons 2 LIST-1))
(define LIST-3 (cons 1 LIST-2))

(define NAMES (list "Bob" "Joel" "Grace"))

; +1 point for MT-LIST
; +2 points for all steps of LIST-3
; +2 points for NAMES

#| Question 2
Create a function called (list-product)
that takes in a list of numbers
and multiplies all the numbers

For example,
(list-product (list 1 2 3)) -> 6
|#

; Calculates the product of all numbers in a list
; list-product : List-of-Number -> Number
(define (list-product lon)
  (cond
    [(empty? lon) 1]
    [(cons? lon) (*
                  (car lon)
                  (list-product (cdr lon)))]))
(check-expect (list-product MT-LIST) 1)
(check-expect (list-product LIST-3) 6)

; +2 points for a purpose statement
; +2 points for a signature of List-of-Number -> Number
; +2 points for a successful implementation
; +2 points for sufficient tests (one empty, one non-empty)

#| Question 3
Create a function called (all-caps)
that takes in a list of Strings
and returns a new list of Strings
where all the words are fully capitalized

Hint: The function (string-upcase)
send a string to all caps

For example,
(all-caps (list "George" "Potassium")) -> (list "GEORGE "POTASSIUM")
|#

; Sends all strings in a list to uppercase
; all-caps : List-of-String -> List-of-String
(define (all-caps los)
  (cond
    [(empty? los) los]
    [(cons? los) (cons
                  (string-upcase (car los))
                  (all-caps (cdr los)))]))
(check-expect (all-caps MT-LIST) MT-LIST)
(check-expect (all-caps NAMES) (list "BOB" "JOEL" "GRACE"))

; +2 points for a purpose statement
; +2 points for a signature of List-of-String -> List-of-String
; +2 points for a successful implementation
; +2 points for sufficient tests (one empty, one non-empty)

#| Question 4
Create a function called (has-large-numbers?)
that takes in a list of numbers
and returns if the list
contains any numbers greater than 10

For example,
(has-large-numbers? (list 1 2 5 12 41)) -> #true
(has-large-numbers? (list 1 2 4)) -> #false
|#

; Checks if a list of numbers has any numbers greater than 10
; has-large-numbers? : List-of-Number -> Boolean
(define (has-large-numbers? lon)
  (cond
    [(empty? lon) #false]
    [(cons? lon) (or
                  (> (car lon) 10)
                  (has-large-numbers? (cdr lon)))]))
(check-expect (has-large-numbers? MT-LIST) #f)
(check-expect (has-large-numbers? LIST-3) #f)
(check-expect (has-large-numbers? (list 1 2 14)) #t)

; +2 points for a purpose statement
; +2 points for a signature of List-of-Number -> Boolean
; +2 points for a successful implementation
; +2 points for sufficient tests (1 empty, 1 non-empty true, 1 non-empty false)

#| Question 5
Now that we have lists in our toolkit,
we can create a more thorough definition
of a student structure.

Create a new student structure that contains
a name, student id, and a list of grades
that correspond to their classes (ex. 86, 79, 92)

Create at least 2 examples of students
|#

(define-struct student (name id grades))
(define BOB (make-student "Bob" 1 (list 86 79 92)))
(define ED (make-student "Ed" 2 (list 70 60 68)))

#| Question 6
Create a function called (get-gpa)
that takes in a student and calculates
their gpa.

Hint: Calculate their GPA by
taking the sum of their grades,
then dividing by the number
of classes they are taking.
You may want to do this in
two seperate functions.
|#

; Calculates the sum of numbers in a list
; sum-list: List-of-Numbers -> Number
(define (sum-list lon)
  (cond
    [(empty? lon) 0]
    [(cons? lon) (+
                  (car lon)
                  (sum-list (cdr lon)))]))

; Calculates a student's GPA
; get-gpa : Student -> Number
(define (get-gpa stu)
  (/ (sum-list (student-grades stu))
     (length (student-grades stu))))
(check-expect (get-gpa BOB) 85.6)

; +2 points for a purpose statement
; +2 points for a signature of Student -> Number
; +2 points for a successful implementation
; (sum-list helper isn't required, but recommended)
; +2 points for at least one test