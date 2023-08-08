;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 4 Rubric|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 4 - Conditional Statements
Submit on Google Classroom by the end of class.

If a question asks you to make a function,
it must follow the complete design recipe
including a purpose statement, signature
and appropriate tests to recieve full credit
|#

; Question 1:
; Why are if statements useful in programming?

; +2 points for anything about allowing
; additional control - choosing between multiple
; cases

; Question 2:
; What are the three logical operators?

; +1 point for or
; +1 point for and
; +1 point for not

#| Question 3:
Make a function called say-positive? that takes in a number
and returns "Positive!" if the number
is 0 or greater, and returns "Negative!"
if the function is less than 0.

For example,
(say-positive? 34) -> "Positive!"
(say-positive? -23) -> "Negative!"
|#

; Says "Positive!" if a number is positive or zero,
; says "Negative!" if a number is negative
; say-positive: Number -> String
(define (say-positive num)
  (if (>= num 0) "Positive!" "Negative!"))
(check-expect (say-positive 12) "Positive!")
(check-expect (say-positive -21) "Negative!")

#|
+1 points for a purpose statement
+1 points for a signature of Number -> String
+1 point for defining a function called say-positive
+1 point for checking if num is >= 0 (> 0 is okay)
+1 point for a correct "Positive" case
+1 point for a correct "Negative" case
+1 points for testing the positive case
+1 points for testing the negative case
|#

#| Question 4
Make a function called positive-mult
that takes in two numbers and returns
their product if both are positive,
and 0 if either are negative

For example,
(positive-mult 2 3) -> 6
(positive-mult -2 3) -> 0
|#

; Multiplies two numbers if they are both positive,
; returns 0 otherwise
; positive-mult : Number Number -> Number
(define (positive-mult n1 n2)
  (if (and (positive? n1) (positive? n2))
      (* n1 n2)
      0))

(check-expect (positive-mult 2 3) 6)
(check-expect (positive-mult -2 4) 0)

#|
; +1 points for a purpose statement
; +1 points for a signature of Number Number -> Number
; +1 point for defining a function called positive-mult
; +1 point for checking if n1 and n2 are positive
; +1 point for multiplying if they are both positive
; +1 point for 0 otherwise
; +1 point for testing the positive case
; +1 point for testing the negative case
|#

#| Question 5
Define a variable called PASSWORD
that contains any password you'd like.
Make a function called check-password
that takes in a string.
If that input matches your password,
return "Access Granted".
If that input does not match your password,
return "Access Denied".
|#

(define PASSWORD "fishbowl123")
; Checks if a password is valid
; check-password: String -> String
(define (check-password pass)
  (if (string=? pass PASSWORD)
      "Access Granted"
      "Access Denied"))
(check-expect (check-password "fishbowl123") "Access Granted")
(check-expect (check-password "fishbowl321") "Access Denied")

#|
+2 points for defining a password
+1 point for a purpose statement
+1 point for a signature of String -> String
+1 point for defining a function called check-password
+1 point for checking if the input equals password
+1 point for a true case
+1 point for a false case
+1 point for testing the true case
+1 point for testing the false case
|#

; NOTE: For some reason, string-prefix is not
; contained in the version of Racket
; the students installed. Make check-overlap
; a bonus question instead and ignore the bonus

#| Question 6
Make a function called check-overlap
that takes in two strings.
If the first string is contained in the second
string OR the second string is contained
in the first string, return "Strings Overlap".
If the strings do not overlap, return "No Overlap".

For example,
(check-overlap "Racecar" "Car") -> "Strings Overlap"
(check-overlap "Smith" "Blacksmith") -> "Strings Overlap"
(check-overlap "Chocolate" "Chip") -> "No Overlap"

Hint: You will need to use the function
(string-contains? str1 str2)
string-contains? returns #true if st2 is contained in str1,
and false otherwise.
|#

; Checks if two strings overlap
; check-overlap: String String -> String
(define (check-overlap str1 str2)
  (if
   (or (string-contains? str1 str2)
       (string-contains? str2 str1))
   "Strings Overlap"
   "No Overlap"))
(check-expect (check-overlap "car" "racecar") "Strings Overlap")
(check-expect (check-overlap "racecar" "car") "Strings Overlap")
(check-expect (check-overlap "abc" "def") "No Overlap")

#|
+ 1 point for a purpose statement
+ 1 point for a signature of String String -> String
+ 1 point for defining a function called check-overlap
+ 1 point for checking if str1 contains str2
+ 1 point for checking if str2 contains str1
+ 1 point for combining with "or"
+ 1 point for the true case
+ 1 point for the false case
+ 1 point for testing the true case
+ 1 point for testing the false case
|#

#| Bonus Question
Make a function called valid-website
that takes in a string.
If the string begins with "www."
and ends with ".com", ".org", or ".net",
return "Valid Website".
If it does not, return "Invalid Website."

For example:
(valid-website "www.google.com") -> "Valid Website"
(valid-website ".comgoolewww.) -> "Invalid Website"

Hint: You will need to use the functions
(string-prefix str1 str2)
(string-suffix str1 str2)
These functions check if str2 is at the beginning or end
of str1, respectively
|#

; This function is impossible due to string-prefix
; not being installed in base racket