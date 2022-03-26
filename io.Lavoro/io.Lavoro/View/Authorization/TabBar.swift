//
//  TabBar.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 26.03.22.
//

import Foundation
import SwiftUI

struct TabBar: View {
    @Binding var index: Int
    var  body: some View {
        HStack {
            HStack(spacing: (UIScreen.main.bounds.width - 80) / 5) {
                Button(action: {
                    self.index = 0
                }) {
                    Image(systemName: "person")
                        .foregroundColor(self.index == 0 ? .black : Color.black.opacity(0.35))
                }
                
                Button(action: {
                    self.index = 1
                }) {
                    Image(systemName: "circle.grid.cross")
                        .foregroundColor(self.index == 1 ? .black : Color.black.opacity(0.35))
                }
                
                Button(action: {
                    self.index = 2
                }) {
                    Image(systemName: "network")
                        .foregroundColor(self.index == 2 ? .black : Color.black.opacity(0.35))
                }
                
                Button(action: {
                    self.index = 3
                }) {
                    Image(systemName: "mail.stack")
                        .foregroundColor(self.index == 3 ? .black : Color.black.opacity(0.35))
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 12)
            .padding(.top, 28)
            .background(Color.white)
            .clipShape(Curve(index: self.$index))
        }.background(Color.primaryBlue)
    }
}

struct Corners: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
}

struct Curve: Shape {
    @Binding var index: Int
    func path(in rect: CGRect) -> Path {
        let path1 = Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            path.addArc(center: CGPoint(x: getPosition(value: rect.width), y: 0), radius: 20, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)
        }
        
        let path2 = Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addArc(center: CGPoint(x: getPosition(value: rect.width), y: 5), radius: 5, startAngle: .zero, endAngle: .init(degrees: 360), clockwise: false)
        }
        
        return Path { path in
            path.addPath(path1)
            path.addPath(path2)
        }
    }
    
    func getPosition(value: CGFloat) -> CGFloat {
        var width: CGFloat
        let spacing = (UIScreen.main.bounds.width - 80) / 5
        if index == 0 {
            width = 40
        }
        else if index == 1 {
            width = spacing + 60
        }
        else if index == 2 {
            width = (spacing *  2) + 80
        }
        else {
            width = value - 40
        }
        return width
    }
}
