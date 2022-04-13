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
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color.customWhite)
            ScrollView {
                VStack {
                    HStack() {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Мой профиль").font(.custom("Montserrat-Medium", size: 10))
                            VStack(alignment: .leading, spacing: 10) {
                                Text(account.getName())
                                    .font(.custom("Montserrat-Medium", size: 14))
                                    .foregroundColor(.customBlack)
                                Text(account.getSpecialization())
                                    .font(.custom("Montserrat-Medium", size: 14))
                                    .foregroundColor(.customBlack)
                            }
                            Button(action: {
                                
                            }, label: {
                                Text("Изменить")
                                    .font(.custom("Montserrat-Medium", size: 10))
                                    .foregroundColor(.darkBlue)
                                    .underline()
                            })
                        }.padding(.bottom, 30)
                        Spacer()
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
                                    .font(.custom("Montserrat-Medium", size: 14))
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
                                    .font(.custom("Montserrat-Medium", size: 14))
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
                                .padding(.vertical, 10)
                            VStack(alignment: .leading) {
                                Text("Мои навыки")
                                    .font(.custom("Montserrat-Medium", size: 14))
                                    .foregroundColor(.customBlack)
                                    .padding(.bottom)
                                SkillSetListView(skillset: account.getSkills())
                            }.padding(.horizontal, 5)
                            
                            HStack {
                                LavoroLabeledText(title: "Локация", text: account.getLocation())
                                Spacer()
                                LavoroLabeledText(title: "Релокейт", text: "Возможен")
                            }
                            .padding(.vertical, 10)
                            LavoroLabeledText(title: "Интересы", text: account.getInterests())
                                .foregroundColor(.customBlack)
                                .padding(.vertical, 10)
                        }
                    }
                    else {
                        applicationsView
                    }
                }.padding(.horizontal, 30)
                    .padding(.top, 30)
            }
        }.frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height - 140, alignment: .center)
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
                            .font(.custom("Montserrat-Medium", size: 14))
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
                            .font(.custom("Montserrat-Medium", size: 14))
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
    var applicationsView: some View {
        VStack {
            
        }
    }
}

struct AccountUIView_Previews: PreviewProvider {
    static var previews: some View {
        AccountUIView(account: WrappedAccount(account: Applicant(user: User(username: "darySp", role: "applicant", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "Дарья", surname: "Воробей", age: 19, location: "Минск, Беларусь", interests: "Тренажерный зал, стретчинг, иностранные языки, рок музыка", description: "IOS разработчик с опытом работы на коммерческий проектах в категориях Enterprise, EduTech, IoT. Открыта к проектной работе", skills: [Skill(name: "Swift", level: "Advanced"), Skill(name: "Xcode", level: "Advanced"), Skill(name: "Objective C", level: "Advanced"), Skill(name: "Git", level: "Advanced"),], relocate: false, mode: "Remote", payment: "$1500", specialization: "IOS разработчик")))
    }
}
