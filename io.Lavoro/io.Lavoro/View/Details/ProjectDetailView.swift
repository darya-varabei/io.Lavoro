//
//  ProjectDetailView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 1.04.22.
//

import SwiftUI

struct ProjectDetailView: View {
    var project: Project
    @State var index = 1
    //@Namespace var name
    private var textColor: Color {
        return UIImage(data: project.user.photo.photo)!.brightness ? Color.customWhite : Color.customBlack
    }

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                Image(uiImage: UIImage(data: project.user.photo.photo)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .scaleEffect(1.5)
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
                        Text(project.name)
                            .font(.custom("Montserrat-SemiBold", size: 18))
                            .foregroundColor(textColor)
                        
                        HStack{
                            Text(project.location)
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(textColor)
                            
                            Spacer()
                            
                            Text("Тематика: \(project.category)")
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(textColor)
                        }
                    }
                }.padding(.horizontal, 25)
                
                Spacer(minLength: 0)
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
                            //.matchedGeometryEffect(id: "Tab", in: name)
                        }
                    }
                }
            }
            ProjectDescriptionView(project: project)
        }.padding(.bottom, 50)
            .navigationBarHidden(true)
    }
}
