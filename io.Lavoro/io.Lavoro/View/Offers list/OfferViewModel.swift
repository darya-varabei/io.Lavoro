//
//  OfferViewModel.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 1.04.22.
//

import Foundation
import SwiftUI

class OfferViewModel: ObservableObject {
    @Published var isParametersOpen: Bool = false
    @Published var offers: [Offer] = []
    private let service: LavoroService = LavoroService()
    
    func performUpdate(completion: @escaping (Result<Offer, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.updateOffer()
            completion(result)
        }
    }
    
    func getOfferList(completion: (() -> Void)? = nil) {
        var technologies: [Technology] = []
        fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                for i in response {
                    for j in i.technologies {
                        technologies.append(Technology(name: j.name, level: j.level))
                    }
                    self.offers.append(Offer(project: Project(user: User(username: "Dary", role: "project", photo: SomeImage(photo: UIImage(named: "neurona")!)), name: "", location: "", description: "", category: "", mode: ""), name: i.name, technologies: technologies, mode: i.mode, salary: i.salary, timeMode: i.mode, description: i.welcomeDescription))
                    technologies = []
                }
                }
                completion?()
            case .failure(let error):
                print(error)
                completion?()
            }
        }
    }
    
    func createOffer() {
        
    }
    
    func deleteOffer() {
        
    }
    
    private func fetchData(completion: @escaping (Result<[DomainOffer], RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getOffers()
            completion(result)
        }
    }
}
