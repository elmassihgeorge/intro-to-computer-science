;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Assignment 13|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 13 - File Input/Output
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

(require 2htdp/batch-io)
(require racket/string)

#| Question 1
Create a new text file anywhere on your computer
called "season.txt". In this text file,
write what your favorite season is,
and why it is your favorite season.

In a comment below, write the full file path
to the "season.txt" file
|#

#| Question 2
For a "season" file to be valid,
it should at some point contain
the words "Spring", "Summer",
"Fall", or "Winter".

Make a function called (valid-season?)
that takes in a string representing a
file path. This function should read
the file at this path, and determine
if it contains one of "Spring",
"Summer", "Fall", or "Autumn".

Hint: There are two ways to
achieve this. One involves the
(string-contains?) function
and one involves using ormap.
|#

#| Question 3
A file called "students.csv"
has been provided with this assignment.
Download that file to your computer
and write the path to that file in
a comment below.
|#

#| Question 4
The structure definition for a student
is written below:
|# (define-struct student (name id gpa)) #|
Create a function called (csv-to-students)
that takes in a string representing a path
to a CSV file. This function should return
a list of Student structures created
using the student data in the CSV.

A helper function to convert a list of strings
into a student has been provided:
|#

; Turns a list of 3 strings into a Student
; student-helper : List-of-String -> Student
(define (student-helper los)
  (make-student (first los)
                (second los)
                (third los)))

#| Question 5
Create a function called (student-data)
that takes in a student and converts them
into a line of data with this format:

"Bob has ID 2 and a GPA of 3.2"

Save this text as a file on your computer
called "*STUDENT*_data.txt"

For example, this file would be called
"Bob_data.txt"
|#