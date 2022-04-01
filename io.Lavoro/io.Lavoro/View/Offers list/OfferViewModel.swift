//
//  OfferViewModel.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 1.04.22.
//

import Foundation
import SwiftUI

class OfferViewModel: ObservableObject {
    @Published var isParametersOpen: Bool = false
    @Published var offers: [Offer] = []
}
