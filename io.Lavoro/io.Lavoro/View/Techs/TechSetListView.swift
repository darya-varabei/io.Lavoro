//
//  SkillSetListView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.04.22.
//

import SwiftUI

struct TechSetListView: View {
    @State var skillset: [Technology]
    var body: some View {
        NavigationView {
            List(skillset, id: \.name) { skill in
                TechCellView(technologies: skill)
            }
        }.padding(.top, 20)
    }
}

//struct SkillSetListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkillSetListView()
//    }
//}
