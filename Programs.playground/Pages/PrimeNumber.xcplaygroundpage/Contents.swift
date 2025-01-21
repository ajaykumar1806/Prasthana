//: [Previous](@previous)

import Foundation

let num=97
func isPrime(_ num:Int) -> Bool {
    for i in 2...num/2{
        if num%i==0{
            return false
        }
    }
    return true
}
print(isPrime(num) ? "Prime number" : "Not a prime number")
//: [Next](@next)
