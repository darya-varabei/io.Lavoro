//
//  ProjectViewModel.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 1.04.22.
//

import Foundation
import SwiftUI

class ProjectViewModel: ObservableObject {
    private let service: LavoroServiceable = LavoroService()
    @Published var projects: [Project] = []
    
    func performUpdate() {
        
    }
    
    func fetchCurrentProject() {
        
    }
    
    func getProjectList(completion: (() -> Void)? = nil) {
        var offers: [Offer] = []
        fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    for i in response {
                        for j in i.offers {
                            offers.append(Offer(project: Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: i.name, location: i.location, description: i.welcomeDescription, offers: [], category: i.category, mode: i.mode, id: nil), name: j.name, technologies: [], mode: j.mode, salary: j.salary, timeMode: j.mode, description: j.welcomeDescription))
                        }
                        self.projects.append(Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: i.name, location: i.location, description: i.welcomeDescription, offers: offers, category: i.category, mode: i.mode, id: nil))
                        offers = []
                    }
                }
                completion?()
            case .failure(let error):
                print(error)
                completion?()
            }
        }
    }
    
    func createProjectRequest(project: Project, id: String, completion: @escaping (Result<DomainProject, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.createProject(project: project, id: id)
            completion(result)
        }
    }
    
    func createProject(project: Project, id: String, completion: (() -> Void)? = nil) {
        var offers: [Offer] = []
        var newProject: Project = project
        createProjectRequest(project: project, id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    for i in response.offers {
                        offers.append(Offer(project: Project(user: User(username: "", role: CurrentUser.shared.getRole(), photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: response.name, location: response.location, description: response.location, offers: offers, category: response.category, mode: response.mode, id: UUID(uuidString: response.id)), name: i.name, technologies: [], mode: i.mode, salary: i.salary, timeMode: i.mode, description: i.welcomeDescription))
                    }
                    newProject = Project(user: User(username: "", role: CurrentUser.shared.getRole(), photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: response.name, location: response.location, description: response.location, offers: offers, category: response.category, mode: response.mode, id: UUID(uuidString: response.id))
                }
                completion?()
            case .failure(let error):
                print(error)
                completion?()
            }
        }
    }
    
    func deleteProject(project: Project, id: String, completion: @escaping (Result<String, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.deleteProject()
            completion(result)
        }
    }
    
    private func fetchData(completion: @escaping (Result<[DomainProject], RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getProjects()
            completion(result)
        }
    }
}
