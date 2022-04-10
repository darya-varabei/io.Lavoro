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
    @State var account: WrappedAccount
    var body: some View {
        if account.account is Applicant {
           applicantProfileView
        }
        else {
            projectProfileView
        }
    }
    
    @ViewBuilder
    var applicantProfileView: some View {
        HStack {
            VStack {
                Text("Мой профиль")
                VStack {
                    Text(account.getName())
                    Text(account.getSpecialization())
                }
            }
        }
    }
    
    @ViewBuilder
    var projectProfileView: some View {
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
