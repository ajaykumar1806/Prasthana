//: [Previous](@previous)

import Foundation

//Using built-in function
var arr:[Int]=[2,5,24,543,64,2,6,8,34,67,69]
arr.reverse()
print(arr)

//Without using built-in function
var reversedArray=[Int]()
for i in arr{
    reversedArray=[i]+reversedArray
}
print(reversedArray)
//: [Next](@next)
