//
//  ApiUsingSwiftDataApp.swift
//  ApiUsingSwiftData
//
//  Created by G Ajay on 17/03/25.
//

import SwiftUI
import SwiftData

@main
struct ApiUsingSwiftDataApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            PostLoader.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
    
    let container = try! ModelContainer(for: SwiftDataUserModel.self)
    
    @MainActor
    private func fetchUsers() async {
        let context = container.mainContext
        do {
            let users = try await ApiUsingSwiftDataViewModel().fetchUsers()
            if !users.isEmpty {
                users.forEach { user in
                    let userModel = SwiftDataUserModel(userId: user.userId, id: user.id, title: user.title, body: user.body)
                    context.insert(userModel)
                }
            }
        } catch {
            print(error)
        }
    }

    var body: some Scene {
        WindowGroup {
            ApiUsingSwiftDataView()
                .task {
                    await fetchUsers()
                }
        } .modelContainer(container)
//        .modelContainer(sharedModelContainer)
//        .modelContainer(for:SwiftDataUserModel.self)
    }
}
