//
//  LavoroTitledText.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 10.04.22.
//

import SwiftUI

struct LavoroTitledText: View {
    @State var title: String
    @State var text: String
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.custom("Montserrat-Medium", size: 13))
                .foregroundColor(.customBlack)
            Text(text)
                .font(.custom("Montserrat-Regular", size: 11))
                .foregroundColor(.customBlack)
        }.padding(.horizontal, 27)
    }
}

//struct LavoroTitledText_Previews: PreviewProvider {
//    static var previews: some View {
//        LavoroTitledText()
//    }
//}
