//
//  EmployeeViewModel.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 27.03.22.
//

import Foundation
import SwiftUI

class EmployeeViewModel: ObservableObject {
    @Published var isParametersOpen: Bool = false
    @Published var applicants: [Applicant] = []
}
