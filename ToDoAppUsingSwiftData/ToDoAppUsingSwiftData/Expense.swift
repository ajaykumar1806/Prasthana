//
//  Expense.swift
//  ToDoAppUsingSwiftData
//
//  Created by G Ajay on 13/03/25.
//

import Foundation
import SwiftData

@Model
class Expense {
    var name:String
    var date:Date
    var value:Int
    
    init(name: String, date: Date, value: Int) {
        self.name = name
        self.date = date
        self.value = value
    }
}
