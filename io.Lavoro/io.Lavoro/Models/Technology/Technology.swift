//
//  Technology.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 23.03.22.
//

import Foundation

struct Technology: Hashable, Equatable {
    var name: String
    var level: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func ==(lhs: Technology, rhs: Technology) -> Bool {
        return lhs.name == rhs.name
    }
    
    init(name: String, level: String) {
        self.name = name
        self.level = level
    }
}

extension Technology: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case level
    }
}
