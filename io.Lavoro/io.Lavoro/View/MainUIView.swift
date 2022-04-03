//
//  MainUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import SwiftUI

struct MainUIView: View {
    @State var index = 2
    var body: some View {
        VStack(spacing: 0) {
            OptionsView(index: self.$index)
            TabBar(index: self.$index)
        }
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
    }
}

//struct MainUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainUIView()
//    }
//}
