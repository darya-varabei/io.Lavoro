//
//  OfferListUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 26.03.22.
//

import SwiftUI

struct OfferCellView: View {
    @State var offer: Offer
    @State var isFullInfo: Bool = true
    var body: some View {
        Color.primaryBlue// as! CGColor).opacity(0.0)
            .edgesIgnoringSafeArea(.all)
        ZStack(){
            RoundedRectangle(cornerRadius: 19)
                .frame(width: UIScreen.main.bounds.width - 80, height: 133, alignment: .center)
                .foregroundColor(Color.clear)
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack(spacing: 15) {
                    if isFullInfo {
                    Image(uiImage: offer.project.user.photo)
                            .resizable()
                            .scaledToFit()
                    Spacer()
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(offer.timeMode)")
                            .font(.custom("Montserrat-SemiBold", size: 10))
                        Text("\(offer.name)")
                            .font(.custom("Montserrat-Bold", size: 14))
                        
                        HStack {
                            Text("\(offer.project.location)")
                                .font(.custom("Montserrat-SemiBold", size: 10))
                            
                            Text("\(offer.mode)")
                                .font(.custom("Montserrat-SemiBold", size: 10))
                        }
                    }
                }
                Text("\(offer.salary)")
                    .font(.custom("Montserrat-Medium", size: 10))
            }.padding(.all, 16)
        }.frame(width: UIScreen.main.bounds.width - 80, height: 133)
            .listRowBackground(Color.green)
    }
}

//struct OfferCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        OfferListUIView()
//    }
//}
