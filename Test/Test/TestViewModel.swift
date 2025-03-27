//
//  TestViewModel.swift
//  Test
//
//  Created by G Ajay on 12/03/25.
//

import Foundation
import Moya

@Observable class TestViewModel {
    var users: [User] = []
    var photos: [Photo] = []
    
    private let provider = MoyaProvider<Api>()
    
    func fetchUsers() async {
        do {
            let response = try await provider.request(.users)
            let decodedUsers = try JSONDecoder().decode([User].self, from: response.data)
            users = decodedUsers
        } catch {
            print("Error fetching users: \(error)")
        }
    }
    
    func fetchPhotos() async {
        do {
            let response = try await provider.request(.photos)
            let decodedPhotos = try JSONDecoder().decode([Photo].self, from: response.data)
            photos = decodedPhotos
        } catch {
            print("Error fetching photos: \(error)")
        }
    }
    
    func verifyUser(email: String, password: String) -> Bool {
        return users.contains { $0.email == email && $0.id == Int(password) }
    }
}

enum Api {
    case users
    case photos
}

extension Api: TargetType {
    var baseURL: URL {
        switch self {
        case .users: return URL(string: "https://gorest.co.in/public/v2")!
        case .photos: return URL(string: "https://jsonplaceholder.typicode.com")!
        }
    }
    var path: String {
        switch self {
        case .users: return "/users"
        case .photos: return "/photos"
        }
    }
    
    var method: Moya.Method { return .get }
    
    var task: Moya.Task { return .requestPlain }
    
    var headers: [String: String]? { return nil }
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

