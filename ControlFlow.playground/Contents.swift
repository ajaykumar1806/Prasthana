import UIKit
import Foundation

//for loop
var count=0
for _ in 1...10{
    count+=1
}
print(count)

//repeat...while loop
var i=10
repeat{
    i-=1
}while i>10
print(i)

//breaking the loops

var x=3
for _ in x...102{
    x+=x
    if x>=51{
        break
    }
    print("x value = \(x)")
}

//continueing the loops
var y=2
while y<=38{
    y+=1
    if(y%2 == 0){
        continue
    }
    else{
       print(y)
    }
}

//conditional statements

//4.guard statement

func predictNumber(_ value:Int?)-> String{
    guard let num = value , num<20 else{
        return "please choose a value below 20"
    }
    return "your guess is correct"
}

print(predictNumber(20))
