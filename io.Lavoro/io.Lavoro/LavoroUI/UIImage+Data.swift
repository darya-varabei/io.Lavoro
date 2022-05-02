//
//  UIImage+Data.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 11.04.22.
//

//import Foundation
//import SwiftUI
//#if canImport(UIKit)
import UIKit
//#elseif canImport(AppKit)
//import AppKit
//#endif
//
//extension Image {
//    /// Initializes a SwiftUI `Image` from data.
//    init?(data: Data) {
//        #if canImport(UIKit)
//        if let uiImage = UIImage(data: data) {
//            self.init(uiImage: uiImage)
//        } else {
//            return nil
//        }
//        #elseif canImport(AppKit)
//        if let nsImage = NSImage(data: data) {
//            self.init(nsImage: nsImage)
//        } else {
//            return nil
//        }
//        #else
//        return nil
//        #endif
//    }
//}

var skillBase = [Skill(name: "Swift", level: "Advanced"), Skill(name: "Objective C", level: "Average"), Skill(name: "Github", level: "Advanced"), Skill(name: "Cocoapods", level: "Junior")]

var skillBase2 = [Skill(name: "Figma", level: "Professional"), Skill(name: "Sketch", level: "Average"), Skill(name: "CoreDraw", level: "Junior"), Skill(name: "Miro", level: "Average")]

var techBase = [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Average"), Technology(name: "Github", level: "Advanced"), Technology(name: "Cocoapods", level: "Junior")]

var techBase2 = [Technology(name: "Figma", level: "Professional"), Technology(name: "Sketch", level: "Average"), Technology(name: "CoreDraw", level: "Junior"), Technology(name: "Miro", level: "Average")]

var offerBase = [Offer(project: Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "neurona")!)), name: "Neurona", location: "Минск, Беларусь", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", category: "HealthTech, Фитнес", mode: "Полный день"), name: "IOS разработчик", technologies: techBase, mode: "Удаленнно", salary: "$1300", timeMode: "Полный деень", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")]
