//
//  EmployeesListUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import SwiftUI

struct EmployeesListUIView: View {
    @Namespace var animationID
    @StateObject var employeeViewModel: EmployeeViewModel = EmployeeViewModel()
    @State private var searchText = ""
    @State private var slideOverViewPosition: ViewPosition = .hidden
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    if slideOverViewPosition == .hidden {
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
                        }.opacity(CurrentUser.shared.getRole() == "project" ? 1 : 0)
                            .padding(.horizontal, 30)
                            .padding(.top, CurrentUser.shared.getRole() == "project" ? 100 : 0)
                            .background(Color.primaryBlue.ignoresSafeArea())
                    }
                    List(filterEmployees, id: \.name) { applicant in
                        NavigationLink(
                            destination: EmployeeDetailsView(applicant: applicant),
                            label: { EmployeeCellView(applicant: applicant)
                            }
                        )
                    }.searchable(text: $searchText, prompt: "Поиск анкеты")//.navigationBarHidden(true)
                    
                }
                SlideOverView(position: $slideOverViewPosition,
                              isHalfScreenHeight: false,
                              isHalfScreenAvailable: true,
                              handleOption: .regular) {
                    EmployeeParametersView(slideOverViewPosition: $slideOverViewPosition, mode: .employee)
                }
            }
                .onAppear {
                    employeeViewModel.getEmployeeList()
                }
        }.background(Color.primaryBlue.ignoresSafeArea())
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor(Color.primaryBlue)
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .systemGray6
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
            }
            .navigationBarHidden(true)
    }
    
    var filterEmployees: [Applicant] {
        if searchText.isEmpty {
            return employeeViewModel.applicants
        }
        else {
            return employeeViewModel.applicants.filter {
                $0.name.contains(searchText) ||
                $0.specialization.contains(searchText) ||
                $0.surname.contains(searchText)
            }
        }
    }
}
