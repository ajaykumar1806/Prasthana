import UIKit

import Foundation

//immutable array
let a=[1,2,3,4]

//mutable array
var b=[5,6,7,8]

//Empty arra creation
var emptyArr=[Int]()

//preset with specified default values
var c=[String](repeating:"ajay" , count:3)
print(c)

//concating the array
var d=a+b
print(d)

//WORKING WITH ARRAYS

//1.array items count
var e=a
var length=e.count
print(length)

//2.array empty check
var type=a.isEmpty
print(type)
print(emptyArr.isEmpty)

//3.Accessing the array elements
print(a[2])
print(c[1])
print(e[3])

//4.Random items shuffling
var shuffledArray=d.shuffled()
print(shuffledArray)

//5.Random Items Accessing
let randomVariable=d.randomElement()
print(randomVariable)

//6.Appending or adding to an array
var newArray:[String]=["ajay","amar","swapna","swathi","sai"]
newArray.append("mahesh")
newArray+=["vamshi"]
newArray+=["a","b","c"]
print(newArray)

//7.Array Iteration
    //i. using for-in loop
    for names in newArray{
        print(names)
    }
    //ii. using forEach loop
    a.forEach{n in
        print(n)
    }
    //iii. using closure expressions
    d.forEach{
        print($0)
    }

//8.Inserting the items in an array
var myArray=["pushpa2" , "Devara" , "Kalki 2989AD" , "Game Changer" , "OG"]
myArray.insert("salaar",at:2)
print(myArray)

//9.Deleting or removing from Array
myArray.remove(at:2)
print(myArray)
    //remove last element without index value
    myArray.removeLast()
    print(myArray)

//10.Creating mixed type of array
var mixedArray:[Any]=["ajay",22,12000.00,"IOS Developer"]
//iteration is same as that of normal array
for i in mixedArray{
    print(i)
}
//11.downcasting from any to String
//for i in mixedArray{
//    print(i as! String)
//}
