//
//  EmployeeDetailsView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 1.04.22.
//

import SwiftUI

struct EmployeeDetailsView: View {
    @State var applicant: Applicant
    @State var index = 0
    private var textColor: Color {
        return UIImage(data: applicant.user.photo.photo)!.brightness ? Color.customBlack : Color.customWhite
    }
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ScrollView(.vertical) {
        VStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                Image(uiImage: UIImage(data: applicant.user.photo.photo)!)
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
                        Text(applicant.getName())
                            .font(.custom("Montserrat-SemiBold", size: 18))
                            .foregroundColor(textColor)
                        
                        HStack{
                            Text(applicant.location)
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(textColor)
                            
                            Spacer()
                            
                            Text("Возраст: \(applicant.age)")
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(textColor)
                        }
                    }
                }.padding(.horizontal, 25)
                
                Spacer(minLength: 0)
            }
            VStack {
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
                            Text("Заявка"
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
                                }
                            }
                        }
                    }.disabled(CurrentUser.shared.getRole() == "employee")
                }
                
                switch(index) {
                case 0:
                    Text(applicant.getSpecialization())
                        .font(.custom("Montserrat-SemiBold", size: 18))
                        .foregroundColor(textColor)
                        .padding(.vertical, 10)
                    LavoroLabeledText(title: "Обо мне", text: applicant.getDescription())
                        .padding(.vertical, 10)
                    VStack(alignment: .leading) {
                        Text("Мои навыки")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.customBlack)
                            .padding(.bottom)
                        SkillSetListView(skillset: applicant.getSkills())
                    }.padding(.horizontal, 5)
                    
                    HStack {
                        LavoroLabeledText(title: "Локация", text: applicant.getLocation())
                        Spacer()
                        LavoroLabeledText(title: "Релокейт", text: "Возможен")
                    }
                    .padding(.vertical, 10)
                    LavoroLabeledText(title: "Интересы", text: applicant.getInterests())
                        .foregroundColor(.customBlack)
                        .padding(.vertical, 10)
                case 1:
                    ApplicationView(receiver: applicant.user)
                default:
                    EmptyView()
                }
            }.padding(.horizontal, 20)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        }
    }
}
    
//struct EmployeeDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeeDetailsView()
//    }
//}
