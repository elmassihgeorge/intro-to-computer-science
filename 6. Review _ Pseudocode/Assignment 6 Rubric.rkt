;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 6 Rubric|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 6 - Chapters 1 and 2 Review
Submit on Google Classroom by the end of class.

If a question asks you to make a function,
it must follow the complete design recipe
including a purpose statement, signature
and appropriate tests to recieve full credit
|#

#| Question 1:
On a *single line comment*,
write your name and today's date
|#

; +1 point for writing a single line comment with ;
; +1 point for writing their name and the date

#| Question 2:
On a *multi line comment*,
answer the following question:
What does "define" do?
|#

; +1 point for writing a multi-line comment
; +1 point for saying that define creates new variables or functions

#| Question 3:
Define the following data:

A variable called "first-name" containing your first name
A variable called "last-name" containing your last name
A variable called "age" containing your age

You MUST reference those variables to create these variables:
A variable called "vote?" that contains if you're old enough to vote
A variable called "intro" that says
  "Hi! My name is *first-name* *last-name* and I am *age* years old"
Hint: Use (number->string age) to convert your age to a string.
|#

(define first-name "George")
(define last-name "Elm")
(define age 21)
(define vote? (>= age 18))
(define intro (string-append "Hi! My name is " first-name " "
                             last-name " and I am "
                             (number->string age) " years old."))

; +1 point for creating first-name
; +1 point for creating last-name
; +1 point for creating age
; +1 point for creating vote and using (>= age 18)
; +2 points for creating intro, correctly using string-append

#| Question 4:
Create a function called "next-squared"
that takes in a number and returns
the number 1 above it squared.

For example,
(next-squared 2) -> 9
|#

; Squares the number above a given number
; next-squared: Number -> Number
(define (next-squared num)
  (expt (+ 1 num) 2))
(check-expect (next-squared 2) 9)

; +1 point for a purpose statement
; +1 point for a signature of Number -> Number
; +1 point for adding 1 to num
; +1 point for using expt
; +2 points for testing the function

#| Question 5
Create a function called "order-drink" that takes in
a number and a string representing an amount of money
and a preferred size.

If the size is "Small" and the person has more than 2.00 dollars,
print "Ordered Small"

If the size is "Medium" and the person has more than 3.50 dollars,
print "Ordered Medium"

If the size is "Large" and the person has more than 5.00 dollars,
print "Ordered Large"

If the size is not "Small", "Medium", or "Large", or the person
does not have enough money for the drink they ordered,
print "Invalid Order".

For example,
(order-drink "Small" 6.43) -> "Ordered Small"
(order-drink "McFlurry" 23.43) -> "Invalid Order"
(order-drink "Large" 2.32) -> "Invalid Order"
|#

; Orders a drink if the user has enough money
; order-drink: String Number -> String
(define (order-drink size money)
  (cond
    [(and (string=? size "Small") (>= money 2)) "Ordered Small"]
    [(and (string=? size "Medium") (>= money 3.5)) "Ordered Medium"]
    [(and (string=? size "Large") (>= money 5)) "Ordered Large"]
    [else "Invalid Order"]))
(check-expect (order-drink "Small" 3) "Ordered Small")
(check-expect (order-drink "Medium" 5) "Ordered Medium")
(check-expect (order-drink "Large" 10) "Ordered Large")
(check-expect (order-drink "Small" 1) "Invalid Order")

; +2 point for a purpose statement
; +2 point for a signature of String Number -> String
; +1 point per each correct case + else (4 total)
; +1 point per each test case (4 total)

#| Question 6
Define variables called "username" and "password"
that contain a username and password of your choosing.

Create a function called "login" that takes in two strings
representing a username and password.
If the username and password both match, return "Logged In".
The username should NOT be case sensitive, the password should be.
If the username is incorrect, print "Incorrect Username"
If the password is incorrect, print "Incorrect Password"

For example, if username is "Account123" and password is "fishbowl12"...
(login account123 "fishbowl12") -> "Logged In"
(login ACCOunt123 "fishbowl12") -> "Logged In"
(login account123 "FISHBOWL12") -> "Incorrect Password"
(login account321 "fishbowl12") -> "Incorrect Username"
|#

(define USERNAME "jimbob")
(define PASSWORD "fishbowl123")

; Checks if a username and password are valid
; login: String String -> String
(define (login user pass)
  (cond
    [(and (string=? (string-downcase USERNAME) (string-downcase user))
          (string=? PASSWORD pass))
     "Logged In"]
    [(not (string=? (string-downcase USERNAME) (string-downcase user)))
     "Incorrect Username"]
    [else "Incorrect Password"]))

(check-expect (login "JIMbob" "fishbowl123") "Logged In")
(check-expect (login "jambib" "fishbowl123") "Incorrect Username")
(check-expect (login "jimbob" "fishbowl321") "Incorrect Password")
; +2 point for defining USERNAME
; +2 point for defining PASSWORD
; +1 point for a purpose statement
; +1 point for a signature of String String -> String
; +1 point for checking if username matches
; +1 point for implementing (string-downcase) to allow for case senstitivity
; +1 point for checking is password matches
; +1 point for returning "Logged In" if both match
; +2 point for functional "Incorrect Username" case
; +2 point for function "Incorrect Password" case
; +2 point for each test (6 total)

#| Bonus Question:
Create a function called "string-invert"
that takes in a string and appends
the second half the string to the first
half of the string.

Hint: Use the "round" function to allow
this to work on odd length strings.

For example,
(string-invert "GoldFish") -> FishGold
(string-invert "Hello") -> "lloHe"
|#

; Inverts a string by appending the last half to the first half
; string-invert: String -> String
(define (string-invert str)
  (string-append
   (substring str (round (/ (string-length str) 2)))
   (substring str 0 (round (/ (string-length str) 2)))))
(check-expect (string-invert "GoldFish") "FishGold")
(check-expect (string-invert "Hello") "lloHe")

; +1 point for a purpose statement
; +1 point for a signature
; +1 point for using string append
; +1 point for creating the first substring
; +1 point if "round" was used
; +1 point for creating the second substring
; +1 point if "round" was used
; +1 point for testing on an even length string
; +1 point for testing on an odd length string