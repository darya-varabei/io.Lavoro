//
//  UpdateEmployeeView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 14.04.22.
//

import SwiftUI

struct UpdateEmployeeView: View {
    @State var applicant: Applicant
    @State var employeeViewModel: EmployeeViewModel = EmployeeViewModel()
    var body: some View {
        ScrollView {
            VStack {
                LavoroTextField(labelText: "Имя", text: $applicant.name)
                LavoroTextField(labelText: "Фамилия", text: $applicant.surname)
                VStack(
                  alignment: .leading,
                  spacing: 10,
                  content: {
                    Text("Возраст")
                      .padding(.leading, 20)
                      TextField("", value: $applicant.age, formatter: NumberFormatter())
                      .textFieldStyle(GHRoundedTextFieldStyle(textColor: .primaryBlue, cornerRadius: 120, borderColor: .darkBlue))
                  }
                )
                LavoroTextField(labelText: "Местоположение", text: $applicant.location)
                LavoroTextField(labelText: "Специализация", text: $applicant.specialization)
                LavoroTextField(labelText: "Описание", text: $applicant.description)
                LavoroTextField(labelText: "Режим работы", text: $applicant.mode)
                LavoroTextField(labelText: "Интересы", text: $applicant.interests)
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.darkBlue)
                        .frame(width: UIScreen.main.bounds.width - 150, height: 48, alignment: .center)
                    Button(action: { }, label: {
                    Text(Literals.enter)
                        .fontWeight(.semibold)
                        .foregroundColor(.customWhite)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        //.cornerRadius(10)
                        //.backgroundColor(.primaryBlue)
                        .clipShape(Capsule())
                })
                }
            }
        }
    }
}

//struct UpdateEmployeeView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateEmployeeView()
//    }
//}
