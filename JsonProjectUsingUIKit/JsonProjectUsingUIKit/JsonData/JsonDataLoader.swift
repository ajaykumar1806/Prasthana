//
//  JsonDataLoader.swift
//  JsonProjectUsingUIKit
//
//  Created by G Ajay on 07/02/25.
//

import Foundation

func jsonDataRetrieval() -> [String:[Event]] {
    var dictionaryOfEvents = [String:[Event]]()
    if let url = Bundle.main.path(forResource: "events", ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: url))
            let events = try JSONDecoder().decode([Event].self, from: data)
            for event in events {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                if let date = formatter.date(from: event.date) {
                    formatter.dateFormat = "MMMM-yyyy"
                    let key = formatter.string(from: date)
                    if dictionaryOfEvents[key] == nil {
                        dictionaryOfEvents[key] = []
                    }
                    dictionaryOfEvents[key]?.append(event)
                }
            }
            return dictionaryOfEvents
        }
        catch {
            print("Unable to decode the file")
            return [:]
        }
    }
    else {
        print("Unable to fetch the file")
        return [:]
    }
}
