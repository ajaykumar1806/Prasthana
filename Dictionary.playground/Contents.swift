import UIKit

import Foundation

//NOTE: Only String,Int,Double,Bool can be used for keys


//1.dictionary initialization
var moviesDictionary:[Int:String]=[1:"pushpa2" , 2:"Devara" , 3:"Kalki 2989AD" , 4:"Game Changer" , 5:"OG"]

//2.Empty Dictionary
var emptyDictionary=[String:Float]()
print(emptyDictionary.isEmpty)

//3.sequence based Dictionaries
var myKeys=["allu arjun" , "NTR" , "Prabhas" , "Ram Charan" , "Pawan Kalyan"]
var myMovies=["pushpa2" , "Devara" , "Kalki 2989AD" , "Game Changer" , "OG"]
var pairs=Dictionary(uniqueKeysWithValues:zip(myKeys,myMovies))
print(pairs)
var anotherPairs=Dictionary(uniqueKeysWithValues:zip(1... , myMovies))
print(anotherPairs)

//4.Dictionary items count(same keyword that was used for Arrays)
print(pairs.count)

//5.Accessing the Items(same procedure that was used for Arrays but here we need to use keys)
let pair1=pairs["Pawan Kalyan"]
print(pair1)

//6.updating the elements(2 types)
    //type 1
    pairs["allu arjun"]="pushpa 1"
    print(pairs["allu arjun"])
    //type 2(.updateValue)
    pairs.updateValue("salaar",forKey:"Prabhas")
    print(pairs["Prabhas"])

//7.Adding elements into Dictionary(No append method)
pairs["Nani"]="Saripodha Sanivaram"
print(pairs["Nani"])
print(pairs)

//8.removing from Dictionary(2 types)
    //by assigning NIL value to key
    pairs["allu arjun"]=nil
    print(pairs["allu arjun"])
    print(pairs)
    //by using .removeValue(forKey:_) method
    pairs.removeValue(forKey:"NTR")
    print(pairs)

//9.Iterating the Dictionary
for (heroName,heroMovie) in pairs{
    print("\(heroName) acted in this movie: \(heroMovie)")
}

//Example
var newArray=[Any]()
newArray+=[1,"ajay"]
print(newArray)
