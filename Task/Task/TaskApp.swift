//
//  TaskApp.swift
//  Task
//
//  Created by G Ajay on 17/02/25.
//

import SwiftUI

@main
struct TaskApp: App {
    var body: some Scene {
        WindowGroup {
            EventView(courts: courts)
        }
    }
}
