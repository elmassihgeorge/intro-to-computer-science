;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

; Question 2:
; What are the three logical operators?

#| Question 3:
Make a function called say-positive? that takes in a number
and returns "Positive!" if the number
is 0 or greater, and returns "Negative!"
if the function is less than 0.

For example,
(say-positive? 34) -> "Positive!"
(say-positive? -23) -> "Negative!"
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