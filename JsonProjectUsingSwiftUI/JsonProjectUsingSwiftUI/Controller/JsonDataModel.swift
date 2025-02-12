//
//  JsonData.swift
//  JsonProjectUsingSwiftUI
//
//  Created by G Ajay on 10/02/25.
//

import Foundation

func eventDayName(dateString:String)->String? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    if let date = formatter.date(from:dateString){
        formatter.dateFormat = "EEE"
        let day = formatter.string(from: date).uppercased()
        return day
    }
    return nil
}

func eventDay(dateString:String)->Int? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    if let date = formatter.date(from:dateString){
        return Calendar.current.component(.day, from: date)
    }
    return nil
}

func eventDayFormat(dateString:String) -> String? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    if let date = formatter.date(from: dateString) {
        formatter.dateFormat = "EEEE, dd MMMM yyyy"
        return formatter.string(from: date)
    }
    return nil
}

func fetchJsonData() -> [String:[Event]] {
    var dictionaryOfEvents = [String:[Event]]()
    if let url = Bundle.main.path(forResource: "events", ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(filePath: url))
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
    print("Unable to fetch the file")
    return [:]
}




