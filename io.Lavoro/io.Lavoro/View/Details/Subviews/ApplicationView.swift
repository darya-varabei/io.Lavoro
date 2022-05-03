//
//  ApplicationView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.04.22.
//

import SwiftUI

struct ApplicationView: View {
    @State var receiver: User
    @State var message: String = ""
    @State var offer: Offer?
    var body: some View {
        VStack(spacing: 20) {
            GHMultilineTextField("Сообщение", text: $message)
            Button(action: {}) {
                Text("Отправить")
                    .fontWeight(.semibold)
                    .foregroundColor(.customWhite)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 150)
                    .cornerRadius(10)
                    //.backgroundColor(.primaryBlue)
                    .clipShape(
                        Capsule()
                    )
            }.background(Color.primaryBlue)
                .cornerRadius(10)
                .frame(width: UIScreen.main.bounds.width - 150)
            Spacer()
        }.padding(.horizontal, 20)
    }
}

//struct ApplicationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ApplicationView()
//    }
//}
