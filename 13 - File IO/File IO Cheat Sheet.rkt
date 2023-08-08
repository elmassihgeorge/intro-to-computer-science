;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |File IO Cheat Sheet|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; File I/O Cheat Sheet

; To use file I/O, you must include the batch-io library:
(require 2htdp/batch-io)

; Check if a file exists at a specified path
; file-exists? : String -> Boolean
(file-exists? "path")

; Read a file of text into a String
; read-file : String -> String
(read-file "path")

; Read a file of text and seperate new lines into a list
; read-lines : String -> List-of-String
(read-lines "path")

; Read a file of text and seperate all words into a list
; read-words : String -> List-of-String
(read-words "path")

; Read a CSV file into a list of list of strings
; read-csv-file : String -> List-of-(List-of-String)
(read-csv-file "path")

; Write a file at the specifed path containing some String
; write-file : String String -> String
(write-file "path" "text to be saved in file")