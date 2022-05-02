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

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailView(project: Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: "Guide Human.inc", location: "Нью Йорк, США", description: "Проект по созданию социальной сети для использования на веб и мобильных платформах", offers: [Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "neoteric")!)), name: "Neoteric Technplogies", location: "Минск, Беларусь", description: "", offers: [], category: "FinTech", mode: "Удаленно"), name: "IOS разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "neurona")!)), name: "Neurona Mobile", location: "Москва, Россия", description: "", offers: [], category: "HealthTech", mode: "В офисе"), name: "Мобильный разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "contech")!)), name: "Contech.IO", location: "Гомель, Беларусь", description: "", offers: [], category: "Internet of Things", mode: "Удаленно"), name: "Mobile Dev", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Частичная занятость", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "alfa")!)), name: "AlphaMobile", location: "Минск, Беларусь", description: "", offers: [], category: "FinTech", mode: "Удаленно"), name: "Android разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат")], category: "Social network", mode: "Удаленно"))
    }
}
