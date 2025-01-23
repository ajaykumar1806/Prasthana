import UIKit

// How do you print duplicate characters from a string?

let str="abkhjksdhfajhbfndkjvnldnlknlfnkabcd"
func printDuplicates(_ str:String) -> String {
    var resultString=""
    for i in str{
        var count=0
        for j in str{
            if i==j{
                count+=1
            }
        }
        if count>1 && !resultString.contains(String(i)){
            resultString += String(i)+" "
        }
    }
    return resultString
}
let res:String=printDuplicates(str)
print( res.count == 0 ? "The given string doesn't contains any duplicates" : "The duplicate characters from string is: \(res)")

