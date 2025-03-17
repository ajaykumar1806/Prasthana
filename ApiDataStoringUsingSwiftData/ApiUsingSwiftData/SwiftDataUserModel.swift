//
//  SwiftDataUserModel.swift
//  ApiUsingSwiftData
//
//  Created by G Ajay on 17/03/25.
//

import Foundation
import SwiftData

@Model
class SwiftDataUserModel {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
