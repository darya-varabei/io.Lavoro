//
//  Applicant.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation

class Applicant {
    
    var user: User
    var name: String
    var surname: String
    var age: Int
    var location: String
    var mode: String
    var payment: String
    var interests: String
    var description: String
    var skills: [Skill]
    var relocate: Bool
    
    init(user: User, name: String, surname: String, age: Int, location: String, interests: String, description: String, skills: [Skill], relocate: Bool, mode: String, payment: String) {
        self.user = user
        self.name = name
        self.surname = surname
        self.age = age
        self.mode = mode
        self.payment = payment
        self.location = location
        self.interests = interests
        self.description = description
        self.skills = skills
        self.relocate = relocate
    }
}
