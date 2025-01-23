import Foundation

func readJsonData(_ fileName:String) -> Data {
    let url = Bundle.main.url(forResource: fileName, withExtension: "json")
    return try! Data(contentsOf: url!)
}
func findQuarter(from dateString:String) -> String? {
    var dateArray=[String]()
    for char in dateString{
        dateArray.append(String(char))
    }
    var month=""
    var year=""
    var date=""
    for i in 0...dateArray.count-1{
        if i<4{
            year+=String(dateArray[i])
        }
        else if i>4 && i<7{
            month+=String(dateArray[i])
        }
        else if i>7{
            date+=String(dateArray[i])
        }
    }
    let quarter=((Int(month)!-1)/3)+1
    return "Quarter-\(quarter) - \(year)"
}
struct Event:Decodable{
    let name:String
    let date:String
    let time:String
    let location:String
}
func sortEvents(fileNameWithoutExtension:String){
    let jsonData=readJsonData(fileNameWithoutExtension)
    let events=try! JSONDecoder().decode([Event].self, from: jsonData)
    var groupedEvents=[String:[Event]]()
    for event in events {
        let quarter = findQuarter(from: event.date)
        groupedEvents[quarter!,default: []].append(event)
    }
    let sortQuarters=groupedEvents.keys.sorted(by: >)
    for quarter in sortQuarters {
        print("   \(quarter)   ")
        var events=groupedEvents[quarter]
        events!.sort{ $0.date > $1.date}
        for event in events! {
            print(event)
        }
    }
}
sortEvents(fileNameWithoutExtension: "events")
