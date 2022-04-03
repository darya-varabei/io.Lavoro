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
                case 1:
                    //EmptyView()
                    EmployeesListUIView( employeeViewModel: EmployeeViewModel())
                case 2:
                   // ParametersFormUIView()
                    OfferListUIView()
                case 3:
                    //EmptyView()
                    ProjectsListUIView()
                default:
                    EmptyView()
                }
            }
            //.padding(.top, 40)
        }.background(Color.primaryBlue.edgesIgnoringSafeArea(.top))
            .clipShape(Corners())
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}

