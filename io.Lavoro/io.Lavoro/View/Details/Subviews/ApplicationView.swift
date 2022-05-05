//
//  ApplicationView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.04.22.
//

import SwiftUI

enum Mode {
    case create
    case update
}

struct ApplicationView: View {
    @State var receiver: String
    @State var message: String = ""
    @State var offer: Offer?
    @State var showingAlert: Bool = false
    @State var showingDeleteAlert: Bool = false
    @State var mode: Mode = .create
    @State var finalApp: DomainApplication?
    @State var applicationVM: ApplicationViewModel = ApplicationViewModel()
    var body: some View {
        VStack(spacing: 20) {
            GHMultilineTextField("Сообщение", text: $message)
            Button(action: {
                if mode == .create {
                let application = DomainApplication(reciever: receiver, id: "", sender: DomainOfferId(id: String(describing: CurrentUser.shared.getId())), offer: DomainOfferId(id: "6405dc34-3fe0-4c8b-b368-0198797f9786"), welcomeDescription: message)
                finalApp = applicationVM.getCreateApplication(applicant: application)
                    showingAlert = true
                }
                else {
                    mode = .update
                    let application = DomainApplication(reciever: receiver, id: "", sender: DomainOfferId(id: String(describing: CurrentUser.shared.getId())), offer: DomainOfferId(id: "6405dc34-3fe0-4c8b-b368-0198797f9786"), welcomeDescription: message)
                    finalApp = applicationVM.getUpdateApplication(applicant: application)
                    showingAlert = true
                }
            }) {
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
                .alert(mode == .create ? "Заявка отправлена" : "Заявка отредактирована", isPresented: $showingAlert) {
                           Button("OK", role: .cancel) { }
                       }
            Button(action: {
                
            }) { Text("Удалить")
                .fontWeight(.semibold)
                .foregroundColor(.customWhite)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 150)
                .cornerRadius(10)
                //.backgroundColor(.primaryBlue)
                .clipShape(
                    Capsule()
                )}.background(mode == .create ? .gray : Color.primaryBlue)
                .cornerRadius(10)
                .frame(width: UIScreen.main.bounds.width - 150)
                .alert("Удалено", isPresented: $showingDeleteAlert) {
                           Button("OK", role: .cancel) { }
                       }
                .disabled(mode == .create)
            Spacer()
        }.padding(.horizontal, 20)
    }
}
