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
                        .relocate, mode: response.mode, payment: response.salary, id: response.id, specialization: response.specialization)
                AccountViewModel.accountExists = true
                completion?()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                self.account = WrappedAccount(account: Applicant(user: User(username: "", role: "applicant", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "", surname: "", age: 0, location: "", interests: "", description: "", skills: [], relocate: false, mode: "", payment: "", specialization: ""))
                }
                print(error)
                completion?()
            }
        }
    }
    
    func getProject(completion: (() -> Void)? = nil) {
        fetchProjectData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.account.account = response
                //self.projects = response
                completion?()
            case .failure(let error):
                print(error)
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
    
    private func fetchProjectData(completion: @escaping (Result<Project, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getProjectInfo(id: CurrentUser.shared.getId().uuidString)
            completion(result)
        }
    }
    
    private func fetchEmployeeData(completion: @escaping (Result<DomainEmployee, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getApplicantInfo(id: "d8ae1b9a-8266-4a32-8cb2-b8848ad940be")
            completion(result)
        }
    }
}
