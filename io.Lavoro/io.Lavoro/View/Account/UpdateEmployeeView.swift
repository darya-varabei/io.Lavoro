//
//  UpdateEmployeeView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 14.04.22.
//

import SwiftUI

struct UpdateEmployeeView: View {
    @State var applicant: Applicant
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
            }
        }
    }
}

struct UpdateEmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateEmployeeView()
    }
}
