//
//  EmployeesListUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import SwiftUI

struct EmployeesListUIView: View {
    @Namespace var animationID
    @State var employeeViewModel: EmployeeViewModel
    var body: some View {
        NavigationView {
            List(employeeViewModel.applicants, id: \.name) { applicant in
                NavigationLink(
                    destination: EmployeeDetailsView(applicant: applicant),
                    label: { EmployeeCellView(applicant: applicant)
                    }
                )
            }
        }.padding(.top, 20)
    }
}

//struct EmployeesListUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeesListUIView()
//    }
//}
