//
//  TestModel.swift
//  Test
//
//  Created by G Ajay on 12/03/25.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id: Int?
    let name, email: String?
    let gender: Gender?
    let status: Status?
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

enum Status: String, Codable {
    case active = "active"
    case inactive = "inactive"
}

// MARK: - Photo
struct Photo: Codable {
    let albumID, id: Int?
    let title: String?
    let url, thumbnailURL: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
