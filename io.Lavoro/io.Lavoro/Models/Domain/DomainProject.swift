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
    let photo: Data?
    let location, category, mode: String
    

    enum CodingKeys: String, CodingKey {
        case welcomeDescription = "description"
        case id, user, name, photo, location, category, mode
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
    let interests, surname, welcomeDescription, name, salary, mode, specialization: String
    let user: DomainUser

    enum CodingKeys: String, CodingKey {
        case location, id, relocate, age, interests, surname, salary
        case welcomeDescription = "description"
        case name, user, mode, specialization
    }
}

typealias DomainEmployeeArray = [DomainEmployee]

struct DomainOffer: Codable {
    let id: String
    let project: IdentProject
    let name, location, welcomeDescription, mode, salary: String

    enum CodingKeys: String, CodingKey {
        case id, project, name, location, mode, salary
        case welcomeDescription = "description"
    }
}

// MARK: - Project
struct IdentProject: Codable {
    let id: String
}

typealias DomainOfferArray = [DomainOffer]


