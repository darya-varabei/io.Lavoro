//
//  OptionsView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 26.03.22.
//

import Foundation
import SwiftUI

struct OptionsView: View {
    @Binding var index: Int
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                
            }
           // .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        }.background(Color.primaryBlue.edgesIgnoringSafeArea(.top))
            .clipShape(Corners())
    }
}
