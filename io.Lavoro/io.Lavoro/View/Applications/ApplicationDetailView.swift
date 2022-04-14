//
//  ApplicationDetailView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 14.04.22.
//

import SwiftUI

struct ApplicationDetailView: View {
    @State var application: Application
    @State var message: String = ""
    var body: some View {
        VStack(spacing: 20) {
            LavoroLabeledText(title: "Сообщение", text: application.message)
            GHMultilineTextField("Введите сообщение", text: $message, onCommit: {})
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.darkBlue)
                    .frame(width: UIScreen.main.bounds.width - 200, height: 48, alignment: .center)
                Button(action: {
                }, label: {
                    Text("Отправить")
                        .fontWeight(.semibold)
                        .foregroundColor(.customWhite)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .clipShape(Capsule())
                })
            }
        }
        .padding(.top)
        .padding(.horizontal, 20)
    }
    
    private func sendResponse() {
        
    }
}

//struct ApplicationDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ApplicationDetailView()
//    }
//}
