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
    @Published var projects: [Project] = []//[Project(user: User(username: "", role: "", photo: SomeImage(from: UIImage(named: "guideHuman")!), name: "Guide Human", location: "Portland, USA", description: "", category: "", mode: "")]
}
