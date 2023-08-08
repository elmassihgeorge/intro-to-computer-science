;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |List Abstraction Cheat Sheet|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#| List Abstraction Cheat Sheet
MAKE SURE YOU HAVE CHANGED YOUR LANGUAGE
FROM "BEGINNING STUDENT" TO
"INTERMEDIATE STUDENT WITH LAMBDA"
|#

#| Map
Map applies a function to every element
in a list.

Under the hood, this is what map is doing:

(define (map fn lox)
  (cond
    [(empty? lox) '()]
    [(cons? lox) (cons
                  (fn (car lox))
                  (map fn (cdr lox)))]))

Map has the signature:
(X -> Y) List-of-X -> List-of-Y

Some examples:
|#

; Take the square root of every number in a list
; sqrt-list : List-of-Number -> List-of-Number
(define (sqrt-list lon)
  (map sqrt lon))
(check-expect (sqrt-list (list 4 9 16)) (list 2 3 4))

; Convert a list of strings into a list of string-lengths
; string-to-lengths : List-of-String -> List-of-Number
(define (string-to-lengths los)
  (map string-length los))
(check-expect (string-to-lengths (list "A" "BC" "DEF")) (list 1 2 3))

#| Andmap
Andmap checks if every element in a list
satisfies a predicate

Under the hood, this is what andmap is doing:

(define (andmap pred lox)
  (cond
    [(empty? lox) #true]
    [(cons? lox) (and
                  (pred (car lox))
                  (andmap pred (cdr lox)))]))

Andmap has the signature:
(X -> Boolean) List-of-X -> Boolean

Some examples:
|#

; Checks if every number in a list is even
; all-even? : List-of-Number -> Boolean
(define (all-even? lon)
  (andmap even? lon))
(check-expect (all-even? (list 2 4 6)) #t)
(check-expect (all-even? (list 1 2 3)) #f)

; Checks if every element in a list is a number
; all-numbers? : List-of-X -> Boolean
(define (all-numbers? lox)
  (andmap number? lox))
(check-expect (all-numbers? (list 1 2 3)) #t)
(check-expect (all-numbers? (list 1 "ABC" #true)) #f)

#| Ormap
Ormap checks if any element in a list
satisfies a predicate

Under the hood, this is what andmap is doing:

(define (ormap pred lox)
  (cond
    [(empty? lox) #false]
    [(cons? lox) (or
                  (pred (car lox))
                  (ormap pred (cdr lox)))]))

Ormap has the signature:
(X -> Boolean) List-of-X -> Boolean

Some examples:
|#

; Checks if any number in a list is even
; any-even? : List-of-Number -> Boolean
(define (any-even? lon)
  (ormap even? lon))
(check-expect (any-even? (list 1 2 3)) #t)
(check-expect (any-even? (list 1 3 5)) #f)

; Checks if any element in a list is a number
; any-numbers? : List-of-X -> Boolean
(define (any-numbers? lox)
  (ormap number? lox))
(check-expect (any-numbers? (list 1 "ABC" #true)) #t)
(check-expect (any-numbers? (list "A" "B" #false)) #f)

#| Fold
Fold combines all the elements of a list
into one element. It combines the elements
using a specified procedure, and combines
them on top of a specified base.

There are two variations of fold:
- foldr, which folds from left to right
- foldl, which folds from right to left

Under the hood, this is what foldr is doing:

(define (foldr proc base lox)
  (cond
    [(empty? lox) base]
    [(cons? lox) (proc
                  (car lox)
                  (foldr proc base (cdr lox)))]))

Both fold functions have the signature:
(X Y -> Y) Y List-of-X -> Y

Some examples:
|#

; Adds all numbers in a list together
; sum-list : List-of-Number -> Number
(define (sum-list lon)
  (foldr + 0 lon))
(check-expect (sum-list (list 1 2 3)) 6)

; Appends all the lists in a string together
; from the start of the list to the end
; append-strings-r : List-of-Strings -> String
(define (append-strings-r los)
  (foldr string-append "" los))
(check-expect (append-strings-r (list "A" "B" "C")) "ABC")


; Appends all the lists in a string together
; from the end of the list to the start
; append-strings-l : List-of-Strings -> String
(define (append-strings-l los)
  (foldl string-append "" los))
(check-expect (append-strings-l (list "A" "B" "C")) "CBA")

#| Note on signatures

Sometimes we may want our list abstraction
to perform a function that does not
neatly fit into the signatures required.

To fix this, we make a helper function
that fits the specified signature.

Some examples:
|#

; Multiplies a number by 3
; mult-by-3 : Number -> Number
(define (mult-by-3 num)
  (* 3 num))
(check-expect (mult-by-3 3) 9)

; Multiplies every number in a list by 3
; map-mult-3 : List-of-Number -> List-of-Number
(define (map-mult-3 lon)
  (map mult-by-3 lon))
(check-expect (map-mult-3 (list 1 2 3)) (list 3 6 9))

; Adds the length of a string to a number
; sum-string-helper: String Number -> Number
(define (string-sum-helper str base)
  (+ (string-length str) base))
(check-expect (string-sum-helper "Hello" 3) 8)

; Adds the lengths of all the strings in a list
(define (sum-string-lengths los)
  (foldl string-sum-helper 0 los))
(check-expect (sum-string-lengths (list "A" "BC" "DEF")) 6)