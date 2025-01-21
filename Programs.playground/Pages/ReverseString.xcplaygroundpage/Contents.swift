//: [Previous](@previous)

import Foundation

//With using built-in function
let str="Prasthana"
print(String(str.reversed()))

//without using built-in function
var reversedString=""
for char in str{
    reversedString=String(char)+reversedString
}
print(reversedString)
//: [Next](@next)
