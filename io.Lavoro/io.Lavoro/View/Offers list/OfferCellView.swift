//
//  OfferListUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 26.03.22.
//

import SwiftUI

struct OfferCellView: View {
    @State var offer: Offer
    var body: some View {
        Color(Color.primaryBlue as! CGColor).opacity(0.0)
            .edgesIgnoringSafeArea(.all)
        ZStack(){
            RoundedRectangle(cornerRadius: 19)
                .frame(width: UIScreen.main.bounds.width - 80, height: 133, alignment: .center)
                .foregroundColor(Color.customWhite)
            
            VStack {
                
                HStack {
                    Image(uiImage: offer.project.user.photo)
                    VStack {
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
            }
        }
    }
}

struct OfferCellView_Previews: PreviewProvider {
    static var previews: some View {
        OfferListUIView()
    }
}
