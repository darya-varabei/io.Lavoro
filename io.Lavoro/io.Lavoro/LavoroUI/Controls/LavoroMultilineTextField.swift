//
//  LavoroMultilineTextField.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 28.03.22.
//

import Foundation
import SwiftUI
import UIKit

struct GHMultilineTextField: View {
  
  private var title: String
  private var onCommit: (() -> Void)?
  
  @Binding private var text: String
  private var internalText: Binding<String> {
    Binding<String>(
      get: { self.text },
      set: {
        self.text = $0
        self.showingPlaceholder = $0.isEmpty
      }
    )
  }
  
  @State private var dynamicHeight: CGFloat = 150
  @State private var showingPlaceholder = false
  
  init(_ placeholder: String = "", text: Binding<String>, onCommit: (() -> Void)? = nil) {
    self.title = placeholder
    self.onCommit = onCommit
    self._text = text
    self._showingPlaceholder = State<Bool>(initialValue: self.text.isEmpty)
  }
  
  var body: some View {
    VStack(
      alignment: .leading,
      spacing: 10,
      content: {
        Text(title)
              .foregroundColor(Color.darkBlue)
          //.ghTextStyle(.mobileSecondarySmall)
          .padding(.leading, 20)
        UITextViewWrapper(text: self.internalText, calculatedHeight: $dynamicHeight, onDone: onCommit)
          .frame(minHeight: dynamicHeight, maxHeight: dynamicHeight)
          .padding(.vertical, 15)
          .padding(.horizontal, 20)
          .background(
            RoundedRectangle(cornerRadius: 20)
              .inset(by: 2)
              .stroke()
              .foregroundColor(Color.darkBlue)
          )
      }
    )
  }
}

private struct UITextViewWrapper: UIViewRepresentable {
  typealias UIViewType = UITextView
  
  @Binding var text: String
  @Binding var calculatedHeight: CGFloat
  var onDone: (() -> Void)?
  
  func makeUIView(context: UIViewRepresentableContext<UITextViewWrapper>) -> UITextView {
    let textField = UITextView()
    textField.delegate = context.coordinator
    
    textField.isEditable = true
    textField.isSelectable = true
    textField.isUserInteractionEnabled = true
    textField.isScrollEnabled = true
    textField.backgroundColor = UIColor.clear
    if nil != onDone {
      textField.returnKeyType = .done
    }
    
    textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    return textField
  }
  
  func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<UITextViewWrapper>) {
    if uiView.text != self.text {
      uiView.text = self.text
    }
  }
  
  fileprivate static func recalculateHeight(view: UIView, result: Binding<CGFloat>) {
    let newSize = view.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
    if result.wrappedValue != newSize.height {
      DispatchQueue.main.async {
        result.wrappedValue = newSize.height
      }
    }
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(text: $text, height: $calculatedHeight, onDone: onDone)
  }
  
  final class Coordinator: NSObject, UITextViewDelegate {
    var text: Binding<String>
    var calculatedHeight: Binding<CGFloat>
    var onDone: (() -> Void)?
    
    init(text: Binding<String>, height: Binding<CGFloat>, onDone: (() -> Void)? = nil) {
      self.text = text
      self.calculatedHeight = height
      self.onDone = onDone
    }
    
    func textViewDidChange(_ uiView: UITextView) {
      text.wrappedValue = uiView.text
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
      if let onDone = self.onDone, text == "\n" {
        textView.resignFirstResponder()
        onDone()
        return false
      }
      return true
    }
  }
  
}
