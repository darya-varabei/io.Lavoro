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
    @Published var projects: [Project] = []
}
