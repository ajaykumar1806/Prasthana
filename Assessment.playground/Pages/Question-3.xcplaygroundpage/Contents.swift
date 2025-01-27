//: [Previous](@previous)

//Read the JSON File and group the events as
      //1. By Quarter in Descending Order

import Foundation

struct Event: Decodable {
    var name:String
    var date:String
    var time:String
    var location:String
    var parsedDate: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: date)
    }
}

func readJsonData(_ fileName:String)->[Event]?{
    guard let url=Bundle.main.url(forResource: fileName, withExtension: "json") else{
        print("file Not found")
        return nil
    }
    do {
        let data=try Data(contentsOf: url)
        let events=try JSONDecoder().decode([Event].self, from: data)
        return events
    }
    catch {
        print("Error decoding the Json file : \(error)")
        return nil
    }
}

var eventDictionary=[String:[Event]]()
if let events=readJsonData("events"){
    for event in events{
        if let date=event.parsedDate{
            let month=Calendar.current.component(.month, from: date)
            let year=Calendar.current.component(.year, from: date)
            let quarter="\(year): Quarter-\(((month-1)/3)+1)"
            eventDictionary[quarter,default: []].append(event)
        }
        else {
            print("Unable to retrive parsed date")
        }
    }
    let sortedQuarters=eventDictionary.keys.sorted(by: <)
    for value in sortedQuarters{
        print("\(value)")
        if var events=eventDictionary[value]{
            events.sort{$0.date > $1.date}
            for event in events { print(event) }
        }
    }
}

//: [Next](@next)
