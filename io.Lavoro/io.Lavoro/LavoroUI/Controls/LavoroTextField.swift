//
//  LavoroTextField.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 23.03.22.
//

import SwiftUI

struct LavoroTextField: View {
  let labelText: String
  let cornerRadius: CGFloat
  let placeholder: String
  
  @Binding var text: String
  
  init(labelText: String, placeholder: String = "", text: Binding<String>, cornerRadius: CGFloat = 20) {
    self.labelText = labelText
    self.placeholder = placeholder
    self._text = text
    self.cornerRadius = cornerRadius
  }
  
  var body: some View {
    VStack(
      alignment: .leading,
      spacing: 10,
      content: {
          Text(labelText)
              .font(.custom("Montserrat-Medium", size: 10))
              .foregroundColor(.customBlack)
          .padding(.leading, 20)
        TextField(text, text: $text)
              .textFieldStyle(OvalTextFieldStyle())//GHRoundedTextFieldStyle(textColor: Color.black, cornerRadius: cornerRadius, borderColor: .darkBlue))
      }
    )
  }
}


struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(15)
            .foregroundColor(Color.customBlack)
            .font(.custom("Montserrat-Medium", size: 12))
            .background(
              RoundedRectangle(cornerRadius: 20)
                .inset(by: 0)
                .strokeBorder()
                .foregroundColor(Color.darkBlue)
            )
            //.background(Color.customWhite)LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            //.shadow(color: .gray, radius: 10)
    }
}
