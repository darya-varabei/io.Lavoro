//
//  OfferListUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 27.03.22.
//

import SwiftUI

struct OfferListUIView: View {
    @Namespace var animationID
    @State private var searchText = ""
    @State var offerViewModel: OfferViewModel = OfferViewModel()
    @State private var slideOverViewPosition: ViewPosition = .hidden
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        slideOverViewPosition = .top
                    }, label: {
                        Text("Параметры")
                            .underline()
                            .foregroundColor(.customWhite)
                            .font(.custom("Montserrat-Medium", size: 14))
                    })
                    Spacer()
                    Text("")
                }.padding(.horizontal, 30)
                    .padding(.top, 50)
                    .background(Color.primaryBlue.ignoresSafeArea())
                NavigationView {
                    List(filterOffers, id: \.name) { offer in
                        NavigationLink(
                            destination: OfferDetailView(offer: offer),
                            label: { OfferCellView(offer: offer)
                            }
                        )
                    }.searchable(text: $searchText, prompt: "Поиск вакансии")//
                    
                        .background(Color.primaryBlue.ignoresSafeArea())
                        .onAppear {
                            // Set the default to clean
                            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
                            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
                            UITableView.appearance().backgroundColor = .clear
                        }
                }.navigationBarHidden(true)
            }
            SlideOverView(position: $slideOverViewPosition,
                          isHalfScreenHeight: false,
                          isHalfScreenAvailable: true,
                          handleOption: .regular) {
                OfferParametersView()
            }
        }
    }
    
    var filterOffers: [Offer] {
        if searchText.isEmpty {
            return offerViewModel.offers
        }
        else {
            return offerViewModel.offers.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                (($0.technologies.first?.name.localizedCaseInsensitiveContains(searchText)) != nil)
            }
        }
    }
}

//struct OfferListUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        OfferListUIView()
//    }
//}

