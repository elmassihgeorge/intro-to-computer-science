;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Practice Assignment Solutions|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Practice Assignment 10/26/22

; A "Movie" is made up of
; - title
; - runtime in minutes
; Create a structure for a movie with at least 3 examples
(define-struct movie (title runtime))
(define movie-1 (make-movie "movie1" 62))
(define movie-2 (make-movie "movie2" 120))
(define movie-3 (make-movie "movie3" 14))
(define lo-movie (list movie-1 movie-2 movie-3))

#| Create a function that takes in
a list of movies and returns a list
of movies shorter than 60 minutes.

Use list abstraction and a lambda function
|#

; Returns movies in a list that are shorter
; than 60 minutes
; short-movies: List-of-Movie -> List-of-Movie
(define (short-movies lom)
  (filter (λ (movie) (< (movie-runtime movie) 60)) lo-movie))

#| Create a function that
takes in a list of movies and
sums the length of their runtimes

Use list abstraction and a lambda function
|#

; Adds the lengths of all movies in a list
; movie-time: List-of-Movie -> Number
(define (movie-time lom)
  (foldr (λ (movie base) (+ (movie-runtime movie) base)) 0 lom))

#|
A "Theatre" is made up of:
- A theatre name
- A maximum number of seats
- A list of movies shown in that theatre.

Make a structure to represent a theatre
|#
(define-struct theatre (name seats lom))
(define theatre-1 (make-theatre "Main St Movies" 100 lo-movie))

#| Create a function that takes in
a theatre and a string representing
the name of a movie, and returns
if that movie is being played in the theatre.
|#

; Checks if a theatre has a movie
; has-movie? : Theatre String -> Boolean
(define (has-movie? theatre name)
  (ormap (λ (movie) (string=? (movie-title movie) name)) (theatre-lom theatre)))