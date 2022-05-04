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
    @Published var applicants: [Applicant] = []
    
    func performUpdate(applicant: Applicant, id: String, completion: (() -> Void)? = nil) -> Applicant? {
        var skills: [Skill] = []
        var newEmployee: Applicant = applicant
        updateEmployee(applicant: applicant, id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    newEmployee = Applicant(user: User(username: "", role: CurrentUser.shared.getRole(), photo: SomeImage(photo: UIImage(named: "kate")!)), name: response.name, surname: response.surname, age: response.age, location: response.location, interests: response.interests, description: response.welcomeDescription, skills: skills, relocate: response.relocate, mode: response.mode, payment: response.salary, id: nil, specialization: response.specialization, bufId: response.id)
                }
                completion?()
            case .failure(let error):
                print(error)
                completion?()
            }
        }
        return newEmployee
    }
    
    func fetchCurrentUser() {
        
    }
    
    func getDeleteEmployee(applicant: Applicant, id: String, completion: (() -> Void)? = nil) {
        deleteEmployee(applicant: applicant, id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    AccountViewModel.accountExists = false
                }
                completion?()
            case .failure(let error):
                print(error)
                completion?()
            }
        }
    }
    
    func getEmployeeList(completion: (() -> Void)? = nil) {
        var skills: [Skill] = []
        fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.applicants = []
                for i in response {
                    for j in i.skills {
                        skills.append(Skill(name: j.name, level: j.level))
                    }
                    self.applicants.append(Applicant(user: User(username: CurrentUser.shared.getRole(), role: CurrentUser.shared.getRole(), photo: SomeImage(photo: UIImage(named: i.photo)!)), name: i.name, surname: i.surname, age: i.age, location: i.location, interests: i.interests, description: i.welcomeDescription, skills: skills, relocate: i.relocate, mode: i.mode, payment: i.salary, id: nil, specialization: i.specialization, bufId: i.id))
                    skills = []
                }
                }
                completion?()
            case .failure(let error):
                print(error)
                completion?()
            }
        }
    }
    
    func createEmployee(applicant: Applicant, id: String, completion: (() -> Void)? = nil) -> Applicant? {
        var skills: [Skill] = []
        var newEmployee: Applicant = applicant
        createEmployeeRequest(applicant: applicant, id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    newEmployee = Applicant(user: User(username: "", role: CurrentUser.shared.getRole(), photo: SomeImage(photo: UIImage(named: "kate")!)), name: response.name, surname: response.surname, age: response.age, location: response.location, interests: response.interests, description: response.welcomeDescription, skills: skills, relocate: response.relocate, mode: response.mode, payment: response.salary, id: nil, specialization: response.specialization, bufId: response.id)
                }
                completion?()
            case .failure(let error):
                print(error)
                completion?()
            }
        }
        return newEmployee
    }
    
    func createEmployeeRequest(applicant: Applicant, id: String, completion: @escaping (Result<DomainPureEmployee, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.createApplicant(applicant: applicant, id: id)
            completion(result)
        }
    }
    
    func deleteEmployee(applicant: Applicant, id: String, completion: @escaping (Result<String, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.deleteApplicant()
            completion(result)
        }
    }
    
    func updateEmployee(applicant: Applicant, id: String, completion: @escaping (Result<DomainEmployee, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.updateApplicant(applicant: applicant, id: "")
            completion(result)
        }
    }
    
    private func fetchData(completion: @escaping (Result<[DomainEmployee], RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getApplicants()
            completion(result)
        }
    }
}
