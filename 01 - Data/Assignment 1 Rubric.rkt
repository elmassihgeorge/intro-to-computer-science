;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 1 Rubric|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 1 - Data
Submit on Google Classroom by the end of class.
|#

#|
Question 1:
In a single line comment, please write your name and today's date.
|#

; +1 point for a single line comment with a name and date

#|
Question 2 (Answer in a comment):
What are the two possible values of a bit?
; +1 point for saying 0 and 1

How many bits are in a byte?
; +1 point for 8
|#

#|
Question 3 (Answer in a comment):
What word describes data that can be changed after it is created?
; +1 point for "Mutable"
What word describes data that CAN'T be changed after it is created?
; +1 point for "Immutable"
Which of those types of data does Racket use?
; +1 point for "Immutable"
|#


#|
Question 4 (Anser in a comment)
What is a boolean, and what values can it be?
; +2 points for "true or false"
|#

#|
Question 5:
Define the following data:
- Create a variable called FIRST-NAME that stores your first name
- Create a variable called LAST-NAME that stores your last name
- Create a variable called AGE that stores your age
|#

; +1 point for (define FIRST-NAME "name")
; +1 point for (define LAST-NAME "name")
; +1 point for (define AGE number)

#|
Question 6:
Using the string concatenation operator (string-append), write a line of code
that produces the following text and stores it as a variable called INTRODUCTION:
"My name is *YOUR FIRST NAME* *YOUR LAST NAME*, and I am *YOUR AGE* years old."
You should NOT write your name or age in this line of code -
instead, reference the data you created in question 2.
|#

; +1 point for creating a variable named INTRODUCTION or INTRO with "define"
; +1 point for using string-append in any capacity
; +1 point for the function calling FIRST-NAME and LAST-NAME
; +1 point for the function working as intended (including spaces)
(define INTRODUCTION (string-append "My name is "
                                    FIRST-NAME " " LAST-NAME
                                    "and I am "
                                    (number->string AGE)
                                    " years old."))

#|
Question 7:
Write a line of code that produces the length of INTRODUCTION
|#
; +1 point for using string-length
; +1 point for calling string-length on INTRODUCTION
(string-length INTRODUCTION)

#|
Question 8:
Complete the following math operations in code:
- Multiply your age by 10, then store the data as a variable called N1
- Subtract 20 from N1 and divide it by 5, then store the data as a variable called N2
- Add 4 to N2 and divide it by 2, then store the data as a a variable called N3
What is the value of N3?
|#

; +1 point for
(define N1 (* 10 AGE))
; +1 point for
(define N2 (/ (- N1 20) 5))
; +1 point for
(define N3 (/ (+ N2 4) 2))
; +1 point for providing a number or "N3 is the same as AGE"

#|
Bonus Question (Answer in a comment):
Where does the name "Boolean" come from?
|#
; +2 points for "George Boole"
; Note on bonus points: do not penalize for getting wrong,
; but add points to an incorrect question for getting right
; No bonus given if the student already has a 100%