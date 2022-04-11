//
//  Technology.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 23.03.22.
//

import Foundation

struct Technology {
    var name: String
    var level: String
    
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
