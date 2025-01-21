//: [Previous](@previous)

import Foundation

var variable1="ajay"
var variable2="kumar"
func swapTwoVariables<T>(_ variable1: inout T,_ variable2: inout T) -> Void {
    let temp=variable1
    variable1=variable2
    variable2=temp
}
swapTwoVariables(&variable1, &variable2)
print(variable1)
print(variable2)

//: [Next](@next)
