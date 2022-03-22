//
//  Application.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation

class Application {
    var sender: User
    var reciever: User
    var offer: Offer
    var message: String
    
    init(sender: User, reciever: User, offer: Offer, message: String) {
        self.sender = sender
        self.reciever = reciever
        self.offer = offer
        self.message = message
    }
}
