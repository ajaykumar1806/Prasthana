import UIKit

import Foundation

//basic syntax
let temp=80
switch (temp){
    case 10:
        print("cold")
    case 20:
        print("warm")
    case 30:
        print("hot")
    default:
        print("too hot")
}

//multiple cases
switch(temp){
case 10,20,30,40:
    print("normal temperature")
case 50,60:
    print("fever")
default:
    print("high fever")
}

//ranging in switch
switch temp{
case 0...30:
    print("normal")
case 31...60:
    print("warm")
case 61...:
    print("hot")
default:
    print("too hot")
}

//where condition in switch
switch(temp){
case 0...90 where temp%2 == 0:
    print("cold and odd")
default:
    print(temp)
}

//fallthrough in switch
switch temp{
case 0...30:
    print("normal")
    fallthrough
case 31...60:
    print("warm")
    fallthrough
case 61...:
    print("hot")
    fallthrough
default:
    print("too hot")
}

var value=20
switch value{
    case 1...20:
    print("a")
    fallthrough
case 20:
    print("b")
    fallthrough
default:
    print("c")
}

var a=10
switch a{
case 5 where a%2==5:
    print("hello")

default:
    print("hi")
}
