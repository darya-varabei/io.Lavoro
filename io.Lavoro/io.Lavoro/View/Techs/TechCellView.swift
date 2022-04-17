//
//  SkillCellView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.04.22.
//

import SwiftUI

struct TechCellView: View {
    
    @State var technologies: Technology
    var body: some View {
        HStack {
            Text(technologies.name)
                .font(.custom("Montserrat-Medium", size: 16))
                .foregroundColor(Color.black)
            Spacer()
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 100, height: 10, alignment: .leading)
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(width: technologies.defineNumericLevel() * 20, height: 10, alignment: .leading)
                    .foregroundColor(Color.primaryBlue)
            }
        }.padding(.horizontal, 10)
    }
}

//struct SkillCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkillCellView()
//    }
//}
