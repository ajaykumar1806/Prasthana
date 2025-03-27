//
//  Functions.swift
//  PersonalDetailsUI
//
//  Created by G Ajay on 27/02/25.
//

import Foundation

//    func fetchPlayer(playerID:Int) async {
//        do {
//            let data = try await fetchPersonalDetails(userID: playerID)
//            user = data.user
//        } catch {
//            print("Error fetching player details: \(error)")
//        }
//    }
//
//    func fetchVerificationCode() async throws -> String {
//        guard let url = URL(string: "https://api-stage.tenmates.app/verifications/verify_sms_code?code=123456&country_code=91&mobile_number=9133555447&region_code=IN") else {
//            throw URLError(.badURL)
//        }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        let (data, response) = try await URLSession.shared.data(for: request)
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw URLError(.badServerResponse)
//        }
//        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//        if let code = json?["verification_code"] as? String {
//            return code
//        } else {
//            throw URLError(.cannotParseResponse)
//        }
//    }
//
//    func fetchToken() async throws -> String {
//        guard let url = URL(string: "https://api-stage.tenmates.app/oauth/token") else {
//            throw URLError(.badURL)
//        }
//        let client_id = "gYanhpa87VxQqkJ-7J8fOy5ehRLvkdat6uWbtjpFUtQ"
//        let client_secret = "Wj9wd0jWkCVEPt2hKk3IK2QjUOy3fTMFzzykxRH0PDU"
//        let username = "9133555447"
//        let verificationCode = try await fetchVerificationCode()
//        let grant_type = "password"
//
//        let body = "client_id=\(client_id)&client_secret=\(client_secret)&username=\(username)&verification_code=\(verificationCode)&grant_type=\(grant_type)"
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        request.httpBody = body.data(using: .utf8)
//
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw URLError(.badServerResponse)
//        }
//        if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
//           let accessToken = jsonResponse["access_token"] as? String {
//            return accessToken
//        }
//        else {
//            throw URLError(.cannotParseResponse)
//        }
//    }
//
//    func fetchPersonalDetails(userID: Int) async throws -> MainUser {
//        guard let url = URL(string: "https://api-stage.tenmates.app/users/\(userID)/profile") else {
//            throw URLError(.badURL)
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        request.setValue("Bearer \(try await fetchToken())", forHTTPHeaderField: "Authorization")
//        request.setValue("application/vnd.prasthana.com; version=1", forHTTPHeaderField: "Accept")
//
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//            throw URLError(.badServerResponse)
//        }
//
//        let decoder = JSONDecoder()
//        return try decoder.decode(MainUser.self, from: data)
//    }
