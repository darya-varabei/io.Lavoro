//
//  SkillCellView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.04.22.
//

import SwiftUI

struct SkillCellView: View {
    @State var skill: Skill
    var body: some View {
        HStack {
            Text(skill.name)
                .font(.custom("Montserrat-Medium", size: 12))
                .foregroundColor(Color.black)
            
            Spacer()
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 100, height: 10, alignment: .leading)
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(width: skill.defineNumericLevel() * 20, height: 10, alignment: .leading)
                    .foregroundColor(Color.primaryBlue)
            }
        }
    }
}

//struct SkillCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkillCellView()
//    }
//}
