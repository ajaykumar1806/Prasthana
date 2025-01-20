import UIKit

import Foundation

//1.implicit returns from single expression
func demo(name:String , age:Int) -> String{
    "your name is : \(name) and age is:\(age)"
}
print(demo(name:"ajay",age:22))


//2.local and external parameter names
    //1.Local
    func a(name:String ,age:Int){
        
    }
    //2.external parameters
    func b(_ name:String,_age:Int){
        
    }


//3.declaring default function parameters
func c(_ name:String="ajay" , age:Int)->String{
    return "\(name) , age is: \(age)"
}
print(c(age:22))


//4.returning multiple results
func d(_ num:Int)->(String,Int,Double){
    let name="ajay"
    let age=22
    let sal=12000.0
    return (name,age,sal)
}
print(d(1))


//5.variable number of function parameters
func e(_ names:String...){
    //so it accepts n number of arguments of only String type
}


//6.parameters as variables
func add1(_ num1:Int,_ num2:Int)->Int{
    var num1=num1
    var num2=num2
    return num1+num2
}
print(add1(20,20))


//7.working with in-out parameters
var x=10
func doubleValue(_ num: inout Int)->Int{
    num+=num
    return num
}
print("before call: \(x)")
print("during \(doubleValue(&x))")
print("after call \(x)")


//function as function parameter
let a=2
let b=3
func add(_ a:Int,_ b:Int)->Int{
    return a+b
}
func multiply(_ c:Int,_ add:(Int,Int)->Int)->Int{
    return add(a,b)*c
}
print(multiply(10, add))


//closures in swift
func functionA()->()->Int{
    let variable=20
    func functionB()->Int{
        return variable
    }
    return functionB
}
let myNumber=functionA()
print(myNumber())

//closures
var store={(_ a:Int,_ b:Int) in
   print(a+b)
}
store(10,5)
