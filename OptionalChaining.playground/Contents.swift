import UIKit

                //OPTIONAL CHAINING

//It is a process for querying and calling properties,methods and subscripts on an optional that might currently be nil.

//Optional chaining as an alternative for forced unwrapping
    //(we use ! for force unwrap which results in run-time error when the value is nil)
//Example:
//class Person {
//    var residence:Residence?
//}
//class Residence {
//    var rooms=1
//}
//let person1=Person()
////person1.residence=Residence()
//if let roomsCount=person1.residence?.rooms{
//    print(roomsCount, "and passed the condition")
//}
//else {
//    print("not possible")
//}

//Defining Model classes for optional chaining
class Person {
    var residence:Residence?
}
class Residence {
    var rooms:[Room]=[]
    var numberOfRooms:Int{
        return rooms.count
    }
    subscript(i:Int)->Room{
        get{
            return rooms[i]
        }
        set{
            rooms[i]=newValue
        }
    }
    func printNumberOfRooms() {
        print(numberOfRooms)
    }
    var address:Address?
}
class Room {
    var name:String
    init(name: String) {
        self.name = name
    }
}
class Address {
    var buildingName:String?
    var buildingNumber:String?
    var street:String?
    func buildingIdentifier() -> String? {
        if let buildingName=buildingName,let buildingNumber=buildingNumber,let street=street {
            return ("\(buildingName) \(buildingNumber) \(street)")
        }
        else {
            return nil
        }
    }
}

//Accessing properties through optional chaining
let person1=Person()
if let roomCount=person1.residence?.numberOfRooms{
    print("rooms are available")
}
else{
    print("not possible to fetch number of rooms")
}

//Setting properties value through optional chaining
let someAddress=Address()
someAddress.buildingName="Myra Residency"
someAddress.buildingNumber="29"
someAddress.street="Acacia Road"
person1.residence?.address=someAddress //(this will fail because person1.residence is currently nil)

//Calling methods through optional chaining
if person1.residence?.printNumberOfRooms() != nil{
    print("it is possible")
}
else{
    print("it is not possible") //(prints this because the person1.residence is nil)
}

//Acessing subscripts through optional chaining
//Example:
if let roomName=person1.residence?[0].name{
    print(roomName,"This operation is possible")
}
else{
    print("Not possible") //(prints this because the person1.residence is nil)
}
//So to make it pass then we need to do following modifications
    //i. create and assig an actual Residence instance to person1.residence with 1 or more room instances in its rooms array
let jhonHouse=Residence()
jhonHouse.rooms.append(Room(name: "Living room"))
jhonHouse.rooms.append(Room(name: "kitchen"))
person1.residence=jhonHouse
if let room=person1.residence?[0].name{
    print(room) //(prints this because person1.residence is initialised with original Residence() instance with help of jhonHouse variable
}
else{
    print("still not possible")
}


