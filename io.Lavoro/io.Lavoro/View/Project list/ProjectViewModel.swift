//
//  ProjectViewModel.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 1.04.22.
//

import Foundation
import SwiftUI

class ProjectViewModel: ObservableObject {
    //@Published var isParametersOpen: Bool = false
    private let service: LavoroServiceable = LavoroService()
    @Published var projects: [Project] = []//[Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: "Guide Human.inc", location: "Нью Йорк, США", description: "Проект по созданию социальной сети для использования на веб и мобильных платформах", offers: [Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "neoteric")!)), name: "Neoteric Technplogies", location: "Минск, Беларусь", description: "", offers: [], category: "FinTech", mode: "Удаленно"), name: "IOS разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "neurona")!)), name: "Neurona Mobile", location: "Москва, Россия", description: "", offers: [], category: "HealthTech", mode: "В офисе"), name: "Мобильный разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "contech")!)), name: "Contech.IO", location: "Гомель, Беларусь", description: "", offers: [], category: "Internet of Things", mode: "Удаленно"), name: "Mobile Dev", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Частичная занятость", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "alfa")!)), name: "AlphaMobile", location: "Минск, Беларусь", description: "", offers: [], category: "FinTech", mode: "Удаленно"), name: "Android разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат")], category: "Social network", mode: "Удаленно"), Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "neoteric")!)), name: "Neurona Tech", location: "Минск, Беларусь", description: "Проект по созданию социальной сети для использования на веб и мобильных платформах", category: "HealthTech", mode: "В офисе/удаленно"), Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "alfa")!)), name: "Alpha Mobile", location: "Гомель, Беларусь", description: "Проект по созданию социальной сети для использования на веб и мобильных платформах", category: "GameDev", mode: "Удаленно"), Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "contech")!)), name: "ConTech", location: "Минск, Беларусь", description: "Проект по созданию социальной сети для использования на веб и мобильных платформах", category: "HealthTech", mode: "В офисе/удаленно")]
    
    func performUpdate() {
        
    }
    
    func fetchCurrentProject() {
        
    }
    
    func getProjectList(completion: (() -> Void)? = nil) {
        fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                for i in response {
                    self.projects.append(Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: i.name, location: i.location, description: i.welcomeDescription, offers: [], category: i.category, mode: i.mode, id: nil))
                }
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
    
    func deleteProject() {
        
    }
    
    private func fetchData(completion: @escaping (Result<[DomainProject], RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getProjects()
            completion(result)
        }
    }
}
