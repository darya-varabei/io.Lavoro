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
    private let service: LavoroServiceable = LavoroService()
    @Published var applicants: [Applicant] = []//[Applicant(user: User(username: "DarySp", role: "Employee", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "Дарья", surname: "Воробей", age: 19, location: "Минск, Беларусь", interests: "Фитнес", description: "", skills: [Skill(name: "Swift", level: "Advanced"), Skill(name: "Xcode", level: "Advanced"), Skill(name: "Objective C", level: "Advanced"), Skill(name: "Git", level: "Advanced"),], relocate: true, mode: "Удаленно", payment: "$1500", specialization: "Python Разработчик"), Applicant(user: User(username: "DarySp", role: "Employee", photo: SomeImage(photo: UIImage(named: "ally")!)), name: "Евгения", surname: "Алексеева", age: 19, location: "Минск, Беларусь", interests: "Игра на гитаре, рисование, иностранные языки, азиатская культура", description: "Организован, обладаю глубокими знаниями в Python, его фреймворках и среде разработки. Имею опыт удаленной технической поддержки. Проявляю инициативность в разработке ПО и оптимизации кода.", skills: [Skill(name: "Python", level: "Advanced"), Skill(name: "Django", level: "Advanced"), Skill(name: "Machine Learning", level: "Advanced"), Skill(name: "Git", level: "Advanced"), Skill(name: "Unit testing", level: "Beginner")], relocate: true, mode: "Удаленно", payment: "$1500", specialization: "Python Разработчик"), Applicant(user: User(username: "DarySp", role: "Employee", photo: SomeImage(photo: UIImage(named: "john")!)), name: "Андрей", surname: "Максимов", age: 19, location: "Минск, Беларусь", interests: "Фитнес", description: "", skills: [Skill(name: "Swift", level: "Advanced"), Skill(name: "Xcode", level: "Advanced"), Skill(name: "Objective C", level: "Advanced"), Skill(name: "Git", level: "Advanced"),], relocate: true, mode: "Удаленно", payment: "$1500", specialization: "IOS Разработчик"), Applicant(user: User(username: "DarySp", role: "Employee", photo: SomeImage(photo: UIImage(named: "amy")!)), name: "Екатерина", surname: "Сергеева", age: 19, location: "Минск, Беларусь", interests: "Фитнес", description: "", skills: [Skill(name: "Swift", level: "Advanced"), Skill(name: "Xcode", level: "Advanced"), Skill(name: "Objective C", level: "Advanced"), Skill(name: "Git", level: "Advanced"),], relocate: true, mode: "Удаленно", payment: "$1500", specialization: "IOS Разработчик")]
    
    func performUpdate() {
        
    }
    
    func fetchCurrentUser() {
        
    }
    
    func getEmployeeList(completion: (() -> Void)? = nil) {
        fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                for i in response {
                    self.applicants.append(Applicant(user: User(username: CurrentUser.shared.getRole(), role: CurrentUser.shared.getRole(), photo: SomeImage(photo: UIImage(named: "kate")!)), name: i.name, surname: i.surname, age: i.age, location: i.location, interests: i.interests, description: i.welcomeDescription, skills: [], relocate: i.relocate, mode: i.mode, payment: i.salary, id: nil, specialization: i.specialization))
                }
               // self.applicants = response
                completion?()
            case .failure(let error):
                print(error)
                completion?()
            }
        }
    }
    
    func createEmployee() {
        
    }
    
    func deleteEmployee() {
        
    }
    
    private func fetchData(completion: @escaping (Result<[DomainEmployee], RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getApplicants()
            completion(result)
        }
    }
}
