import UIKit

var greeting = "Hello, playground"

//Assignment Operators
var a:Int?
var y=10
a=20
a=y
a=a!+y
print(a) //output is 20

//Compound Assignment operators
var x=20
y=30
x+=y //50
x-=y //-10
x*=y //600
x/=y //0
x%=y //20

//arithematic operators

//boolean logical operators
var bool=true
var bool2 = !bool //false
var num1=5
var num2=10
var res=(num1<num2) && (num1 + num2 == 15) //true
var res2 = num1>num2 || num1-num2<0 //true

//ternary operators
var result = num1+num2==15 ? true :false

//range operators
let range1=10
let range2=20
for index in range1...range2{
    print(index)
}

//nil operator
var num:Int?
num=10
if(num==nil){
    print("a")
}
else{
    print("b")
}
