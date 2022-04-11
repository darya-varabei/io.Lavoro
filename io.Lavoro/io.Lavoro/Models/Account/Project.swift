//
//  Project.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation
import SwiftUI

class Project: Account {
    
    var user: User
    var category: String
    var name: String
    var location: String
    var description: String
    var offers: [Offer]?
    var mode: String
    
    init(user: User, name: String, location: String, description: String, offers: [Offer]? = nil, category: String, mode: String) {
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
        return mode
    }
    
    func getPhoto() -> UIImage {
        return user.photo
    }
    
    func getCategory() -> String {
        return category
    }
}
