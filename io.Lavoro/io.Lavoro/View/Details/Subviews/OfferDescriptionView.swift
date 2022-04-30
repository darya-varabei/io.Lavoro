//
//  OfferDescriptionView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.04.22.
//

import SwiftUI

struct OfferDescriptionView: View {
    @State var offer: Offer
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
        VStack {
            LavoroLabeledText(title: "Описание", text: offer.description)
            
            VStack(alignment: .leading, spacing: 10) {
            Text("Навыки")
                    .padding(.leading, 10)
            TechSetListView(skillset: offer.technologies)
            }.padding(.top, 20)
                
            HStack {
            LavoroLabeledText(title: "Локакция", text: offer.project.location)
                .padding(.top, 15)
                Spacer()
                Text("")
            }.padding(.bottom, 20)
            
            HStack {
                LavoroLabeledText(title: "Режим работы", text: offer.timeMode)
                Spacer()
                LavoroLabeledText(title: "Рабочее место", text: offer.project.mode)
            }.padding(.horizontal, 10)
        }
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
    
    }
}

//struct OfferDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        OfferDescriptionView(offer: Offer(project: Project(user: User(username: "Dary", role: "1", photo: SomeImage(photo: UIImage(named: "kate")!)), name: "PowerTech", location: "Минск, Беларусь", description: "", offers: [], category: "FinTech", mode: "Удаленно"), name: "IOS разработчик", technologies: [Technology(name: "Swift", level: "Advanced"), Technology(name: "Objective C", level: "Advanced"),Technology(name: "Git", level: "Advanced"), Technology(name: "SwiftUI", level: "Advanced"),], mode: "Удаленно", salary: "по результатам собеседования", timeMode: "Полный день", description: ""))
//    }
//}
struct  OfferDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        OfferDetailView(offer: Offer(project: Project(user: User(username: "", role: "", photo: SomeImage(photo: UIImage(named: "guideHuman")!)), name: "guide:human", location: "Минск, Беларусь", description: "Kf,fjd", offers: [], category: "", mode: ""), name: "IOS Разработчик", technologies: [Technology(name: "Swift", level: "Advanced")], mode: "Remote", salary: "$1400", timeMode: "Full time", description: "На проект по разработке социальной сети требуется Middle IOS разработчик с опытом работы на коммерческих проектах, наличие опыта работы в сфере Social app будет плюсом"))
    }
}
