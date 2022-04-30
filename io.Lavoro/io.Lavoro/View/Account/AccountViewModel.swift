//
//  AccountViewModel.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 30.04.22.
//

import Foundation

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
