//
//  JsonDataLoader.swift
//  JsonProject
//
//  Created by G Ajay on 03/02/25.
//

import Foundation



func jsonDateRetrieval()->[String:[Event]] {
    var eventsDictionary=[String:[Event]]()
    if let url=Bundle.main.path(forResource: "events", ofType: "json"){
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: url))
            let decodedEvents = try JSONDecoder().decode([Event].self, from: data)
            for event in decodedEvents {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                if let parsedDate = formatter.date(from: event.date) {
                    let month = Calendar.current.component(.month, from: parsedDate)
                    let year = Calendar.current.component(.year, from: parsedDate)
                    let monthSymbol = "\(Calendar.current.monthSymbols[month-1])-\(year)"
                    if eventsDictionary[monthSymbol] == nil {
                        eventsDictionary[monthSymbol] = []
                    }
                    eventsDictionary[monthSymbol]?.append(event)
                }
            }
            return eventsDictionary
        }
        catch {
            print("Error decoding the file")
            return [:]
        }
    }
    else {
        print("Error fetching the file")
        return [:]
    }
}
