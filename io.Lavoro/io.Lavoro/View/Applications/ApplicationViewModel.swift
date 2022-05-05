//
//  ApplicationViewModel.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 14.04.22.
//

import Foundation
import SwiftUI

class ApplicationViewModel {
    @Published var applications: [Application] = []
    private let service: LavoroServiceable = LavoroService()
    
    func createApplication(application: DomainApplication, completion: @escaping (Result<DomainApplication, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.sendApplication(application: application)
            completion(result)
        }
    }
    
    func getCreateApplication(applicant: DomainApplication, completion: (() -> Void)? = nil) -> DomainApplication {
        var id: String = ""
        createApplication(application: applicant) {
            [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    id = response.id
                    //applicant.id = response.id
                    completion?()
                case .failure(let error):
                    print(error)
                    completion?()
                }
        }
        return DomainApplication(reciever: applicant.reciever, id: id, sender: applicant.sender, offer: applicant.offer, welcomeDescription: applicant.welcomeDescription)
    }
    
    func getUpdateApplication(applicant: DomainApplication, completion: (() -> Void)? = nil) -> DomainApplication {
        var id: String = ""
        updateApplication(application: applicant) {
            [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    id = response.id
                    completion?()
                case .failure(let error):
                    print(error)
                    completion?()
                }
        }
        return DomainApplication(reciever: applicant.reciever, id: id, sender: applicant.sender, offer: applicant.offer, welcomeDescription: applicant.welcomeDescription)
    }
    
    func updateApplication(application: DomainApplication, completion: @escaping (Result<DomainApplication, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.sendApplication(application: application)
            completion(result)
        }
    }
    
    
    func fetchApplications() {
        
    }
    
    func deleteApplication(application: Application, id: String, completion: @escaping (Result<String, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.deleteApplicant()
            completion(result)
        }
    }
    
    func getUserApplications() {
        
    }
}
