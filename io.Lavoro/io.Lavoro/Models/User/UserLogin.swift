//
//  UserLogin.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation

struct UserLogin: Encodable {
    private var password: String
    private var login: String
    private var role: String
    
    init(username: String, password: String, role: String) {
        self.login = username
        self.password = password
        self.role = role
    }
}
