//: [Previous](@previous)

import Foundation

let arr1:[Int]=[3,5,2,5,7,8,9,7,1,5,0,4,6,]
let arr2:[Int]=[2,5,24,543,64,2,6,8,34,67,69]
var resultArray:[Int]=[]
for i in arr1{
    if arr2.contains(i) {
        resultArray.append(i)
    }
}
print(resultArray)
//: [Next](@next)
