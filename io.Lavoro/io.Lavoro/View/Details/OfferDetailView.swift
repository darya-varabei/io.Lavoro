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
                        Image(systemName: "chevron.left")
                            .font(.title)
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
                            
                            Text("Зарплата: \(offer.salary)")
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(offer.project.user.photo.brightness ? Color.customWhite : Color.darkBlue)
                        }
                    }
                }.padding(.horizontal, 25)
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct OfferDatailView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(offer: Offer(project: Project(user: User(username: "", role: "", photo: UIImage(named: "guideHuman")!), name: "guide:human", location: "Минск, Беларусь", description: "Kf,fjd", offers: [], category: "", mode: ""), name: "IOS Разработчик", technologies: [Technology(name: "Swift", level: "High")], mode: "Remote", salary: "$1400", timeMode: "Full time"))
    }
}
