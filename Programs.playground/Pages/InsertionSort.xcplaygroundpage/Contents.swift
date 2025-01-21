//: [Previous](@previous)

import Foundation

var arr:[Int]=[2,5,24,543,64,2,6,8,34,67,69]
for i in 0..<arr.count{
    let key=arr[i]
    var j=i-1
    while(j > -1 && arr[j]>key){
        arr[j+1]=arr[j]
        j-=1
    }
    arr[j+1]=key
}
print(arr)

//: [Next](@next)
