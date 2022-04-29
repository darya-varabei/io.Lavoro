//
//  Skill.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation

final class Skill: Hashable, Equatable {
    var name: String
    var level: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func ==(lhs: Skill, rhs: Skill) -> Bool {
        return lhs.name == rhs.name
    }
    
    init(name: String, level: String) {
        self.name = name
        self.level = level
    }
}

extension Skill: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case level
    }
}

