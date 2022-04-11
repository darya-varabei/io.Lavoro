//
//  EmployeeCellView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 23.03.22.
//

import SwiftUI

struct EmployeeCellView: View {
    @State var applicant: Applicant
    var body: some View {
        Color.primaryBlue.opacity(0.0)// as! CGColor).opacity(0.0)
            .edgesIgnoringSafeArea(.all)
        ZStack(){
            RoundedRectangle(cornerRadius: 19)
                .frame(width: UIScreen.main.bounds.width - 80, height: 133, alignment: .center)
                .foregroundColor(Color.customWhite)
                .shadow(color: Color.black.opacity(0.25), radius: 2, x: 2, y: 2)
            
            VStack(alignment: .leading, spacing: 33) {
                HStack(spacing: 15) {
                    Image(uiImage: UIImage(data: applicant.user.photo.photo)!)
                        .resizable()
                        .scaledToFit()
                    VStack(spacing: 10) {
                        Text("\(applicant.description)")
                            .font(.custom("Montserrat-SemiBold.ttf", size: 10))
                        Text("\(applicant.name) \(applicant.surname)")
                            .font(.custom("Montserrat-Bold.ttf", size: 14))
                        
                        HStack(spacing: 20) {
                            Text("\(applicant.location)")
                                .font(.custom("Montserrat-SemiBold.ttf", size: 10))
                            
                            Text("\(applicant.mode)")
                                .font(.custom("Montserrat-SemiBold.ttf", size: 10))
                        }
                    }
                }
                Text("\(applicant.payment)")
                    .font(.custom("Montserrat-Medium.ttf", size: 10))
            }.padding(.all, 16)
        }.frame(width: UIScreen.main.bounds.width - 80, height: 133)
    }
}

//struct EmployeeCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeeCellView()
//    }
//}
