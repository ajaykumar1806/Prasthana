//: [Previous](@previous)

import Foundation

let str="VowelsAndConsonants"
var vowelsCount=0
var consonantsCount=0
for char in str{
    switch(char){
        case "a","A":
            vowelsCount+=1
        case "e","E":
            vowelsCount+=1
        case "i","I":
            vowelsCount+=1
        case "o","O":
            vowelsCount+=1
        case "u","U":
            vowelsCount+=1
        default:
            consonantsCount+=1
    }
}
print("The given string contains \(vowelsCount) Vowels and \(consonantsCount) Consonants")

//: [Next](@next)
