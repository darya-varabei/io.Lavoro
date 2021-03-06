//
//  UpdateProjecttView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 14.04.22.
//

import SwiftUI

struct UpdateProjectView: View {
    @Binding var editInfo: Bool
    @State var editMode: EditionMode
    @State var openOffers = false
    @Binding var project: Project?
    @State var projectViewModel: ProjectViewModel = ProjectViewModel()
    @State private var skillSlideOver: ViewPosition = .hidden
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                VStack {
                    ZStack {
                        Image(uiImage: project!.getPhoto())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120,
                                   height: 120)
                            .clipShape(Circle())
                            .padding(.bottom, 40)
                    }
                    labeledFields
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.darkBlue)
                            .frame(width: UIScreen.main.bounds.width - 150, height: 48, alignment: .center)
                        Button(action: {
                            openOffers = true
                        }, label: {
                            Text("Вакансии")
                                .fontWeight(.semibold)
                                .foregroundColor(.customWhite)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 150)
                                .clipShape(Capsule())
                        })
                    }.padding(.vertical, 40)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.darkBlue)
                            .frame(width: UIScreen.main.bounds.width - 150, height: 48, alignment: .center)
                        Button(action: {
                            if editMode == .create {
                                projectViewModel.createProject(project: project!, id: CurrentUser.shared.getId().uuidString)
                            }
                            else {
                                projectViewModel.performUpdate()
                            }
                            editInfo.toggle()
                        }, label: {
                            Text("Сохранить")
                                .fontWeight(.semibold)
                                .foregroundColor(.customWhite)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 150)
                                .clipShape(Capsule())
                        })
                    }.padding(.vertical, 40)
                    
                    Button(action: { editInfo.toggle() }, label: {
                        Text("Отменить")
                            .underline()
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .clipShape(Capsule())
                    })
                }
            }.padding(.horizontal, 25)
        }.fullScreenCover(isPresented: $openOffers) {  AccountOffersView(openOffers: $openOffers, offers: $project.toNonOptional().offers, changedOffers: project?.offers ?? [], selection: (project?.offers![0])!) }
    }
    
    @ViewBuilder
    var labeledFields: some View {
        VStack(spacing: 10) {
            LavoroTextField(labelText: "Название", text: $project.toNonOptional().name)
            LavoroTextField(labelText: "Направление", text: $project.toNonOptional().category)
            LavoroTextField(labelText: "Местоположение", text: $project.toNonOptional().location)
            LavoroTextField(labelText: "Описание", text: $project.toNonOptional().description)
            LavoroTextField(labelText: "Режим работы", text: $project.toNonOptional().mode)
        }
    }
}
