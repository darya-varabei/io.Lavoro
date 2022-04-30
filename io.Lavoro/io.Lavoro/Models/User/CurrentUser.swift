//
//  CurrentUser.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 30.04.22.
//

import Foundation



class CurrentUser: Decodable {
    static let shared = CurrentUser()
    
    var role: String?
    var id: UUID?
    var token: String?
    
    init(){}
    
    func getRole() -> String {
        return role ?? ""
    }
    
    func getId() -> UUID {
        return id ?? UUID()
    }
    
    func setRole(newRole: String) {
        role = newRole
    }
    
    func setId(newId: UUID) {
        id = newId
    }
    
    func setToken(newToken: String) {
        token = newToken
    }
    
    func geToken() -> String {
        return token ?? ""
    }
    
    func setShared(id: UUID, role: String, token: String) {
        //CurrentUser.shared.setId(newId: id)
        CurrentUser.shared.setRole(newRole: role)
        CurrentUser.shared.setToken(newToken: token)
    }
}
