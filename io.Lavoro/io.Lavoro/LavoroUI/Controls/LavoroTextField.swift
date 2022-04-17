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
          //.ghTextStyle(.mobileSecondarySmall, color: .ghBrown)
          .padding(.leading, 20)
        TextField(placeholder, text: $text)
          .textFieldStyle(GHRoundedTextFieldStyle(textColor: .customBlack, cornerRadius: cornerRadius, borderColor: .darkBlue))
      }
    )
  }
}
