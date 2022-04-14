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
        ForEach(skillset, id: \.self) { skill in
            SkillCellView(skill: skill)
        }
    }
}
