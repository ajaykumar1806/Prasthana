import UIKit

import Foundation

//basic concept of object and class
class Demo{
    var accountNumber:Int=0
    var accountBalance:Float=0
    init(_ accountNumber: Int, _ accountBalance: Float) {
        self.accountNumber = accountNumber
        self.accountBalance = accountBalance
    }
    func displayBalance()-> String {
        "Your Account Number is \(accountNumber) and Balance is \(accountBalance)"
    }
    func add(_ num1:Int,_ num2:Int) -> Int {
        return num1+num2
    }
}
var object1=Demo(726901000,203)
print(object1.displayBalance())
print(object1.add(20, 30))

//Instance methods and type methods in a single class
class Person{
    var personName:String
    var personAge:Int
    var personSal:Double
    var personRole:String
    static let personCompany:String="Prasthana Software Solutions"
    init(personName: String, personAge: Int, personSal: Double, personRole: String) {
        self.personName = personName
        self.personAge = personAge
        self.personSal = personSal
        self.personRole = personRole
    }
    func personDetails() -> String {
        return "my name is \(personName) and my age is\(personAge) working in \(Person.personCompany) getting a salary of \(personSal)"
    }
    class func maxSalary(_ sal:Int) -> Double{
        return 1000000.0
    }
}
//Note: the type methods are only accessed by using classname.methodname and in type methods we can only use static variables
let person1=Person(personName: "Ajay", personAge: 22, personSal: 12000, personRole: "IOS Developer")
let details=person1.personDetails()
print(details)
print(Person.maxSalary(23))

//stored and computed values
class Square{
    var length:Int
    var width:Int
    var perfectSquare:Bool{
        get {
            return length==width
        }
        set{
            if (newValue){
                length=width
            }
        }
    }
    init(length: Int, width: Int) {
        self.length = length
        self.width = width
    }
    var perimeter:Int{
        return length+width
    }
}

let square1=Square(length: 10, width: 15)
print(square1.perimeter)
print(square1.perfectSquare)
square1.perfectSquare=true
print(square1.perimeter)

//swift protocols
protocol message{
    var name:String{get}
    func details(_ age:Int)->String
}
class Human:message{
    var name="Ajay"
    func details(_ age:Int=22)->String{
        return "\(name) and your age is:\(age)"
    }
}
print(Human().details())

//opaque return type
func add(_ num1:Int,_ num2:Int)->some Equatable{
    return num1+num2
}
func concat()->some Equatable{
    return "Ajay"
}
print(add(10, 10))
print(concat())

//Example on OOPS
class Book{
    var bookName:String
    var bookAuthor:String
    var bookYearPublished:Int
    var bookPrice:Double
    init(bookName: String, bookAuthor: String, bookYearPublished: Int, bookPrice: Double) {
        self.bookName = bookName
        self.bookAuthor = bookAuthor
        self.bookYearPublished = bookYearPublished
        self.bookPrice = bookPrice
    }
    func bookDetails()->String{
        return "The book \(bookName) is written by \(bookAuthor) which was published in the year \(bookYearPublished) and now the price of book is \(bookPrice)"
    }
    func changeAuthor(newAuthor:String)->String{
        bookAuthor=newAuthor
        return "\(newAuthor) has been updated"
    }
}
let book1=Book(bookName: "HarryPotters", bookAuthor: "JK Rowling", bookYearPublished: 2002, bookPrice: 350.0)
print(book1.bookDetails())
print(book1.changeAuthor(newAuthor: "Ajay"))
print(book1.bookAuthor)
//print(add(10,20)==concat())
