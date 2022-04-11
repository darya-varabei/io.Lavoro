//
//  UIImage+Codable.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 11.04.22.
//

import Foundation
import SwiftUI

public struct SomeImage: Codable {
    
    public let photo: Data
    
    public init(photo: UIImage) {
        self.photo = photo.pngData()!
        
    }
}
