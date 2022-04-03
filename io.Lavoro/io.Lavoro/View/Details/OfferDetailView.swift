//
//  OfferDatailView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 1.04.22.
//

import SwiftUI

struct OfferDetailView: View {
    //@Binding var offer: Offer
    var offer: Offer
    @State var index = 0
    @Namespace var name
    //var animation: Namespace.ID
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                Image(uiImage: offer.project.user.photo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
                //.matchedGeometryEffect(id: offer.project.user.photo, in: animation)
                
                VStack(spacing: 110) {
                    
                    HStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }) {
                            Image(systemName: Images.chevronLeft.rawValue)
                                .font(.title)
                                .frame(width: 50, height: 50, alignment: .leading)
                                .foregroundColor(offer.project.user.photo.brightness ? Color.customWhite : Color.darkBlue)
                                .padding()
                                .background(Color.clear)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 11) {
                        Text(offer.name)
                            .font(.custom("Montserrat-Medium", size: 18))
                            .foregroundColor(offer.project.user.photo.brightness ? Color.customWhite : Color.darkBlue)
                        
                        HStack{
                            Text(offer.project.location)
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(offer.project.user.photo.brightness ? Color.customWhite : Color.darkBlue)
                            
                            Spacer()
                            
                            Text("\(Literals.OfferDetail.salary) \(offer.salary)")
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(offer.project.user.photo.brightness ? Color.customWhite : Color.darkBlue)
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
                }
            }
            
            switch(index) {
            case 0:
                OfferDescriptionView(offer: offer)
            case 1:
                ProjectDescriptionView(project: offer.project)
            case 2:
                ApplicationView()
            default:
                EmptyView()
            }
        }
    }
}

struct OfferDatailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(offer: Offer(project: Project(user: User(username: "", role: "", photo: UIImage(named: "guideHuman")!), name: "guide:human", location: "Минск, Беларусь", description: "Kf,fjd", offers: [], category: "", mode: ""), name: "IOS Разработчик", technologies: [Technology(name: "Swift", level: "High")], mode: "Remote", salary: "$1400", timeMode: "Full time", description: ""))
    }
}
