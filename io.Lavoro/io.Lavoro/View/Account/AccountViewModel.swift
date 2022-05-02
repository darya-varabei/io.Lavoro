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
    
    func getEmployee(completion: (() -> Void)? = nil) {
        fetchEmployeeData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.account.account = response
                completion?()
            case .failure(let error):
                self.account = WrappedAccount(account: Applicant(user: User(username: "darySp", role: "applicant", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "Дарья", surname: "Воробей", age: 19, location: "Минск, Беларусь", interests: "Тренажерный зал, стретчинг, иностранные языки, рок музыка", description: "IOS разработчик с опытом работы на коммерческий проектах в категориях Enterprise, EduTech, IoT. Открыта к проектной работе", skills: [Skill(name: "Swift", level: "Advanced"), Skill(name: "Xcode", level: "Advanced"), Skill(name: "Objective C", level: "Advanced"), Skill(name: "Git", level: "Advanced"),], relocate: false, mode: "Remote", payment: "$1500", specialization: "IOS разработчик"))
                //print(error)
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
    
    private func fetchProjectData(completion: @escaping (Result<Project, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getProjectInfo()
            completion(result)
        }
    }
    
    private func fetchEmployeeData(completion: @escaping (Result<Applicant, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getApplicantInfo()
            completion(result)
        }
    }
}
