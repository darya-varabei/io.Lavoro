//
//  Applicant.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation
import SwiftUI

class Applicant: Account, Identifiable {
    
    var id: ObjectIdentifier?
    var user: User
    var name: String
    var surname: String
    var specialization: String
    var age: Int
    var location: String
    var mode: String
    var payment: String
    var interests: String
    var description: String
    var skills: [Skill]
    var relocate: Bool
    
    init(user: User, name: String, surname: String, age: Int, location: String, interests: String, description: String, skills: [Skill], relocate: Bool, mode: String, payment: String, id: ObjectIdentifier? = nil, specialization: String) {
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
        self.id = id
        self.specialization = specialization
    }
    
    func getName() -> String {
        return name + " " + surname
    }
    
    func getAge() -> String {
        return "\(age)"
    }
    
    func getPayment() -> String {
        return "$\(payment)"
    }
    
    func getSpecialization() -> String {
        return specialization
    }
    
    func getDescription() -> String {
        return description
    }
    
    func getSkills() -> [Skill] {
        return skills
    }
    
    func getLocation() -> String {
        return location
    }
    
    func getRelocate() -> String {
        return relocate.description
    }
    
    func getInterests() -> String {
        return interests
    }
    
    func getMode() -> String {
        return mode
    }
    
    func getCategory() -> String {
        return ""
    }
    
    func getPhoto() -> UIImage {
        return user.photo
    }
}
