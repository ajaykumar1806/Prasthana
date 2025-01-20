import UIKit

//It is one of the collection type in which we mention datatype of set
//Declaring the set
var letters=Set<Character>()

//Adding elements to it
letters.insert("a")
letters=["b","c","d","e"]
print(letters)

//creating set with an array literal
var companies:Set<String>=["Google","Meta","Amazon","Microsoft","Adobe"]
//NOTE : Here the datatype for set is optional because all the values in array are same type.If they are different then datatype is mandatory

//Accessing and modifying set
//1 .count
print(companies.count)
//2 .isEmpty
print(companies.isEmpty)
//3 .insert
companies.insert("MasterCard")
//4 .remove
companies.remove("Adobe")
//5 .contains
companies.contains("Meta")

//Iterating over set (Similar to that of Array)
for company in companies {
    print(company)
}

//Performing Set operations
var oddNumbers:Set=[1,3,5,7,9]
var evenNumbers:Set=[2,4,6,8,10]
var primeNumbers:Set=[2,3,5,7]
//Union operation
print(oddNumbers.union(evenNumbers))
//Intersection operation
print(oddNumbers.intersection(primeNumbers))
//subtraction operation
print(oddNumbers.subtracting(primeNumbers))
//symmetric operation (In this it will return the set by removing common elements)
print(oddNumbers.symmetricDifference(primeNumbers))

//We also have operations like
//subset
print(oddNumbers.isSubset(of: evenNumbers))
//Superset
print(evenNumbers.isSuperset(of: primeNumbers))
//Disjoint
print(oddNumbers.isDisjoint(with: evenNumbers))

