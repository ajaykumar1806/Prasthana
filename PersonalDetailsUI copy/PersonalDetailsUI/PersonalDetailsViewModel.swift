//
//  PersonalDetailsViewModel.swift
//  Task
//
//  Created by G Ajay on 21/02/25.
//

import Foundation
import Moya
import SwiftUI
import UserNotifications

let appColor = Color.primaryColor
let backgroundColor = Color.primaryColor.opacity(0.2)

@available(iOS 17.0, *)
@Observable class PersonalDetailsViewModel {
  var user: User?
    
    func fetchPersonalDetails(userId:Int) async {
        do {
            let data = try await personalDetails(userId: userId)
            user = data?.user
        } catch {
            print("Error fetching user details: \(error)")
        }
    }
    
    private func personalDetails(userId:Int) async throws -> MainUser?  {
        let provider = MoyaProvider<UserAPI>()
        let token = try await fetchToken()
        let response = try await provider.request(.personalDetails(userId: userId, token: token))
        
        guard response.statusCode == 200 else { throw URLError(.badServerResponse) }
            do {
                let decoder = JSONDecoder()
                let mainUser = try decoder.decode(MainUser.self, from: response.data)
                return mainUser
            } catch {
                print("Error decoding response: \(error)")
            }
        return nil 
    }
    
    private func fetchVerificationCode() async throws -> String {
        let provider = MoyaProvider<UserAPI>()
        let response = try await provider.request(.verificationCode)

        let json = try JSONSerialization.jsonObject(with: response.data) as? [String: Any]
        guard let code = json?["verification_code"] as? String else {
            throw URLError(.cannotParseResponse)
        }
        return code
    }

    private func fetchToken() async throws -> String {
        let provider = MoyaProvider<UserAPI>()
        let verificationCode = try await fetchVerificationCode()

        let response = try await provider.request(.token(
            verificationCode: verificationCode
        ))

        let json = try JSONSerialization.jsonObject(with: response.data) as? [String: Any]
        guard let token = json?["access_token"] as? String else {
            throw URLError(.cannotParseResponse)
        }
        return token
    }
    
    func dateFormatter(dateString: String, outputTimeZone: TimeZone = TimeZone(abbreviation: "UTC")!) -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        guard let date = isoFormatter.date(from: dateString) else {
          print("Failed to parse date from string.")
          return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM hh:mm a"
        formatter.timeZone = outputTimeZone
        return formatter.string(from: date)
      }

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted")
            } else if let error = error {
                print("Error requesting notification permission: \(error)")
            }
        }
    }
    
    func scheduleCourtNotifications() {
        let user = user.self
        guard let courts = user?.recentCourts else { return }
        for court in courts {
            NotificationManager.instance.recentCourtNotifications(recentCourt: court)
        }
    }
}

class NotificationManager {
    static let instance = NotificationManager()

    func recentCourtNotifications(recentCourt: RecentCourt) {
//        guard let time = recentCourt.startTime , 
//              let date = ISO8601DateFormatter().date(from: time) else { return }
        let date = Date().addingTimeInterval(60)

        let content = UNMutableNotificationContent()
        content.title = "Booking Reminder"
        content.body = "You have a court at \(recentCourt.courtFullName ?? "") is successful"
        content.sound = .default

        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

        let request = UNNotificationRequest(identifier: "court-\(recentCourt.id ?? 0)", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

enum UserAPI {
    case verificationCode
    case token(verificationCode: String)
    case personalDetails(userId:Int , token: String)
}

extension UserAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://api-stage.tenmates.app")!
    }

    var path: String {
        switch self {
        case .verificationCode:
            return "/verifications/verify_sms_code"
        case .token:
            return "/oauth/token"
        case .personalDetails(let userId , _):
            return "/users/\(userId)/profile"
        }
    }

    var method: Moya.Method {
        switch self {
        case .verificationCode, .token:
            return .post
        case .personalDetails:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .verificationCode:
            let params : [String:Any] = [
                "code": 123456,
                "country_code": 91,
                "mobile_number": 9133555447,
                "region_code": "IN"
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)

        case .token(let verificationCode):
            let params: [String: Any] = [
                "client_id": "gYanhpa87VxQqkJ-7J8fOy5ehRLvkdat6uWbtjpFUtQ",
                "client_secret": "Wj9wd0jWkCVEPt2hKk3IK2QjUOy3fTMFzzykxRH0PDU",
                "username": 9133555447,
                "verification_code": verificationCode,
                "grant_type": "password"
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.httpBody)

        case .personalDetails:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        switch self {
        case .verificationCode, .token:
            return [:]

        case .personalDetails(_ , let token):
            return [
                "Authorization": "Bearer \(token)",
                "Accept": "application/vnd.prasthana.com; version=1"
            ]
        }
    }
}

extension MoyaProvider {
    func request(_ target: Target) async throws -> Response {
        return try await withCheckedThrowingContinuation { continuation in
            self.request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
