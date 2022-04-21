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
    @State private var searchText = ""
    
    @State private var slideOverViewPosition: ViewPosition = .hidden
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        slideOverViewPosition = .top
                    }, label: {
                        Text("Параметры")
                            .underline()
                            .foregroundColor(.customWhite)
                            .font(.custom("Montserrat-Medium", size: 14))
                    })
                    Spacer()
                    Text("")
                }.padding(.horizontal, 30)
                NavigationView {
                    List(filterEmployees, id: \.name) { applicant in
                        NavigationLink(
                            destination: EmployeeDetailsView(applicant: applicant),
                            label: { EmployeeCellView(applicant: applicant)
                            }
                        )
                    }.background(Color.primaryBlue.ignoresSafeArea())
                        .onAppear {
                            UITableView.appearance().backgroundColor = .clear
                            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
                            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
                        }
                        .searchable(text: $searchText, prompt: "Поиск анкеты")
                }.padding(.top, 20)
            }
            SlideOverView(position: $slideOverViewPosition,
                          isHalfScreenHeight: false,
                          isHalfScreenAvailable: true,
                          handleOption: .staticWithHandler) {
                EmployeeParametersView()
            }
        }
    }
    
    var filterEmployees: [Applicant] {
        if searchText.isEmpty {
            return employeeViewModel.applicants
        }
        else {
            return employeeViewModel.applicants.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.specialization.localizedCaseInsensitiveContains(searchText) ||
                $0.surname.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

//struct EmployeesListUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeesListUIView()
//    }
//}
