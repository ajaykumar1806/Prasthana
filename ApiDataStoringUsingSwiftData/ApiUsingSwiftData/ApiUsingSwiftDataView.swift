//
//  ContentView.swift
//  ApiUsingSwiftData
//
//  Created by G Ajay on 17/03/25.
//

import SwiftUI
import SwiftData

struct ApiUsingSwiftDataView: View {
    @Environment(\.modelContext) private var context
    @Query private var users:[SwiftDataUserModel]
    var body: some View {
        List {
            Text("Total Users").font(.title).bold()
            ForEach(users) { user in
                VStack(alignment: .leading, spacing: 10) {
                    Text("UserId: \(user.userId)")
                    Text("Id: \(user.id)")
                    Text("Title: \(user.title)")
                    Text("Body: \(user.body)")
                }
            }
        }
    }
}

#Preview {
    ApiUsingSwiftDataView()
}
