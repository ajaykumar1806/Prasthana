//
//  ApiUsingSwiftDataViewModel.swift
//  ApiUsingSwiftData
//
//  Created by G Ajay on 17/03/25.
//

import Foundation
import Moya

class ApiUsingSwiftDataViewModel {
    let provider = MoyaProvider<UserApi>()
    func fetchUsers() async throws -> [User] {
        do {
            let response = try await provider.request(.user)
            let users = try JSONDecoder().decode([User].self, from: response.data)
            return users
        } catch {
            fatalError("\(error)")
        }
    }
}


enum UserApi {
    case user
}

extension UserApi:TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/")!
    }
    
    var path: String {
        return "posts"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}

extension MoyaProvider<UserApi> {
    func request(_ target:Target) async throws -> Response {
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
