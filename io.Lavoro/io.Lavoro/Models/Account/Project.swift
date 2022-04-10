//
//  Project.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation

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
}
