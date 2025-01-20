import UIKit

//Declaring enumeration
enum Season {
case summer,winter,mansoon,spring
}

// creating enum variable
var currentSeason:Season

//Assigning values to enum variable
currentSeason=Season.spring

//enum with switch statements
//(the syntax is same as that of normal switch statements but here we will use .value in cases because to extract the value from declared enum)
enum pizzaSize {
case small,medium,large
}

var size=pizzaSize.medium
switch size{
case .small:
    print("The pizza is smaller in size")
case .medium:
    print("The pizza is medium in size")
case .large:
    print("The pizza is larger in size")
}

//Iterating over enumeration cases
//(To iterate enumeration we need to declare enum with (caseIterable Protocol) and use (.allCases) property)
enum programmingLanguages:CaseIterable {
case Java,Python,Cpp,C,ObjectiveC,Swift,JavaScript
}
for lang in programmingLanguages.allCases{
    print(lang)
}

//enum with rawValues
//(In this we assign values to each enum case)

//DISADVANTAGE = we cant declare another datatype for cases apart from enum datatype
enum Person:String {
    case name="Ajay"
    case gender="M"
}
//.rawValue is used to access the value present inside the case
var person1=Person.name.rawValue
print(person1)

//enum with Associated values
//( The main advantage in this is we can declare any dataType to the cases)
// (In place of datatype we can also assign values)
enum Laptop {
    case company(String) //case company("Hp")
    case model(String) //case model("Victus")
    case type(String)
    case price(Double)
}
//Associate multiple values
enum result {
    case marks(Double,Double,Double,Double)
}

//Named associated values
enum car {
    case price(rs:Double)
    case height(centimeters:Int)
}


