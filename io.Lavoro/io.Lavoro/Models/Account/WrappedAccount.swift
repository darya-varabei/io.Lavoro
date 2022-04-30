//
//  WrappedAccount.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 10.04.22.
//

import Foundation
import UIKit

protocol Account {
    func getName() -> String
    func getSpecialization() -> String
    func getDescription() -> String
    func getSkills() -> [Skill]
    func getLocation() -> String
    func getRelocate() -> String
    func getInterests() -> String
    func getMode() -> String
    func getCategory() -> String
    func getPhoto() -> UIImage
}

class WrappedAccount: Account {
    
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    func getName() -> String {
        return account.getName()
    }
    
    func getSpecialization() -> String {
        return account.getSpecialization()
    }
    
    func getDescription() -> String {
        return account.getDescription()
    }
    
    func getSkills() -> [Skill] {
        return account.getSkills()
    }
    
    func getLocation() -> String {
        return account.getLocation()
    }
    
    func getRelocate() -> String {
        return account.getLocation()
    }
    
    func getInterests() -> String {
        return account.getInterests()
    }
    
    func getMode() -> String {
        return account.getMode()
    }
    
    func getCategory() -> String {
        return account.getCategory()
    }
    
    func getPhoto() -> UIImage {
        return account.getPhoto()
    }
}
