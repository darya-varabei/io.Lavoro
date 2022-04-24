//
//  UserLogin.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation

struct UserLogin: Encodable {
    private let username: String
    private let password: String
    private let login: String = "sss"
    private let role: String = "project"
   //private let photo: [UInt8] = []
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
