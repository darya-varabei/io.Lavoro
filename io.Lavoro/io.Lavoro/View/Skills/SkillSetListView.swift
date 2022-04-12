//
//  SkillSetListView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.04.22.
//

import SwiftUI

struct SkillSetListView: View {
    @State var skillset: [Skill]
    var body: some View {
        //NavigationView {
            //List(skillset, id: \.name) { skill in
        ForEach(skillset, id: \.self) { skill in
               SkillCellView(skill: skill)
            }
        }
       // }//.padding(.top, 20)
}

//struct SkillSetListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkillSetListView()
//    }
//}
