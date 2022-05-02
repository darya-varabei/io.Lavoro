//
//  AccountUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 26.03.22.
//

import SwiftUI

struct AccountUIView: View {
    @State var editionMode: EditionMode = .update
    @State var name: String = ""
    @State var specialization: String = ""
    @State var index = 0
    var body: some View {
        if CurrentUser.shared.getRole() == "employee" {
            applicantProfileView
                .onAppear(perform: {
                    accountViewModel.getEmployee()})
        }
        else {
            projectProfileView
                .onAppear(perform: {
                    accountViewModel.getProject()})
        }
    }
    @StateObject var accountViewModel = AccountViewModel()
    @State var editInfo = false
    
    @State var applicationList = ApplicationListView()
    
    @ViewBuilder
    var applicantProfileView: some View {
        if accountViewModel.account.getName() != "" {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color.customWhite)
            ScrollView {
                VStack {
                    HStack() {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Мой профиль").font(.custom("Montserrat-Medium", size: 10))
                            VStack(alignment: .leading, spacing: 10) {
                                Text(accountViewModel.account.getName())
                                    .font(.custom("Montserrat-Medium", size: 14))
                                    .foregroundColor(.customBlack)
                                Text(accountViewModel.account.getSpecialization())
                                    .font(.custom("Montserrat-Medium", size: 14))
                                    .foregroundColor(.customBlack)
                            }
                            Button(action: {
                                editInfo.toggle()
                            }, label: {
                                Text("Изменить")
                                    .font(.custom("Montserrat-Medium", size: 10))
                                    .foregroundColor(.darkBlue)
                                    .underline()
                            })
                        }.padding(.bottom, 30)
                        Spacer()
                        Image(uiImage: accountViewModel.account.account?.getPhoto() ?? UIImage(named: "ally")!)
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
                            LavoroLabeledText(title: "Обо мне", text: accountViewModel.account.getDescription())
                                .padding(.vertical, 10)
                            VStack(alignment: .leading) {
                                Text("Мои навыки")
                                    .font(.custom("Montserrat-Medium", size: 14))
                                    .foregroundColor(.customBlack)
                                    .padding(.bottom)
                                SkillSetListView(skillset: accountViewModel.account.getSkills())
                            }.padding(.horizontal, 5)
                            
                            HStack {
                                LavoroLabeledText(title: "Локация", text: accountViewModel.account.getLocation())
                                Spacer()
                                LavoroLabeledText(title: "Релокейт", text: "Возможен")
                            }
                            .padding(.vertical, 10)
                            LavoroLabeledText(title: "Интересы", text: accountViewModel.account.getInterests())
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
        }
        .fullScreenCover(isPresented: $editInfo) {  UpdateEmployeeView(editMode: editionMode, editInfo: $editInfo, applicant: accountViewModel.account.account as! Applicant) }
        .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height - 140, alignment: .center)
        }
        else {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.darkBlue)
                    .frame(width: UIScreen.main.bounds.width - 150, height: 48, alignment: .center)
                Button(action: {
                    editionMode = .create
                    editInfo.toggle()
                }, label: {
                    Text("Создать анкету")
                        .fontWeight(.semibold)
                        .foregroundColor(.customWhite)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .clipShape(Capsule())
                })
            }.padding(.vertical, 40)
        }
    }
    
    @ViewBuilder
    var projectProfileView: some View {
        if accountViewModel.account.getName() != "" {
        VStack {
            HStack {
                VStack {
                    Text("Проект")
                    VStack {
                        Text(accountViewModel.account.getName())
                        Text(accountViewModel.account.getCategory())
                    }
                }
                Image(uiImage: accountViewModel.account.account?.getPhoto() ?? UIImage(systemName: "star")!)
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
                    LavoroLabeledText(title: "О проекте", text: accountViewModel.account.getDescription())
                    HStack {
                        LavoroLabeledText(title: "Локация", text: accountViewModel.account.getLocation())
                        LavoroLabeledText(title: "Режим работы", text: accountViewModel.account.getMode())
                    }
                    LavoroLabeledText(title: "Интересы", text: accountViewModel.account.getInterests())
                }
            }
            else {
                applicationsView
            }
        }.fullScreenCover(isPresented: $editInfo) {  UpdateProjectView(editInfo: $editInfo, editMode: editionMode, project: accountViewModel.account.account as! Project) }
                .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height - 140, alignment: .center)
        }
        else {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.darkBlue)
                    .frame(width: UIScreen.main.bounds.width - 150, height: 48, alignment: .center)
                Button(action: {
                    editionMode = .create
                    editInfo.toggle()
                }, label: {
                    Text("Создать проект")
                        .fontWeight(.semibold)
                        .foregroundColor(.customWhite)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .clipShape(Capsule())
                })
            }.padding(.vertical, 40)
                .fullScreenCover(isPresented: $editInfo) {  UpdateProjectView(editInfo: $editInfo, editMode: editionMode, project: accountViewModel.account.account as! Project) }
                        .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height - 140, alignment: .center)
        }
    }
    
    @ViewBuilder
    var applicationsView: some View {
        VStack {
            applicationList
        }
    }
}

//struct AccountUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountUIView(account: WrappedAccount(account: Applicant(user: User(username: "darySp", role: "applicant", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "Дарья", surname: "Воробей", age: 19, location: "Минск, Беларусь", interests: "Тренажерный зал, стретчинг, иностранные языки, рок музыка", description: "IOS разработчик с опытом работы на коммерческий проектах в категориях Enterprise, EduTech, IoT. Открыта к проектной работе", skills: [Skill(name: "Swift", level: "Advanced"), Skill(name: "Xcode", level: "Advanced"), Skill(name: "Objective C", level: "Advanced"), Skill(name: "Git", level: "Advanced"),], relocate: false, mode: "Remote", payment: "$1500", specialization: "IOS разработчик")))
//    }
//}
