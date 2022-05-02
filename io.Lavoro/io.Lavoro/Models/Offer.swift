//
//  Offer.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation

struct Offer: Hashable, Equatable, Identifiable {
    var id: UUID?
    var project: Project
    var name: String
    var mode: String
    var timeMode: String
    var salary: String
    var technologies: [Technology]
    var description: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func ==(lhs: Offer, rhs: Offer) -> Bool {
        return lhs.name == rhs.name
    }
    
    init(project: Project, name: String, technologies: [Technology], mode: String, salary: String, timeMode: String, description: String) {
        self.project = project
        self.name = name
        self.technologies = technologies
        self.mode = mode
        self.salary = salary
        self.timeMode = timeMode
        self.description = description
    }
}

extension Offer: Codable {
    enum CodingKeys: String, CodingKey {
        case project
        case name
        case mode
        case timeMode
        case salary
        case technologies
        case description
    }
}
