//
//  ApplicationCellView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 14.04.22.
//

import SwiftUI

struct ApplicationCellView: View {
    @State var sender: WrappedAccount
    var body: some View {
        Color.primaryBlue
            .edgesIgnoringSafeArea(.all)
        ZStack(){
            RoundedRectangle(cornerRadius: 19)
                .frame(width: UIScreen.main.bounds.width - 80, height: 133, alignment: .center)
                .foregroundColor(Color.clear)
            
            VStack(alignment: .leading, spacing: 10) {
                
                HStack(spacing: 15) {
                    Image(uiImage: sender.account.getPhoto())
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(sender.account.getName())")
                            .font(.custom("Montserrat-Bold", size: 14))
                        Text("\(sender.account.getCategory())")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .padding(.bottom, 10)
                        
                        Text("\(sender.account.getCategory())")
                            .font(.custom("Montserrat-Medium", size: 14))
                    }
                }
            }.padding(.all, 16)
        }.frame(width: UIScreen.main.bounds.width - 80, height: 133)
    }
}
