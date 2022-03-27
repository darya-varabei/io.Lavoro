//
//  ProjectCellView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 23.03.22.
//

import SwiftUI

struct ProjectCellView: View {
    @State var project: Project
    var body: some View {
        Color(Color.primaryBlue as! CGColor).opacity(0.0)
            .edgesIgnoringSafeArea(.all)
        ZStack(){
            RoundedRectangle(cornerRadius: 19)
                .frame(width: UIScreen.main.bounds.width - 80, height: 133, alignment: .center)
                .foregroundColor(Color.customWhite)
            
            HStack {
                Image(uiImage: project.user.photo)
                VStack {
                    Text("\(project.category)")
                        .font(.custom("Montserrat-SemiBold", size: 10))
                    Text("\(project.name)")
                        .font(.custom("Montserrat-Bold", size: 14))
                    
                    HStack {
                        Text("\(project.location)")
                            .font(.custom("Montserrat-SemiBold", size: 10))
                        Text("\(project.mode)")
                            .font(.custom("Montserrat-SemiBold", size: 10))
                    }
                    
                }
            }
        }
    }
}

//struct ProjectCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectCellView()
//    }
//}
