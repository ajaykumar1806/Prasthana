import UIKit

//let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//print(names.sorted(by: <))

class Demo {
    var name="ajay"
    var age=22
}
class Demo2 {
    var name:String
    var age:Int
    init(_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }
    func displayDetails() -> String {
        return "The name is \(name) and age is \(age)"
    }
    class func cubeOfNumber(_ num:Int...) -> Int {
        return num[0]*num[1]*num[2]
    }
}
let person=Demo2("ajay", 22)
print(person.displayDetails())
print(Demo2.cubeOfNumber(5,8,9))

//Bank Account Example
class BankAccount {
    var personName:String
    var accountNumber:Int
    var openingBalance:Int
    init(personName: String, accountNumber: Int, openingBalance: Int) {
        self.personName = personName
        self.accountNumber = accountNumber
        self.openingBalance = openingBalance
    }
}
class SavingsAccount: BankAccount {
    var accountName:String
    var accountBalance:Int
    init(accountName: String, accountBalance: Int,personName: String, accountNumber: Int, openingBalance: Int) {
        self.accountName = accountName
        self.accountBalance = accountBalance
        super.init(personName: personName, accountNumber: accountNumber, openingBalance: openingBalance)
    }
    func depositAmount(_ amount:Int) -> Int {
        accountBalance=accountBalance+amount
        return accountBalance
    }
    func withdrawAmount(_ amount:Int) -> Int {
        guard accountBalance>=amount else {
            print("Insufficient Balance")
            return 0
        }
        accountBalance-=amount
        return accountBalance
    }
    func displayBalance()->Int{
        return openingBalance+accountBalance
    }
}
let account1=SavingsAccount(accountName: "Savings", accountBalance: 0, personName: "Ajay", accountNumber: 726901000391, openingBalance: 500)
account1.depositAmount(500)
account1.withdrawAmount(200)
print(account1.displayBalance())

//Ploy-morphism concept
class FixedAccountType: SavingsAccount {
    override func withdrawAmount(_ amount: Int) -> Int {
        print("Withdrawing the amount is not available for this type")
        return 0
    }
}
let account2:SavingsAccount=FixedAccountType(accountName: "Savings", accountBalance: 300, personName: "ajay", accountNumber: 84328493284, openingBalance: 300)
account2.withdrawAmount(100)

//basic abstraction concept
protocol name{
    var name1:String{get}
    
}
class demo3:name{
    var name1:String
    init(name1: String) {
        self.name1 = name1
    }
}

let arr=["a","e","d","c","b"]
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(arr.sorted())
print(names.sorted())
