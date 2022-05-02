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
                switch(index) {
                case 0:
                    AccountUIView()
                        .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height - 120, alignment: .center)
                        .padding(.horizontal, 10)
                        .cornerRadius(25)
                        .foregroundColor(Color.customWhite)
                        .padding(.top, 50)
                    
                case 1:
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                            .foregroundColor(.primaryBlue)
                        EmployeesListUIView()
                    }
                case 2:
                    OfferListUIView()
                case 3:
                    ProjectsListUIView()
                default:
                    EmptyView()
                }
            }
        }.background(Color.primaryBlue.edgesIgnoringSafeArea(.top))
            .clipShape(Corners())
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}

