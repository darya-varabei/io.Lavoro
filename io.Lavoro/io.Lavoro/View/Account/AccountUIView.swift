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
    @State var allow = false
    var body: some View {
        if CurrentUser.shared.getRole() == "employee" {
            applicantProfileView
                .onAppear(perform: {
                    accountViewModel.getEmployee()
                    if AccountViewModel.accountExists {
                        allow = true
                    }
                })
        }
        else {
            projectProfileView
                .onAppear(perform: {
                    accountViewModel.getProject()
                    if AccountViewModel.accountExists {
                        allow = true
                    }
                })
        }
    }
    @StateObject var accountViewModel = AccountViewModel()
    @State var editInfo = false
    
    @State var applicationList = ApplicationListView()
    
    @ViewBuilder
    var applicantProfileView: some View {
        if allow {
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
                            VStack(spacing: 10) {
                                NavigationLink(destination: HomeUIView(isLogging: $allow), label: {
                                    Text("Выход")
                                        .font(.custom("Montserrat-Medium", size: 10))
                                        .foregroundColor(.darkBlue)
                                        .underline()
                                })
                            Image(uiImage: accountViewModel.account.account?.getPhoto() ?? UIImage(named: "ally")!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70,
                                       height: 70)
                                .clipShape(Circle())
                            }
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
            .fullScreenCover(isPresented: $editInfo) {  UpdateEmployeeView(editMode: .update, editInfo: $editInfo, applicant: $accountViewModel.account.account.toNonOptional().asApplicant) }
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height - 140, alignment: .center)
        }
        else {
            ZStack {
                VStack {
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
                        NavigationLink(destination: HomeUIView(isLogging: $allow), label: {
                            Text("Выход")
                                .font(.custom("Montserrat-Medium", size: 10))
                                .foregroundColor(.darkBlue)
                                .underline()
                        })
                    }
                }
            }.padding(.vertical, 40)
                .fullScreenCover(isPresented: $editInfo) {  UpdateEmployeeView(editMode: .create, editInfo: $editInfo, applicant: $accountViewModel.account.account.toNonOptional().asApplicant) }
        }
    }
    
    @ViewBuilder
    var projectProfileView: some View {
        ZStack(alignment: allow ? .top : .center){
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color.customWhite)
            if allow {
                VStack {
                    HStack {
                        VStack(spacing: 10) {
                            Text("Мой проект")
                                .font(.custom("Montserrat-Medium", size: 10))
                                .foregroundColor(.customBlack)
                            VStack(alignment: .leading, spacing: 10) {
                                Text(accountViewModel.account.getName())
                                    .font(.custom("Montserrat-Medium", size: 14))
                                    .foregroundColor(.customBlack)
                                Text(accountViewModel.account.getCategory())
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
                        }
                        Spacer()
                        
                        VStack(spacing: 10) {
                            NavigationLink(destination: HomeUIView(isLogging: $allow), label: {
                                Text("Выход")
                                    .font(.custom("Montserrat-Medium", size: 10))
                                    .foregroundColor(.darkBlue)
                                    .underline()
                            })
                        Image(uiImage: accountViewModel.account.account?.getPhoto() ?? UIImage(systemName: "star")!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70,
                                   height: 70)
                            .clipShape(Circle())
                        }
                    }.padding(.horizontal, 20)
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
                                .padding(.vertical, 10)
                            HStack {
                                LavoroLabeledText(title: "Локация", text: accountViewModel.account.getLocation())
                                Spacer()
                                LavoroLabeledText(title: "Режим работы", text: accountViewModel.account.getMode())
                            }.padding(.vertical, 10)
                        }
                    }
                    else {
                        applicationsView
                    }
                }.fullScreenCover(isPresented: $editInfo) {  UpdateProjectView(editInfo: $editInfo, editMode: editionMode, project: $accountViewModel.account.account.toNonOptional().asProject) }
                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height - 140, alignment: .center)
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
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
                    .fullScreenCover(isPresented: $editInfo) {  UpdateProjectView(editInfo: $editInfo, editMode: .create, project: $accountViewModel.account.account.toNonOptional().asProject) }
                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height - 140, alignment: .center)
            }
        }
    }
    
    @ViewBuilder
    var applicationsView: some View {
        VStack {
            applicationList
        }
    }
}

extension Account {
    var asApplicant: Applicant! {
        get {self as! Applicant}
        set {self = newValue as! Self}
    }
}

extension Account {
    var asProject: Project! {
        get {self as! Project}
        set {self = newValue as! Self}
    }
}

