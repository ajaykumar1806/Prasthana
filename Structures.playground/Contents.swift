import UIKit

//It is used to store variables of different datatypes

// Basic Example : if we want to store name and age of multiple persons,we can create struct class and can be used for every person (similar to that of constructor in Java)

struct Person {
    var name=""
    var age=0
}

//(variables and constants inside the structure are called as Properties)

var person1=Person()
person1.name="Ajay"
person1.age=22
print(person1)
// Here we can use Person struct t create another person and assign the values to it
var person2=Person()
person2.name="Amarnath"
person2.age=24
print(person2)

//If we dont want to assign default values then we can mention datatype using double-colon(: dataType).So if we prefer this type then while creating instance of structure then we need to initialize the value during instance creation
struct laptop {
    var brand:String
}
var laptop1=laptop(brand: "Lenovo")

//Function inside structure
struct car {
    var gear=0
    func applyBrake(){
        print("applying the brake")
    }
}
var car1 = car()
car1.gear=3
car1.applyBrake()

//Structure and class Instances
struct Resolution {
    var width=0
    var height=0
}
class VideoMode {
    var resolution=Resolution()
    var interlaced=false
    var framerate=0.0
    var name:String?
}
//Syntax for creating Instances
var someResolution=Resolution()
var someVideoMode=VideoMode()
//Structures are value types
let hd=Resolution(width: 1920,height: 1080 )
var cinema=hd
cinema.width=2048
// Here it print their respective values because they are seperate instances 
print(hd.width) //1920
print(cinema.width) //2048



