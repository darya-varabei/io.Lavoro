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
    @Published var offers: [Offer] = [Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "PowerTech", location: "Минск, Беларусь", description: "", offers: [], category: "FinTech", mode: "Удаленно"), name: "IOS разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "")]
}
