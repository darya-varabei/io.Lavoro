//
//  ProjectsListUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import SwiftUI

struct ProjectsListUIView: View {
    @Namespace var animationID
    @State var projectViewModel: ProjectViewModel = ProjectViewModel()
    var body: some View {
        NavigationView {
            List(projectViewModel.projects, id: \.name) { project in
                NavigationLink(
                    destination: ProjectDetailView(project: project),
                    label: { ProjectCellView(project: project)
                    }
                )
            }
        }.padding(.top, 20)
    }
}

//struct ProjectsListUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectsListUIView()
//    }
//}
