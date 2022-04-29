//
//  Project.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation
import SwiftUI

struct Project: Account, Hashable, Equatable {
    
    var user: User
    var category: String
    var id: UUID?
    var photo: Data?
    var name: String
    var location: String
    var description: String
    var offers: [Offer]?
    var mode: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func ==(lhs: Project, rhs: Project) -> Bool {
        return lhs.name == rhs.name
    }
    
    init(user: User, name: String, location: String, description: String, offers: [Offer]? = nil, category: String, mode: String, id: UUID? = nil) {
        self.user = user
        self.name = name
        self.location = location
        self.description = description
        self.offers = offers
        self.category = category
        self.mode = mode
    }
    
    func getName() -> String {
        return name
    }
    
    func getSpecialization() -> String {
        return ""
    }
    
    func getDescription() -> String {
        return description
    }
    
    func getSkills() -> [Skill] {
        return []
    }
    
    func getLocation() -> String {
        return location
    }
    
    func getRelocate() -> String {
        return ""
    }
    
    func getInterests() -> String {
        return ""
    }
    
    func getMode() -> String {
        return mode!
    }
    
    func getPhoto() -> UIImage {
        return UIImage(data: user.photo.photo)!
    }
    
    func getCategory() -> String {
        return category
    }
}

extension Project: Codable {
    enum CodingKeys: String, CodingKey {
        case user
        case category
        case name
        case location
        case description
        case offers
        case mode
        case id
    }
}
