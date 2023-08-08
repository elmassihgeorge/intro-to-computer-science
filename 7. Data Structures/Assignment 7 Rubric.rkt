;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 7 Rubric|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 7 - Structures
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

#| Question 1:
Define a new structure called "address"

An address should have a number, street, and town.

Follow the complete design recipe for data,
including a definition, interpretation,
and appropriate examples to recieve full credit.
|#

; Definition - An address is a (make-address Number String String)
; Interpretation - An address represents a street address
; - Number is the house number
; - Street is the street
; - Town is the town
(define-struct address (number street town))
(define one-main-st (make-address 1 "Main St" "Whoville"))
(define fifteen-main-st (make-address 15 "Main St" "Whoville"))
(define foundry (make-address 510 "Rogers St" "Cambridge"))

; +2 point for a correct definition
; +2 point for a correct interpretation
; +2 point for a correct define-struct
; +2 point for at least 2 examples


#| Question 2:
Fill in the blanks with the correct functions:
|#

; The function to create a new address is: ___ make-address
; The function to access the number of an address is: ___ address-number
; The function to access the street of an address is: ___ address-street
; The function to access the town of an address is: ___ address-town

; +2 points for make-address
; +2 points for address-number
; +2 points for address-street
; +2 points for address-town

#| Question 3:
If a house number is even, it is on the left side of the street.
If a house number is odd, it is on the right side of the street.

Make a function called "street-side" that takes in an address
and returns "Left" if the house is on the left side of the street,
and "Right" if the house is on the right side of the street.

Hint: You can use the functions (odd? num) or (even? num)
to determine is a number is even or odd.
|#

; Checks if a house is on the left or right side of the street
; street-side: Address -> String
(define (street-side adr)
  (if (even? (address-number adr))
      "Left"
      "Right"))
(check-expect (street-side one-main-st) "Right")
(check-expect (street-side foundry) "Left")
; +2 points for a purpose statement
; +2 points for a signature of Address -> String
; +2 points for accessing the address's number using address-number
; +2 points for a working function including "Left" and "Right"
; +2 points for a "Left" case test
; +2 points for a "Right" case test

#| Question 4:
Define a new structure called "Student"

A student should have a name, gpa and address.
|#

; Definition: A Student is a (make-student Number Number Address)
; Interpretation: Represents a Student
; - name is the student's name
; - gpa is the student's gpa
; - address is the student's address
(define-struct student (name gpa address))
(define susie (make-student "Susie" 2.3 one-main-st))
(define ed (make-student "Ed" 3.8 fifteen-main-st))
(define bill (make-student "Bill" 2.6 foundry))

; +2 points for a correct definition
; +2 points for a correct interpretation
; +2 points for a correct define-struct
; +2 points for at least 2 examples

#| Question 5:
Two students are neighbors if they live on the same street
and within 20 house numbers of eachother.

Create a function called "neighbors?" that takes in two students
and returns if they are neighbors.
|#

; Checks if two students are neighbors
; neighbors? : Student Student -> Boolean
(define (neighbors? stu1 stu2)
  (and (string=? (address-street (student-address stu1))
                 (address-street (student-address stu2)))
       (< (abs (- (address-number (student-address stu1))
                     (address-number (student-address stu2)))) 20)))
(check-expect (neighbors? susie ed) #t)
(check-expect (neighbors? susie bill) #f)

; Turns out this function is quite hard!

; +2 points for a purpose statement
; +2 points for a signature
; +1 point for using (address-street (student-address stu))
;    to access students' street addresses
; +1 point for using (address-number (student-address stu))
;    to access students' street number
; +1 point for checking if the streets are equal using string=?
; +1 point for checking if the difference of the two numbers is < 20
; +2 point for a #t test
; +2 point for a #f test


#| Bonus Question:
Create a structure called "coordinate"
that has an x value and y value.

Create a function called "distance-formula"
that takes in two coordinates and calculates
the distance between them.

Hint: If two points are (x1, y1), (x2, y2),
the distance between them is
(sqrt ((x2 - x1)^2 + (y2 - y1)^2))
|#

; A coordinate is a (make-coordinate Number Number)
; Represents a coordinate in 2d space
; - x is the x value of the coordinate
; - y is the y value of the coordinate
(define-struct coordinate (x y))
(define c1 (make-coordinate 3 5))
(define c2 (make-coordinate 4 6))

; +1 point for definition
; +1 point for signature
; +1 point for define-struct
; +1 point for at least 2 examples

; Calculates the distance between 2 coordinates
(define (distance-formula coor1 coor2)
  (sqrt (+
   (expt (- (coordinate-x coor1) (coordinate-x coor2)) 2)
   (expt (- (coordinate-y coor1) (coordinate-y coor2)) 2))))

; +2 points for purpose statement
; +2 points for signature
; +1 point for (coordinate-x coor1)
; +1 point for (coordinate-y coor1)
; +1 point for (coordinate-x coor2)
; +1 point for (coordinate-y coor2)
; +2 points for all the correct math

; Testing with floats is weird - do not grade tests