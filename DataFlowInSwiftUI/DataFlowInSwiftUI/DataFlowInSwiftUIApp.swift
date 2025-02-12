//
//  DataFlowInSwiftUIApp.swift
//  DataFlowInSwiftUI
//
//  Created by G Ajay on 12/02/25.
//

import SwiftUI

@main
struct DataFlowInSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            AccountView().environmentObject(Profile())
        }
    }
}
