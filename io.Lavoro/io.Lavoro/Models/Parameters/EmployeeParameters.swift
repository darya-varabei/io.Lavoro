//
//  EmployeeParameters.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 22.04.22.
//

import Foundation
import SwiftUI

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
    
    var numericMinSalary: Double {
        return Double(minimalSalary) ?? 0.0
    }
    var numericMaxSalary: Double {
        return Double(maximalSalary) ?? 0.0
    }
}
