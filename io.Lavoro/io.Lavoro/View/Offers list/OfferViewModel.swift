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
    @Published var offers: [Offer] = []//[Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "neoteric")!)), name: "Neoteric Technplogies", location: "Минск, Беларусь", description: "", offers: [], category: "FinTech", mode: "Удаленно"), name: "IOS разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "neurona")!)), name: "Neurona Mobile", location: "Москва, Россия", description: "", offers: [], category: "HealthTech", mode: "В офисе"), name: "Мобильный разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "contech")!)), name: "Contech.IO", location: "Гомель, Беларусь", description: "", offers: [], category: "Internet of Things", mode: "Удаленно"), name: "Mobile Dev", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Частичная занятость", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "alfa")!)), name: "AlphaMobile", location: "Минск, Беларусь", description: "", offers: [], category: "FinTech", mode: "Удаленно"), name: "Android разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат")]
    private let service: LavoroService = LavoroService()
    
    func performUpdate(completion: @escaping (Result<Offer, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.updateOffer()
            completion(result)
        }
    }
    
    func getOfferList(completion: (() -> Void)? = nil) {
        fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                for i in response {
//                    self.offers.append(Offer(project: Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "neurona")!))), name: <#T##String#>, location: <#T##String#>, description: <#T##String#>, category: <#T##String#>, mode: <#T##String#>), name: <#T##String#>, technologies: [], mode: i.mode, salary: i.salary, timeMode: i.mode, description: i.welcomeDescription) )
                   // self.offers.append(Offer(project: Project(user: User(username: "Dary", role: "project", photo: SomeImage(photo: UIImage(named: "neurona")!)), name: "", location: "", description: "", category: "", mode: ""), name: i.name, technologies: techBase, mode: i.mode, salary: i.salary, timeMode: i.mode, description: i.welcomeDescription))
                }
               // self.offers = response
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
