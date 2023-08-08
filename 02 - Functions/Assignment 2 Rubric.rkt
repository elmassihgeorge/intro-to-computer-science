;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 2 Rubric|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 2 - Functions
Submit on Google Classroom by the end of class.
|#

; Question 1:
; Briefly describe what a function is in your own words
; +1 point for anything about code that takes data in and returns data out

; Question 2:
; What does it mean for a function to have "side effects"?
; +1 point for anything about a function affecting data we didn't give it


; Question 3:
; What is one reason that functions are useful?
; +1 point for preventing code reuse or breaking code into smaller pieces

#|
Question 4:
Write a *single* line of code to solve the following question:
Which number is the largest?
- 14 cubed (to the 3rd power)
- 50 times 60
- 18000 divided by 7

Hint: You will need multiple math functions we learned in the
"built in functions" slide. Reference the slideshow
or the Racket documentation.
|#

; +1 point for using the max function
; +1 point for (expt 14 3)
; +1 point for (* 50 60)
; +1 point for (/ 18000 7)
(max (expt 14 3) (* 50 60) (/ 18000 7))

#|
Question 5:
Define a function called "greater-than-100") that takes in a number and
checks if it is greater than 100.

For example, your function should return:
(greater-than-100 49) -> #false
(greater-than-100 120) -> #true
|#

; +1 point for using define to create a function called greater-than-100
; that takes in one variable
; +1 point for the function working as intended
(define (greater-than-100 num)
  (> num 100))

#|
Question 6:
Define a function called "product-gt-100" that takes in two numbers, multiplies them,
then checks if the result is greater than 100.
You must call the function you defined in Question 4
to recieve full credit.

For example,
(product-gt-100 10 12) -> #true
(product-gt-100 3 4) -> #false
|#

; +1 point for creating a function called product-gt-100
; that takes in 2 variables
; +1 point for (* n1 n2)
; +1 point for calling greater-than-100

(define (product-gt-100 n1 n2)
  (greater-than-100 (* n1 n2)))

#|
Question 7:
Define a function called "format-name" that takes in
a first name and a last name,
and orders them as "Last Name, First Name"

For example,
(format-name "Joe" "Shmoe") -> "Shmoe, Joe"
(format-name "Ally" "Carr") -> "Carr, Ally"
|#

; +1 point for making a function called format-name that takes in
; two strings
; +1 point for using string-append
; +1 point for the function working properly with a ", " between last and first
(define (format-name first last)
  (string-append last ", " first))