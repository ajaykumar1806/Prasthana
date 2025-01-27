import UIKit

// How do you print duplicate characters from a string?

let str="aabbcd"

    //previous code
//func printDuplicates(_ str:String) -> String {
//    var resultString=""
//    for i in str{
//        var count=0
//        for j in str{
//            if i==j{
//                count+=1
//            }
//        }
//        if count>1 && !resultString.contains(String(i)){
//            resultString += String(i)+" "
//        }
//    }
//    return resultString
//}
//let res:String=printDuplicates(str)
//print( res.count == 0 ? "The given string doesn't contains any duplicates" : "The duplicate characters from string is: \(res)")

    //Approach-1
func printDuplicates(_ string:String) -> [Character] {
    var arr=[Character]()
    var arrOfDuplicates=[Character]()
    for char in string{
        if arr.contains(char){
            arrOfDuplicates.append(char)
        }
        else{
            arr.append(char)
        }
    }
    return arrOfDuplicates
}
print(printDuplicates(str))

    //Approach-2
func printDuplicates2(_ string:String) {
    var countedSet=NSCountedSet(array: Array(string))
    for char in countedSet{
        if countedSet.count(for: char) > 1{
            print(char)
        }
    }
}
printDuplicates2(str)
