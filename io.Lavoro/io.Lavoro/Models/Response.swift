//
//  Response.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation

struct Response {
    var application: Application
    var message: String
    
    init(application: Application, message: String) {
        self.application = application
        self.message = message
    }
}

extension Response: Codable {
    enum CodingKeys: String, CodingKey {
        case application
        case message
    }
}
