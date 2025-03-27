//
//  EventViewModel.swift
//  JsonProjectUsingSwiftUI
//
//  Created by G Ajay on 11/02/25.
//

import Foundation

class EventViewModel: ObservableObject {
    @Published var dictOfEvents: [String: [Event]] = [:]

    init() {
        self.dictOfEvents = fetchJsonData()
    }

    var sortedKeys: [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM-yyyy"
        return dictOfEvents.keys.sorted {
            guard let date1 = formatter.date(from: $0), let date2 = formatter.date(from: $1) else { return false }
            return date1 < date2
        }
    }
}

