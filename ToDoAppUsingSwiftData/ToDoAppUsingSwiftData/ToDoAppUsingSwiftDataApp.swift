//
//  ToDoAppUsingSwiftDataApp.swift
//  ToDoAppUsingSwiftData
//
//  Created by G Ajay on 13/03/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoAppUsingSwiftDataApp: App {
    
    let container : ModelContainer = {
        let schema = Schema([Expense.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
//        .modelContainer(for:[Expense.self])
    }
}
