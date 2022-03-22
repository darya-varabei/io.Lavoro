//
//  User.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 21.03.22.
//

import Foundation
import UIKit

class User {
    var username: String
    var role: String
    var photo: UIImage
    
    init(username: String, role: String, photo: UIImage) {
        self.username = username
        self.role = role
        self.photo = photo
    }
}
