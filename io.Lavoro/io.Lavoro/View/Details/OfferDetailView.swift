//
//  OfferDatailView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 1.04.22.
//

import SwiftUI

struct OfferDetailView: View {
    var offer: Offer
    @State var index = 0
    @Namespace var name
    private var textColor: Color {
        return UIImage(data: offer.project.user.photo.photo)!.brightness ? Color.customWhite : Color.customBlack
    }
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                Image(uiImage: UIImage(data: offer.project.user.photo.photo)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
                
                VStack(spacing: 110) {
                    
                    HStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }) {
                            Image(systemName: Images.chevronLeft.rawValue)
                                .font(.title)
                                .frame(width: 40, height: 40, alignment: .leading)
                                .foregroundColor(textColor)
                                .background(Color.clear)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 11) {
                        Text(offer.name)
                            .font(.custom("Montserrat-SemiBold", size: 18))
                            .foregroundColor(textColor)
                        
                        HStack{
                            Text(offer.project.location)
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(textColor)
                            
                            Spacer()
                            
                            Text("\(Literals.OfferDetail.salary) \(offer.salary)")
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(textColor)
                        }
                    }
                }.padding(.horizontal, 25)
                
                Spacer(minLength: 0)
            }
            
            HStack(spacing: 0) {
                Button(action: {
                    withAnimation(.spring()) {
                        index = 0
                    }
                }) {
                    VStack {
                        Text(Literals.OfferDescripttion.description)
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
                                    .matchedGeometryEffect(id: "Tab", in: name)
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
                        Text(Literals.OfferDetail.aboutProject
                        )
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
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
                
                Button(action: {
                    withAnimation(.spring()) {
                        index = 2
                    }
                }) {
                    VStack {
                        Text("Заявка")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(index == 2 ? .darkBlue : .gray)
                        
                        ZStack {
                        Capsule()
                            .fill(Color.white)
                            .frame(height: 4)
                            
                            if index == 2 {
                                Capsule()
                                    .fill(Color.darkBlue)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }.disabled(CurrentUser.shared.getRole() == "project")
            }.padding(.top, 20)
            
            switch(index) {
            case 0:
                OfferDescriptionView(offer: offer)
            case 1:
                ProjectDescriptionView(project: offer.project)
            case 2:
                ApplicationView(receiver: offer.project.user, offer: offer)
            default:
                EmptyView()
            }
        }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
}
