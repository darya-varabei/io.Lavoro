//
//  AccountOffersView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 30.04.22.
//

import SwiftUI

struct AccountOffersView: View {
    @Binding var openOffers: Bool
    @Binding var offers: [Offer]?
    @State var changedOffers: [Offer]
    @State var selection: Offer
    
    var body: some View {
        NavigationView {
            List(changedOffers, id: \.name) { offerSelected in
                NavigationLink(
                    destination: UpdateOfferView(offer: $selection, changedOffer: offerSelected),
                    label: { OfferCellView(offer: offerSelected)
                    }
                ).onTapGesture {
                    selection = offerSelected
                }
            }
        }.navigationBarHidden(false)
            .onAppear{
                selection = offers![0]
            }
    }
}
