//
//  UpdateOfferView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 30.04.22.
//

import SwiftUI

struct UpdateOfferView: View {
    @Binding var offer: Offer
    @State var changedOffer: Offer
    @State private var skillSlideOver: ViewPosition = .hidden
    @State var skillToUpdate =  Technology(name: "", level: "")
    
    var body: some View {
        ZStack {
        VStack {
            labeledFields
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(offer.technologies, id: \.self) { skill in
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
                        offer.technologies.append(Technology(name: "", level: ""))
                        skillToUpdate = offer.technologies.last ?? Technology(name: "", level: "")
                        skillSlideOver = .halfScreen
                    }, label: {
                        Image(systemName: "plus.app")
                            .foregroundColor(.darkBlue)
                    })
                }})
        }.padding(.horizontal, 25)
            SlideOverView(position: $skillSlideOver,
                          isHalfScreenHeight: false,
                          handleOption: .staticWithoutHandler) {
                UpdateTechnologyView(position: $skillSlideOver, skillToUpdate: $skillToUpdate,
                                updatedSkill: skillToUpdate)
            }
        }
    }
    
    @ViewBuilder
    var labeledFields: some View {
        VStack(spacing: 10) {
            LavoroTextField(labelText: "Название", text: $offer.name)
            LavoroTextField(labelText: "Оплата", text: $offer.salary)
            LavoroTextField(labelText: "Описание", text: $offer.description)
            LavoroTextField(labelText: "Режим работы", text: $offer.timeMode)
        }
    }
}
