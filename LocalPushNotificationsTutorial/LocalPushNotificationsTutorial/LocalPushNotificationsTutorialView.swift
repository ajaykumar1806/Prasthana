//
//  ContentView.swift
//  LocalPushNotificationsTutorial
//
//  Created by G Ajay on 19/03/25.
//

import SwiftUI
import UserNotifications

struct LocalPushNotificationsTutorialView: View {
    var body: some View {
        VStack(spacing: 30) {
            Button("Request Permission") {
                NotificationManager.instance.requestPermission()
            }
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel Notifications") {
                NotificationManager.instance.cancelNotifications()
            }
        }
    }
}

class NotificationManager {
    static let instance = NotificationManager()
    
    let options : UNAuthorizationOptions = [.alert, .badge, .sound]
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print(success ? "Permission Granted" : "Permission Denied")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is the first notification"
        content.subtitle = "This is the subtitle of the first notification"
        content.sound = .default
        content.badge = 1
        
        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        var dateComponent = DateComponents()
        dateComponent.hour = 10
        dateComponent.minute = 12
        
        let dateTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let request = UNNotificationRequest(identifier: "firstNotification",
                                            content: content,
                                            trigger: timeTrigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

#Preview {
    LocalPushNotificationsTutorialView()
}
