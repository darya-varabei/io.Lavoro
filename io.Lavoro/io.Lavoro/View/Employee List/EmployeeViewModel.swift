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
    @Published var applicants: [Applicant] = [Applicant(user: User(username: "DarySp", role: "Employee", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "Дарья", surname: "Воробей", age: 19, location: "Минск, Беларусь", interests: "Фитнес", description: "", skills: [Skill(name: "Swift", level: "Advanced"), Skill(name: "Xcode", level: "Advanced"), Skill(name: "Objective C", level: "Advanced"), Skill(name: "Git", level: "Advanced"),], relocate: true, mode: "Удаленно", payment: "$1500", specialization: "Python Разработчик"), Applicant(user: User(username: "DarySp", role: "Employee", photo: SomeImage(photo: UIImage(named: "ally")!)), name: "Евгения", surname: "Алексеева", age: 19, location: "Минск, Беларусь", interests: "Игра на гитаре, рисование, иностранные языки, азиатская культура", description: "Организован, обладаю глубокими знаниями в Python, его фреймворках и среде разработки. Имею опыт удаленной технической поддержки. Проявляю инициативность в разработке ПО и оптимизации кода.", skills: [Skill(name: "Python", level: "Advanced"), Skill(name: "Django", level: "Advanced"), Skill(name: "Machine Learning", level: "Advanced"), Skill(name: "Git", level: "Advanced"), Skill(name: "Unit testing", level: "Beginner")], relocate: true, mode: "Удаленно", payment: "$1500", specialization: "Python Разработчик"), Applicant(user: User(username: "DarySp", role: "Employee", photo: SomeImage(photo: UIImage(named: "john")!)), name: "Андрей", surname: "Максимов", age: 19, location: "Минск, Беларусь", interests: "Фитнес", description: "", skills: [Skill(name: "Swift", level: "Advanced"), Skill(name: "Xcode", level: "Advanced"), Skill(name: "Objective C", level: "Advanced"), Skill(name: "Git", level: "Advanced"),], relocate: true, mode: "Удаленно", payment: "$1500", specialization: "IOS Разработчик"), Applicant(user: User(username: "DarySp", role: "Employee", photo: SomeImage(photo: UIImage(named: "amy")!)), name: "Екатерина", surname: "Сергеева", age: 19, location: "Минск, Беларусь", interests: "Фитнес", description: "", skills: [Skill(name: "Swift", level: "Advanced"), Skill(name: "Xcode", level: "Advanced"), Skill(name: "Objective C", level: "Advanced"), Skill(name: "Git", level: "Advanced"),], relocate: true, mode: "Удаленно", payment: "$1500", specialization: "IOS Разработчик")]
    
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
