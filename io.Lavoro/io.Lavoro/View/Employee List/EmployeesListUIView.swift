//
//  EmployeesListUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import SwiftUI

struct EmployeesListUIView: View {
    @Namespace var animationID
    @StateObject var employeeViewModel: EmployeeViewModel
    var body: some View {
        VStack(spacing: 15) {
            ForEach($employeeViewModel.applicants) { $applicant in
                EmployeeCellView(applicant: applicant)
            }
        }.padding(.top, 20)
    }
}

struct EmployeesListUIView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListUIView()
    }
}
