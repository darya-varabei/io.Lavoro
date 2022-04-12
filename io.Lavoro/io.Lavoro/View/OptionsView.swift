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
                    AccountUIView(account: WrappedAccount(account: Applicant(user: User(username: "darySp", role: "applicant", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "Дарья", surname: "Воробей", age: 19, location: "Минск, Беларусь", interests: "Тренажерный зал, стретчинг, иностранные языки, рок музыка", description: "IOS разработчик с опытом работы на коммерческий проектах в категориях Enterprise, EduTech, IoT. Открыта к проектной работе", skills: [Skill(name: "Swift", level: "Advanced"), Skill(name: "Xcode", level: "Advanced"), Skill(name: "Objective C", level: "Advanced"), Skill(name: "Git", level: "Advanced"),], relocate: false, mode: "Remote", payment: "$1500", specialization: "IOS разработчик")))
                        .padding(.top, 30)
                      
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

