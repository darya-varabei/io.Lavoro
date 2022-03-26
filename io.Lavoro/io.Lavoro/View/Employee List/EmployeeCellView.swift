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
        Color(Color.primaryBlue as! CGColor).opacity(0.0)
            .edgesIgnoringSafeArea(.all)
        ZStack(){
            RoundedRectangle(cornerRadius: 19)
                .frame(width: UIScreen.main.bounds.width - 80, height: 133, alignment: .center)
                .foregroundColor(Color.customWhite)
            
            VStack {
                
                HStack {
                    Image(uiImage: applicant.user.photo)
                    VStack {
                        Text("\(applicant.description)")
                            .font(.custom("Montserrat-SemiBold", size: 10))
                        Text("\(applicant.name) \(applicant.surname)")
                            .font(.custom("Montserrat-Bold", size: 4))
                        
                        HStack {
                            Text("\(applicant.location)")
                                .font(.custom("Montserrat-SemiBold", size: 10))
                            
                            Text("\(applicant.mode)")
                                .font(.custom("Montserrat-SemiBold", size: 10))
                        }
                    }
                }
                Text("\(applicant.payment)")
                    .font(.custom("Montserrat-Medium", size: 10))
            }
        }
    }
}

struct EmployeeCellView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeCellView()
    }
}
