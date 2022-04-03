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
    var mode: String
    var timeMode: String
    var salary: String
    var technologies: [Technology]
    var description: String
    
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
