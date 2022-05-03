//
//  OfferListUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 27.03.22.
//

import SwiftUI

struct OfferListUIView: View {
    @Namespace var animationID
    @State private var searchText = "" {
        didSet {
            array = filterOffers()
        }
    }
    @State var array: [Offer] = []
    @StateObject var offerViewModel: OfferViewModel = OfferViewModel()
    @State private var slideOverViewPosition: ViewPosition = .hidden
    
    var body: some View {
        NavigationView {
        ZStack {
            VStack(spacing: 0) {
                if slideOverViewPosition == .hidden {
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
                    }.opacity(CurrentUser.shared.getRole() == "project" ? 0 : 1)//.isHidden(CurrentUser.shared.getRole() == "project")
                    .padding(.horizontal, 30)
                        .padding(.top, 50)
                        .background(Color.primaryBlue.ignoresSafeArea())
                }
//                NavigationView {
                    List (offerViewModel.offers, id: \.name) { offer in
                        NavigationLink(
                            destination: OfferDetailView(offer: offer),
                            label: { OfferCellView(offer: offer)
                            }
                        )
                    }.searchable(text: $searchText, prompt: "Поиск вакансии")//
                    
                        .background(Color.primaryBlue.ignoresSafeArea())
                        .onAppear {
                            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
                            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
                            UITableView.appearance().backgroundColor = .clear
                        }
            }
            SlideOverView(position: $slideOverViewPosition,
                          isHalfScreenHeight: false,
                          isHalfScreenAvailable: true,
                          handleOption: .regular) {
                EmployeeParametersView(slideOverViewPosition: $slideOverViewPosition, mode: .employee)
            }
        }.onAppear {
            offerViewModel.getOfferList()
            array = offerViewModel.offers
        }
        }.navigationBarHidden(true)
    }
    
    func filterOffers() -> [Offer] {
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
