//
//  Technology+Definition.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.04.22.
//

import Foundation
import UIKit
import SwiftUI

extension Technology {
    func defineNumericLevel() -> CGFloat {
        switch(self.level){
        case "Beginner":
        return 1
        case "Junior":
        return 2
        case "Average":
        return 3
        case "Advanced":
        return 4
        case "Professional":
        return 5
            
        default:
            return 0
        }
    }
}
