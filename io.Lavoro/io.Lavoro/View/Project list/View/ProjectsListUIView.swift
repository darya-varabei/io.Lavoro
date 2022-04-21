//
//  ProjectsListUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import SwiftUI

struct ProjectsListUIView: View {
    //@Namespace var animationID
    @State var projectViewModel: ProjectViewModel = ProjectViewModel()
    @State private var searchText = ""
    @State private var slideOverViewPosition: ViewPosition = .hidden
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        slideOverViewPosition = .top
                    }, label: {
                        Text("Параметры")
                            .underline()
                            .foregroundColor(.customWhite)
                            .font(.custom("Montserrat-Medium", size: 14))
                    })
                    Spacer()
                    Text("")
                }.padding(.horizontal, 30)
        NavigationView {
            List(projectViewModel.projects, id: \.name) { project in
                NavigationLink(
                    destination: ProjectDetailView(project: project),
                    label: { ProjectCellView(project: project)
                    }
                )
            }.searchable(text: $searchText, prompt: "Поиск проекта")
                .background(Color.primaryBlue.ignoresSafeArea())
                .onAppear {
                    // Set the default to clear
                    UITableView.appearance().backgroundColor = .clear
                    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
                    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
                }
        }.padding(.top, 20)
    }
    SlideOverView(position: $slideOverViewPosition,
                  isHalfScreenHeight: false,
                  isHalfScreenAvailable: true,
                  handleOption: .staticWithHandler) {
        ProjectParametersView()
    }
}
}
    
    var filterProjects: [Project] {
        if searchText.isEmpty {
            return projectViewModel.projects
        }
        else {
            return projectViewModel.projects.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.category.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct ProjectsListUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsListUIView()
    }
}
