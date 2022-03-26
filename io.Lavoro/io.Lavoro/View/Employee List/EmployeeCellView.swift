//
//  EmployeeCellView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 23.03.22.
//

import SwiftUI

struct EmployeeCellView: View {
   // @State var applicant: Applicant
    var body: some View {
        Color(Color.primaryBlue as! CGColor).opacity(0.0)
                    .edgesIgnoringSafeArea(.all)
                ZStack(){
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 319, height: 100, alignment: .center)
                        .foregroundColor(Color.customWhite)
                    
                    HStack {
                        
                    }
                }
    }
}

struct EmployeeCellView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeCellView()
    }
}
