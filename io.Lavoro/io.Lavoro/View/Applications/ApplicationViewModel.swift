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
    
    func createApplication() {
        
    }
    
    func updateApplication() {
        
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
