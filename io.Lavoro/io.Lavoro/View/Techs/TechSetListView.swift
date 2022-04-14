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
        ForEach(skillset, id: \.self) { skill in
            TechCellView(technologies: skill)
        }
    }
}
