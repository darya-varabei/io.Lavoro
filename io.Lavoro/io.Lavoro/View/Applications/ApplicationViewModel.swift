//
//  ApplicationViewModel.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 14.04.22.
//

import Foundation

import SwiftUI

class ApplicationViewModel {
    @Published var applications: [Application] = []//[Application(sender: User(username: "Softteco", role: "Проект", photo: SomeImage(photo: UIImage())), reciever: User(username: "Softteco", role: "Проект", photo: SomeImage(photo: UIImage())), offer: Offer(project: <#T##Project#>, name: <#T##String#>, technologies: <#T##[Technology]#>, mode: <#T##String#>, salary: <#T##String#>, timeMode: <#T##String#>, description: <#T##String#>), message: <#T##String#>)]
}
