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
        VStack {
            LavoroLabeledText(title: "Описание", text: offer.description)
            
            VStack {
            Text("Навыки")
            TechSetListView(skillset: offer.technologies)
            }
            
            LavoroLabeledText(title: "Локакция", text: offer.project.location)
            
            HStack {
                LavoroLabeledText(title: "Режим работы", text: offer.timeMode)
                Spacer()
                LavoroLabeledText(title: "Рабочее место", text: offer.project.mode)
            }
        }
        .padding(.horizontal, 24)
    
    }
}

//struct OfferDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        OfferDescriptionView()
//    }
//}
