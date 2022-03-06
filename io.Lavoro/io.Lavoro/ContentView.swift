//
//  ContentView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 6.03.22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("status") var logged = false
    
    var body: some View {
        NavigationView {
            
            if logged {
                Text("User logged")
            }
            else {
                HomeUIView()
                    .preferredColorScheme(.dark)
                    .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
