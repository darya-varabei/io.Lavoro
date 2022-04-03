//
//  EmployeeHomeView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 27.03.22.
//

import SwiftUI

struct EmployeeHomeView: View {
    @State var user: User
    @Namespace var animationID
    @StateObject var employeeViewModel = EmployeeViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(alignment: .bottom){
                    Text("Привет, \(user.username)")
                        .font(.custom("Montserrat-SemiBold.ttf", size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Text("Параметры")
                            .font(.custom("Montserrat-Regular.ttf", size: 10))
                            .foregroundColor(Color.darkBlue)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(
                                Capsule()
                                    .stroke(Color.darkBlue, lineWidth: 1)
                            )
                    }
                }.padding(.top, 8)
                //searchBar
            }.padding()
        }.background(Color.clear)
    }
}
//
//struct EmployeeHomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeeHomeView()
//    }
//}
