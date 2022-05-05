//
//  DomainProject.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 30.04.22.
//

import Foundation

struct DomainProject: Codable {
    let welcomeDescription, id: String
    let user: DomainUser
    let name: String
    let photo: String
    let location, category, mode: String
    let offers: [DomainOfferProject]
    

    enum CodingKeys: String, CodingKey {
        case welcomeDescription = "description"
        case id, user, name, photo, location, category, mode, offers
    }
}

// MARK: - User
struct DomainUser: Codable {
    let id: String
}

struct DomainSkill: Codable {
    let id: String
    let owner: Owner
    let level, name: String
}

// MARK: - Owner
struct Owner: Codable {
    let id: String
}

typealias DomainSkillArray = [DomainSkill]

struct DomainTechnology: Codable {
    let id, level: String
    let offerID: OfferID
    let name: String

    enum CodingKeys: String, CodingKey {
        case id, level
        case offerID = "offer_id"
        case name
    }
}

// MARK: - OfferID
struct OfferID: Codable {
    let id: String
}

typealias DomainTechArray = [DomainTechnology]

struct DomainEmployee: Codable {
    let location, id: String
    let relocate: Bool
    let age: Int
    let photo: String
    let skills: [DomainSkill]
    let interests, surname, welcomeDescription, name, salary, mode, specialization: String
    let user: DomainUser

    enum CodingKeys: String, CodingKey {
        case location, id, relocate, age, interests, surname, salary, skills
        case welcomeDescription = "description"
        case name, user, mode, specialization, photo
    }
}

struct DomainPureEmployee: Codable {
    let location, id: String
    let relocate: Bool
    let age: Int
    let interests, surname, welcomeDescription, name, salary, mode, specialization: String
    let user: DomainUser

    enum CodingKeys: String, CodingKey {
        case location, id, relocate, age, interests, surname, salary
        case welcomeDescription = "description"
        case name, user, mode, specialization
    }
}

typealias DomainEmployeeArray = [DomainEmployee]

struct DomainOfferProject: Codable {
    let id: String
    let project: IdentProject
    let relocate: Bool
    let name, location, welcomeDescription, mode, salary: String

    enum CodingKeys: String, CodingKey {
        case id, project, name, location, mode, salary, relocate
        case welcomeDescription = "description"
    }
}

struct DomainOffer: Codable {
    let id: String
    let project: IdentProject
    let relocate: Bool
    let technologies: [DomainTechnology]
    let name, location, welcomeDescription, mode, salary: String

    enum CodingKeys: String, CodingKey {
        case id, project, name, location, mode, salary, relocate, technologies
        case welcomeDescription = "description"
    }
}

// MARK: - Project
struct IdentProject: Codable {
    let id: String
}

typealias DomainOfferArray = [DomainOffer]


struct DomainApplication: Codable {
    var reciever, id: String
    let sender, offer: DomainOfferId
    let welcomeDescription: String

    enum CodingKeys: String, CodingKey {
        case reciever, id, sender, offer
        case welcomeDescription = "description"
    }
}

// MARK: - Offer
struct DomainOfferId: Codable {
    let id: String
}
