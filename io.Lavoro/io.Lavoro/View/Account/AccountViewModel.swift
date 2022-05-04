//
//  AccountViewModel.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 30.04.22.
//

import Foundation
import SwiftUI

class AccountViewModel: ObservableObject {
    
    @Published var account: WrappedAccount = WrappedAccount()
    private let service: LavoroServiceable = LavoroService()
    static var accountExists: Bool = false
    
    func getEmployee(completion: (() -> Void)? = nil) {
        var skills: [Skill] = []
        fetchEmployeeData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    for i in response.skills {
                        skills.append(Skill(name: i.name, level: i.level, id: i.id))
                    }
                    self.account.account = Applicant(user: User(username: "", role: "applicant", photo: SomeImage(photo: UIImage(named: "kate")!)), name: response.name, surname: response.surname, age: response.age, location: response.location, interests: response.interests, description: response.welcomeDescription, skills: skills, relocate: response
                        .relocate, mode: response.mode, payment: response.salary, id: response.id, specialization: response.specialization, bufId: response.id)
                AccountViewModel.accountExists = true
                completion?()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.account = WrappedAccount(account: Applicant(user: User(username: "", role: "applicant", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "", surname: "", age: 0, location: "", interests: "", description: "", skills: [], relocate: false, mode: "", payment: "", specialization: "", bufId: ""))
                }
                print(error)
                completion?()
            }
        }
    }
    
    func getProject(completion: (() -> Void)? = nil) {
        var offers: [Offer] = []
        fetchProjectData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    for i in response.offers {
                        offers.append(Offer(project: Project(user: User(username: "", role: "project", photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: response.name, location: response.location, description: response.welcomeDescription, category: response.category, mode: response.mode), name: i.name, technologies: [], mode: i.mode, salary: i.salary, timeMode: i.mode, description: i.welcomeDescription))
                    }
                    self.account.account = Project(user: User(username: "", role: CurrentUser.shared.getRole(), photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: response.name, location: response.location, description: response
                        .welcomeDescription, offers: offers, category: response.category, mode: response.mode, id: UUID(uuidString: response.id))
                }
                AccountViewModel.accountExists = true
                completion?()
            case .failure(let error):
                self.account = WrappedAccount(account: Project(user: User(username: "", role: CurrentUser.shared.getRole(), photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: "", location: "", description: "", offers: [], category: "", mode: "", id: nil))
                completion?()
            }
        }
    }
    
    func createProject() {
        
    }
    
    func createEmployee() {
        
    }
    
    func updateProject() {
        
    }
    
    func updateEmployee() {
        
    }
    
    private func fetchProjectData(completion: @escaping (Result<DomainProject, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getProjectInfo(id: CurrentUser.shared.getId().uuidString)
            completion(result)
        }
    }
    
    private func fetchEmployeeData(completion: @escaping (Result<DomainEmployee, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getApplicantInfo(id: CurrentUser.shared.getId().uuidString)
            completion(result)
        }
    }
}
