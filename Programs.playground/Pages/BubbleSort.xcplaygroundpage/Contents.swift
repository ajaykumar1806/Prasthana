//: [Previous](@previous)

import Foundation

var arr:[Int]=[2,5,24,543,64,2,6,8,34,67,69]
for i in 0..<arr.count-1{
    for j in 0..<arr.count-1-i{
        if arr[j]>arr[j+1] {
            let temp=arr[j]
            arr[j]=arr[j+1]
            arr[j+1]=temp
        }
    }
}
print(arr)
//: [Next](@next)
