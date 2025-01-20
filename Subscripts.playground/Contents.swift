import UIKit

//This is a shortcut for accessing the member elements of a collection or list or any sequence

//NOTE: we can create multiple subscripts for a single type

///SYNTAX:
/// subscript(index:Int)->return_type
/// {
///     get{
///         //return an appropriate subscript value
///     set(newValue) {
///         //perform suitable setting action
///     }
/// }

//Example:
struct Table {
    let multiplier:Int
    subscript(index:Int)->Int{
        return multiplier*index
    }
}
let result=Table(multiplier: 4)
print(result[6])
    
//subscript usage
    //Example:lets consider a dictionary
var numberOfLegs=["spider":8,"ant":6,"cat":4]
numberOfLegs["human"]=2
print(numberOfLegs)

//Type subscripts
//when we define subscripts that are called on the type itself then they are called typr subscripts
// we use static keyword before subscript keyword
//Example:
enum Planet:Int {
case mercury=6,venus,earth,mars,jupiter,saturn,uranus
    static subscript(index:Int)->Planet{
        return Planet(rawValue:index) ?? mercury
    }
}
let planet=Planet[7]
print(planet)
