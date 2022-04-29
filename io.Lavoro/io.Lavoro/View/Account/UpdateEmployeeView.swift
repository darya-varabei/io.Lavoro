//
//  UpdateEmployeeView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 14.04.22.
//

import SwiftUI

struct UpdateEmployeeView: View {
    @Binding var editInfo: Bool
    @State var applicant: Applicant
    @State var employeeViewModel: EmployeeViewModel = EmployeeViewModel()
    @State private var skillSlideOver: ViewPosition = .hidden
    @State var skillToUpdate = Skill(name: "", level: "")
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ZStack {
                        Image(uiImage: applicant.getPhoto())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120,
                                   height: 120)
                            .clipShape(Circle())
                            .padding(.bottom, 40)
                    }
                    labeledFields
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(applicant.skills, id: \.self) { skill in
                                VStack {
                                    Text(skill.name)
                                        .font(.custom("Montserrat-Medium", size: 12))
                                        .foregroundColor(.darkBlue)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 10)
                                        .clipShape(Capsule())
                                    Text(skill.level)
                                        .font(.custom("Montserrat-Medium", size: 12))
                                        .foregroundColor(.darkBlue)
                                        .padding(.bottom, 8)
                                        .padding(.horizontal, 10)
                                        .clipShape(Capsule())
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.primaryBlue.opacity(0.5), lineWidth: 1)
                                )
                                .onTapGesture {
                                    skillToUpdate = skill
                                    if skillSlideOver != .hidden {
                                        skillSlideOver = .hidden
                                    } else {
                                        skillToUpdate = skill
                                        skillSlideOver = .custom(0.75)
                                    }
                                }
                                .onTapGesture(count: 2, perform: {
                                    
                                })
                            }
                            Button(action: {
                                applicant.skills.append(Skill(name: "", level: ""))
                                skillToUpdate = applicant.skills.last!
                            }, label: {
                                Image(systemName: "plus.app")
                                    .foregroundColor(.darkBlue)
                            })
                        }})
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.darkBlue)
                            .frame(width: UIScreen.main.bounds.width - 150, height: 48, alignment: .center)
                        Button(action: { }, label: {
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
            SlideOverView(position: $skillSlideOver,
                          isHalfScreenHeight: false,
                          handleOption: .staticWithoutHandler) {
                UpdateSkillView(position: $skillSlideOver, skillToUpdate: $skillToUpdate)
            }
        }
    }
    
    @ViewBuilder
    var labeledFields: some View {
        VStack(spacing: 10) {
            LavoroTextField(labelText: "Имя", text: $applicant.name)
            LavoroTextField(labelText: "Фамилия", text: $applicant.surname)
            LavoroTextField(labelText: "Местоположение", text: $applicant.location)
            LavoroTextField(labelText: "Специализация", text: $applicant.specialization)
            LavoroTextField(labelText: "Описание", text: $applicant.description)
            LavoroTextField(labelText: "Режим работы", text: $applicant.mode)
            LavoroTextField(labelText: "Интересы", text: $applicant.interests)
        }
    }
}
