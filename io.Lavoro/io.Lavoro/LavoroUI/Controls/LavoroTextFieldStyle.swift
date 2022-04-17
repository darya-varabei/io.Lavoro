//
//  LavoroTextFieldStyle.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 28.03.22.
//

import Foundation
import SwiftUI

struct GHRoundedTextFieldStyle: TextFieldStyle {
  var textColor: Color?
  //var textStyle: GHTextStyle
  var maxPointSize: CGFloat?
  var horizontalIndent: CGFloat
  var verticalIndent: CGFloat
  var cornerRadius: CGFloat
  var borderColor: Color
  
  init(textColor: Color? = nil,
       //textStyle: GHTextStyle = .mobileSecondaryMedium,
       maxPointSize: CGFloat? = nil,
       horizontalIndent: CGFloat = 20,
       verticalIndent: CGFloat = 15,
       cornerRadius: CGFloat = 20,
       borderColor: Color = .darkBlue) {
    self.textColor = textColor
    //self.textStyle = textStyle
    self.maxPointSize = maxPointSize
    self.horizontalIndent = horizontalIndent
    self.verticalIndent = verticalIndent
    self.cornerRadius = cornerRadius
    self.borderColor = borderColor
  }
  
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .padding(.vertical, verticalIndent)
      .padding(.horizontal, horizontalIndent)
      .background(
        RoundedRectangle(cornerRadius: cornerRadius)
          .inset(by: 2)
          .strokeBorder()
          .foregroundColor(borderColor)
      )
  }
}
