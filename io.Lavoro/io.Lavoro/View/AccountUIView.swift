//
//  AccountUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 26.03.22.
//

import SwiftUI

struct AccountUIView: View {
    
    @State var name: String = ""
    @State var specialization: String = ""
    @State var account: Account
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    @ViewBuilder
    var avatarSelect: some View {
        HStack {
            VStack {
                Text("Мой профиль")
            }
        }
    }
}

//struct AccountUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountUIView()
//    }
//}
