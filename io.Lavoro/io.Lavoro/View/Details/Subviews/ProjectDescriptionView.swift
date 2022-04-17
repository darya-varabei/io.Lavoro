//
//  ProjectDescriptionView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.04.22.
//

import SwiftUI

struct ProjectDescriptionView: View {
    @State var project: Project
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading, spacing: 20) {
                LavoroLabeledText(title: project.name, text: project.category)
                LavoroLabeledText(title: "Описание", text: project.description)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Вакансии")
                        .font(.custom("Montserrat-SemiBold", size: 14))
                        .foregroundColor(.black)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(project.offers!, id: \.self) { offer in
                                OfferCellView(offer: offer)
                            }
                        }.padding(.vertical, 15)
                    }
                }
            }
        }.padding(.top, 20)
            .padding(.horizontal, 20)
    }
}

struct ProjectDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailView(project: Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: "Guide Human.inc", location: "Нью Йорк, США", description: "Проект по созданию социальной сети для использования на веб и мобильных платформах", offers: [Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "neoteric")!)), name: "Neoteric Technplogies", location: "Минск, Беларусь", description: "", offers: [], category: "FinTech", mode: "Удаленно"), name: "IOS разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "neurona")!)), name: "Neurona Mobile", location: "Москва, Россия", description: "", offers: [], category: "HealthTech", mode: "В офисе"), name: "Мобильный разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "contech")!)), name: "Contech.IO", location: "Гомель, Беларусь", description: "", offers: [], category: "Internet of Things", mode: "Удаленно"), name: "Mobile Dev", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Частичная занятость", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат"), Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "alfa")!)), name: "AlphaMobile", location: "Минск, Беларусь", description: "", offers: [], category: "FinTech", mode: "Удаленно"), name: "Android разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: "На проект в направлении Fintech требуется IOS разработчик с коммерческим опытом. Сотрудничество по договору поректной работы с возможностью дальнейшего включения в штат")], category: "Social network", mode: "Удаленно"))
    }
}


//struct ProjectDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectDescriptionView()
//    }
//}
