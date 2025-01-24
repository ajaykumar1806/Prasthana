//: [Previous](@previous)

import Foundation

func readJsonData(_ fileName:String) -> Data {
    let url=Bundle.main.url(forResource: fileName, withExtension: "json")
    return try! Data(contentsOf: url!)
}
func findQuarter(_ dateString:String) -> String {
    var dateArray=Array(dateString)
    var year=""
    var month=""
    for i in 0...6{
        if i<4 {
            year+=String(dateArray[i])
        }
        else if i>4{
            month+=String(dateArray[i])
        }
    }
    let quarter=((Int(month)!-1)/3)+1
    return "\(year): Quarter-\(quarter)"
}
struct Event:Decodable {
    let name:String
    let date:String
    let time:String
    let location:String
}
func sortEventsInDescendingOrderByDate(fileNameWithoutExtension:String) {
    let jsonData=readJsonData(fileNameWithoutExtension)
    var groupedEvents=[String:[Event]]()
    let events=try! JSONDecoder().decode([Event].self, from: jsonData)
    for event in events {
        let quarter = findQuarter(event.date)
        groupedEvents[quarter,default: []].append(event)
    }
    let sortQuarters=groupedEvents.keys.sorted(by: >)
    for quarter in sortQuarters {
        print("   \(quarter)   ")
        var events=groupedEvents[quarter]
        events!.sort{$0.date>$1.date}
        for event in events! {
            print("\(event.name) , \(event.date) , \(event.time) , \(event.location)")
        }
    }
}
sortEventsInDescendingOrderByDate(fileNameWithoutExtension: "events")

//: [Next](@next)
