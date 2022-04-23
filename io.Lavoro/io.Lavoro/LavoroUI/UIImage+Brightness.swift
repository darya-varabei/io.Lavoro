//
//  UIImage+Brightness.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 2.04.22.
//

import Foundation
import UIKit
import SwiftUI

extension CGImage {
    var brightness: Double {
        get {
            let imageData = self.dataProvider?.data
            let ptr = CFDataGetBytePtr(imageData)
            let bytesPerPixel = self.bitsPerPixel / self.bitsPerComponent
            var x = 0
            var result: Double = 0
            for y in 0..<self.height {
                for x1 in 0..<self.width {
                    let offset = (y * self.bytesPerRow) + (x1 * bytesPerPixel)
                    let r = ptr![offset]
                    let g = ptr![offset + 1]
                    let b = ptr![offset + 2]
                    result += (0.299 * Double(r) + 0.587 * Double(g) + 0.114 * Double(b))
                    x += 1
                }
            }
            let bright = result / Double (x)
            return bright
        }
    }
}
extension UIImage {
    var brightness: Bool {
        get {
           // print(self.cgImage!.brightness)
            return (self.cgImage!.brightness > 70)
        }
    }
}
