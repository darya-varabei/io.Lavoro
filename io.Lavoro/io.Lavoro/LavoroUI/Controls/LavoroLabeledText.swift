//
//  LavoroLabeledText.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.04.22.
//

import SwiftUI

struct LavoroLabeledText: View {
    @State var title: String
    @State var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(title)
                .font(.custom("Montserrat-Medium", size: 14))
                .foregroundColor(.black)
            
            Text(text)
                .font(.custom("Montserrat-Medium", size: 12))
                .foregroundColor(.black)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

//struct LavoroLabeledText_Previews: PreviewProvider {
//    static var previews: some View {
//        LavoroLabeledText()
//    }
//}
