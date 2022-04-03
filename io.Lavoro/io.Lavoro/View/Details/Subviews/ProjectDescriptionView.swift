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
                NavigationView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(project.offers!, id: \.name) { offer in
                                NavigationLink(destination: OfferDetailView(offer: offer), label: { OfferCellView(offer: offer)})
                                
                            }
                        }
                    }
                }
            }
        }
        }.padding(.top, 20)
            .padding(.horizontal, 20)
    }
}

//struct ProjectDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectDescriptionView()
//    }
//}
