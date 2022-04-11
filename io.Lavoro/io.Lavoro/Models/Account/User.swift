//
//  User.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 21.03.22.
//

import Foundation
import UIKit

struct User: Hashable, Equatable {
    var username: String
    var role: String
    var photo: SomeImage
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(username)
    }
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username
    }
    
    init(username: String, role: String, photo: SomeImage) {
        self.username = username
        self.role = role
        self.photo = photo
    }
}

extension User: Codable {
    enum CodingKeys: String, CodingKey {
        case username
        case role
        case photo
    }
}
