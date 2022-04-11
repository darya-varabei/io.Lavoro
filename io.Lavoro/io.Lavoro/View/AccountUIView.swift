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
    @State var index = 0
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
        VStack {
            HStack {
                VStack {
                    Text("Мой профиль")
                    VStack {
                        Text(account.getName())
                        Text(account.getSpecialization())
                    }
                }
                Image(uiImage: account.account.getPhoto())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70,
                           height: 70)
                    .clipShape(Circle())
            }
            HStack(spacing: 0) {
                Button(action: {
                    withAnimation(.spring()) {
                        index = 0
                    }
                }) {
                    VStack {
                        Text("Обо мне")
                            .font(.custom("Montserrat-Medium.ttf", size: 14))
                            .foregroundColor(index == 0 ? .darkBlue : .gray)
                        
                        ZStack {
                        Capsule()
                            .fill(Color.white)
                            .frame(height: 4)
                            
                            if index == 0 {
                                Capsule()
                                    .fill(Color.darkBlue)
                                    .frame(height: 4)
                            }
                        }
                    }
                }
                
                Button(action: {
                    withAnimation(.spring()) {
                        index = 1
                    }
                }) {
                    VStack {
                        Text("Мои заявки")
                            .font(.custom("Montserrat-Medium.ttf", size: 14))
                            .foregroundColor(index == 1 ? .darkBlue : .gray)
                        
                        ZStack {
                        Capsule()
                            .fill(Color.white)
                            .frame(height: 4)
                            
                            if index == 1 {
                                Capsule()
                                    .fill(Color.darkBlue)
                                    .frame(height: 4)
                            }
                        }
                    }
                }
            }
            
            if index == 0 {
            
            VStack {
                LavoroLabeledText(title: "Обо мне", text: account.getDescription())
                HStack {
                    LavoroLabeledText(title: "Локация", text: account.getLocation())
                    LavoroLabeledText(title: "Релокейт", text: account.getRelocate())
                }
                LavoroLabeledText(title: "Интересы", text: account.getInterests())
            }
            }
            else {
                applicationsView
            }
        }
    }
    
    @ViewBuilder
    var projectProfileView: some View {
        VStack {
            HStack {
                VStack {
                    Text("Проект")
                    VStack {
                        Text(account.getName())
                        Text(account.getCategory())
                    }
                }
                Image(uiImage: account.account.getPhoto())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70,
                           height: 70)
                    .clipShape(Circle())
            }
            HStack(spacing: 0) {
                Button(action: {
                    withAnimation(.spring()) {
                        index = 0
                    }
                }) {
                    VStack {
                        Text("О проекте")
                            .font(.custom("Montserrat-Medium.ttf", size: 14))
                            .foregroundColor(index == 0 ? .darkBlue : .gray)
                        
                        ZStack {
                        Capsule()
                            .fill(Color.white)
                            .frame(height: 4)
                            
                            if index == 0 {
                                Capsule()
                                    .fill(Color.darkBlue)
                                    .frame(height: 4)
                            }
                        }
                    }
                }
                
                Button(action: {
                    withAnimation(.spring()) {
                        index = 1
                    }
                }) {
                    VStack {
                        Text("Заявки")
                            .font(.custom("Montserrat-Medium.ttf", size: 14))
                            .foregroundColor(index == 1 ? .darkBlue : .gray)
                        
                        ZStack {
                        Capsule()
                            .fill(Color.white)
                            .frame(height: 4)
                            
                            if index == 1 {
                                Capsule()
                                    .fill(Color.darkBlue)
                                    .frame(height: 4)
                            }
                        }
                    }
                }
            }
            
            if index == 0 {
            
            VStack {
                LavoroLabeledText(title: "О проекте", text: account.getDescription())
                HStack {
                    LavoroLabeledText(title: "Локация", text: account.getLocation())
                    LavoroLabeledText(title: "Режим работы", text: account.getMode())
                }
                LavoroLabeledText(title: "Интересы", text: account.getInterests())
            }
            }
            else {
                applicationsView
            }
        }
    }
    
    @ViewBuilder
    var skillsView: some View {
        VStack {
            
        }
    }
    
    @ViewBuilder
    var applicationsView: some View {
        VStack {
            
        }
    }
}

//struct AccountUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountUIView()
//    }
//}
