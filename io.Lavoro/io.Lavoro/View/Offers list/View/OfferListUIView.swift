//
//  OfferListUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 27.03.22.
//

import SwiftUI

struct OfferListUIView: View {
    //@Namespace var animationID
    @State var offerViewModel: OfferViewModel = OfferViewModel()
    var body: some View {
        NavigationView {
            List(offerViewModel.offers, id: \.name) { offer in
                NavigationLink(
                    destination: OfferDetailView(offer: offer),
                    label: { OfferCellView(offer: offer)
                    }
                )
            }.background(Color.primaryBlue.ignoresSafeArea())
                .onAppear {
                    // Set the default to clear
                    UITableView.appearance().backgroundColor = .clear
                }
        }//.padding(.top, 20)
        .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

struct OfferListUIView_Previews: PreviewProvider {
    static var previews: some View {
        OfferListUIView()
    }
}