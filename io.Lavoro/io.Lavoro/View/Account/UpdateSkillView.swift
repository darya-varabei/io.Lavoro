//
//  UpdateSkillView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 29.04.22.
//

import SwiftUI

struct UpdateSkillView: View {
    @Binding var position: ViewPosition
    @Binding var skillToUpdate: Skill
    @State var updatedSkill: Skill {
        didSet {
            skillToUpdate = updatedSkill
        }
    }
    @State var levels: [String] = ["Beginner", "Junior", "Average", "Advanced", "Professional"]
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                LavoroTextField(labelText: "Название", text: $updatedSkill.name)
                Menu {
                    ForEach(levels, id: \.self) { level in
                        Button(level) {
                            updatedSkill.level = level
                        }
                    }
                } label: {
                    VStack(spacing: 5){
                        HStack{
                            Text(updatedSkill.level.isEmpty ? "Beginner" : updatedSkill.level)
                                .foregroundColor(updatedSkill.level.isEmpty ? .gray : .black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.primaryBlue.opacity(0.4))
                                .font(Font.system(size: 20, weight: .bold))
                        }
                        .padding(.horizontal)
                        Rectangle()
                            .fill(Color.primaryBlue.opacity(0.4))
                            .frame(height: 2)
                    }.frame(width: 180)
                }
            }
            Button(action: {
                position = .hidden
            }, label: {
                Text("Сохранить")
                    .fontWeight(.medium)
                    .padding(.vertical)
                    .frame(width: 100)
                    .foregroundColor(Color.primaryBlue)
                    .clipShape(Capsule())
            })
        }.padding(.top, 30)
    }
}
