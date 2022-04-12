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
    private var textColor: Color {
        return UIImage(data: offer.project.user.photo.photo)!.brightness ? Color.customWhite : Color.black
    }
    //var animation: Namespace.ID
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                Image(uiImage: UIImage(data: offer.project.user.photo.photo)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
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
                                .frame(width: 44, height: 44, alignment: .leading)
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
                }
            }
            
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

struct OfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(offer: Offer(project: Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: "guide:human", location: "Минск, Беларусь", description: "Kf,fjd", offers: [], category: "", mode: ""), name: "IOS Разработчик", technologies: [Technology(name: "Swift", level: "High")], mode: "Remote", salary: "$1400", timeMode: "Full time", description: ""))
    }
}
