//
//  EventViewModel.swift
//  Task
//
//  Created by G Ajay on 18/02/25.
//

import SwiftUI

let appColor:Color = Color.init(red: 0.75, green: 0.9, blue: 0)
let appColorGradient:LinearGradient = LinearGradient(colors: [appColor.opacity(0.2) , .black.opacity(0.3) , appColor.opacity(0.2)], startPoint: .leading, endPoint: .trailing)


final class EventViewModel:ObservableObject {
    
    @Published var courts = [CourtCell]()
    @Published var isWithInTeam:Bool = false
    @Published var isCoachAvailable:Bool = false
    @Published var isAudienceAvailable:Bool = true
    
    
    init() {
        loadCourts()
    }
    func loadCourts() {
        courts = [
            CourtCell(courtNumber: 1, singleOrDouble: "Single", weekDay: "wednesday", month: "June", date: 02, time: "8AM", duration: "2h", location: "web bridge pickel ball courts", numberOfPlayers: 2, district: "Sports District", city: "Orlando", pincode: "FL 32801"),
            CourtCell(courtNumber: 2, singleOrDouble: "Single", weekDay: "wednesday", month: "June", date: 02, time: "10AM", duration: "2h", location: "web bridge pickel ball courts", numberOfPlayers: 2, district: "Sports District", city: "Orlando", pincode: "FL 32801"),
            CourtCell(courtNumber: 3, singleOrDouble: "Single", weekDay: "wednesday", month: "June", date: 02, time: "9AM", duration: "2h", location: "web bridge pickel ball courts", numberOfPlayers: 2, district: "Sports District", city: "Orlando", pincode: "FL 32801"),
            CourtCell(courtNumber: 4, singleOrDouble: "Single", weekDay: "wednesday", month: "June", date: 02, time: "7AM", duration: "2h", location: "web bridge pickel ball courts", numberOfPlayers: 2, district: "Sports District", city: "Orlando", pincode: "FL 32801"),
            CourtCell(courtNumber: 5, singleOrDouble: "Single", weekDay: "wednesday", month: "June", date: 02, time: "10AM", duration: "2h", location: "web bridge pickel ball courts", numberOfPlayers: 2, district: "Sports District", city: "Orlando", pincode: "FL 32801")
        ]
    }
    
    
}


