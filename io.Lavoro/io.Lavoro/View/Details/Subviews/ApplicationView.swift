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
    @State var offer: Offer
    var body: some View {
        VStack {
            GHMultilineTextField("Сообщение", text: $message)
            Button(action: {}, label: {
                Text("")
            })
        }.padding(.horizontal, 20)
    }
}

//struct ApplicationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ApplicationView()
//    }
//}
