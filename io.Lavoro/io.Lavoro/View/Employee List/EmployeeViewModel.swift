//
//  EmployeeViewModel.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 27.03.22.
//

import Foundation
import SwiftUI

class EmployeeViewModel: ObservableObject {
    @Published var isParametersOpen: Bool = false
    @Published var applicants: [Applicant] = [Applicant(user: User(username: "DarySp", role: "Employee", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "Дарья", surname: "Воробей", age: 19, location: "Минск, Беларусь", interests: "Фитнес", description: "", skills: [], relocate: true, mode: "Удаленно", payment: "$1500", specialization: "IOS Разработчик")]
    
    func performUpdate() {
        
    }
    
    func fetchCurrentUser() {
        
    }
    
    func getEmployeeList() {
        
    }
    
    func createEmployee() {
        
    }
    
    func deleteEmployee() {
        
    }
}
