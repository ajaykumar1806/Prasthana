//: [Previous](@previous)

import Foundation

//How do you find the missing number in a given integer array of 1 to 100?

    //Previous written code
//func findMissingInteger(_ arr:[Int])->Int{
////    for i in 1...arr[arr.count-1]{
////        if !arr.contains(i){
////            return i
////        }
////    }
////    return 0
//}

let arr=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]


//Approach-1
func findMissingInteger(_ arr:[Int])->Int{
    var arr=arr
    arr.sort()
    for (index,value) in arr.enumerated(){
        if value-index>1{
            return value - 1
        }
    }
    return 0
}
let num=findMissingInteger(arr)
print(num)



//Approach-2
let givenSet=Set(arr)
let rangeSet=Set(1...100)
func findMissingInteger1(_ givenSet:Set<Int>,_ rangeSet:Set<Int>)->Int{
    let result=givenSet.symmetricDifference(rangeSet)
    return result.first ?? 0
}
let number=findMissingInteger1(givenSet,rangeSet)
print(number)



//Approach-3
func findMissingInteger2(arr:[Int],originalSize:Int) -> Int {
    let totalSum = originalSize * (originalSize+1)/2
    let givenArraySum=arr.reduce(0, +)
    return totalSum-givenArraySum
}
let result=findMissingInteger2(arr: arr, originalSize: 100)
print(number)
//: [Next](@next)
