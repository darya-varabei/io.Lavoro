//
//  Offer.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation

class Offer {
    var project: Project
    var name: String
    var technologies: [Technology]
    
    init(project: Project, name: String, technologies: [Technology]) {
        self.project = project
        self.name = name
        self.technologies = technologies
    }
}
