//
//  EmployeeParametersView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 27.03.22.
//

import SwiftUI

struct EmployeeParametersView: View {
    @EnvironmentObject var employeeModel: EmployeeViewModel
    var body: some View {
        if !employeeModel.isParametersOpen {
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(Color.darkBlue)
                    }
                    Spacer()
                    Text("Параметры")
                        .font(.custom("Montserrat-Medium", size: 12))
                        .foregroundColor(Color.darkBlue)
                }
            }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color.clear)
        }
    }
}

struct EmployeeParametersView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeParametersView()
    }
}
