//: [Previous](@previous)

import Foundation

let greeting = "Hello, playground"
let char:Character="o"
var resultString=""
for i in greeting{
    if i != char{
        resultString+=String(i)
    }
}
print(resultString)

//: [Next](@next)
