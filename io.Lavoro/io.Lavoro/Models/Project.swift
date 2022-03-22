//
//  Project.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation

class Project {
    var name: String
    var location: String
    var description: String
    var offers: [Offer]
    
    init(name: String, location: String, description: String, offers: [Offer]) {
        self.name = name
        self.location = location
        self.description = description
        self.offers = offers
    }
}
