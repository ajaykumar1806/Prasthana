//
//  LocalPushNotificationsTutorialView2.swift
//  LocalPushNotificationsTutorial
//
//  Created by G Ajay on 20/03/25.
//

import SwiftUI
import UserNotifications

struct LocalPushNotificationsTutorialView2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

class LocalPushNotificationsTutorialView2ViewModel {
    
    func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                if granted {
                    print("Permission granted")
                } else if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Permission Denied")
                }
            }
    }
}

#Preview {
    LocalPushNotificationsTutorialView2()
}
