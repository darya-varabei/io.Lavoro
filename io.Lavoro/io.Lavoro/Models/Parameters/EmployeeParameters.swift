//
//  EmployeeParameters.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 22.04.22.
//

import Foundation
import SwiftUI

enum RoleMode {
    case employee
    case offer
}

struct EmployeeParameters {
    @State var languages: [String] = ["Русский", "Английский", "Немецкий", "Итальянский", "Украинский"]
    @State var selectedLanguages: [String] = []
    
    @State var parameterSkills: [Skill] = []
    
    @State var countryPlaceholder = "Не указана"
    @State var cityPlaceholder = "Не указан"
    @State var countries = ["PSO", "PFA", "AIR", "HOT"]
    @State var cities = ["PSO", "PFA", "AIR", "HOT"]
    @State var selectedCity: String = ""
    @State var selectedCountry: String = ""
    
    @State var relocateSupport = false
    
    @State var skills: [String] = ["C#", "WPF", "Swift", "Gitlab", "Python", "C++"]
    @State var levels: [String] = ["Beginner", "Junior", "Average", "Advanced", "Professional"]
    @State var selectedName: String = ""
    @State var selectedLevel: String = ""
    
    @State var minimalSalary: String = ""
    @State var maximalSalary: String = ""
    var mode: RoleMode
    private let service: LavoroServiceable = LavoroService()
    
    var numericMinSalary: Double {
        return Double(minimalSalary) ?? 0.0
    }
    var numericMaxSalary: Double {
        return Double(maximalSalary) ?? 0.0
    }
    
    private func fetchSkills(completion: @escaping (Result<[DomainSkill], RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getSkills()
            completion(result)
        }
    }
    
    private func fetchTechnologies(completion: @escaping (Result<[DomainTechnology], RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getTechnologies()
            completion(result)
        }
    }
    
    func getSkillList(completion: (() -> Void)? = nil) {
        if mode == .employee {
            fetchSkills { result in
                switch result {
                case .success(let response):
                    var technologies: [Skill] = []
                    for i in response {
                        technologies.append(Skill(name: i.name, level: i.level))
                    }
                    self.skills = response.map({$0.name})
                    completion?()
                case .failure(let error):
                    print(error)
                    completion?()
                }
            }
        }
        else {
            fetchTechnologies { result in
                switch result {
                case .success(let response):
                    var technologies: [Technology] = []
                    for i in response {
                        technologies.append(Technology(name: i.name, level: i.level))
                    }
                    self.skills = technologies.map({$0.name})
                    completion?()
                case .failure(let error):
                    print(error)
                    completion?()
                }
            }
        }
    }
    
    func performFiltration(offers: [Offer]) -> [Offer] {
        return offers.filter {
            ($0.technologies.map({$0.name}).intersects(skills) || skills.isEmpty) && (Int($0.salary)! > Int(minimalSalary)!) && (Int($0.salary)! < Int(maximalSalary)!)
        }
    }
    
    func performFiltration(offers: [Applicant]) -> [Applicant] {
        return offers.filter {
            ($0.skills.map({$0.name}).intersects(skills) || skills.isEmpty) && (Int($0.payment)! > Int(minimalSalary)!) && (Int($0.payment)! < Int(maximalSalary)!)
        }
    }
}
