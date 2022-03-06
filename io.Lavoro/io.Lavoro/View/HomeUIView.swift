//
//  HomeUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 6.03.22.
//

import SwiftUI

struct HomeUIView: View {
    
    @State var userName = ""
    @State var password = ""
    var body: some View {
        VStack {
            
            Spacer(minLength: 0)
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 65)
                .padding(.vertical)
            
            HStack {
                VStack(alignment: .leading, spacing: 12, content: {
                    Text("Вход в аккаунт")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Введите данные учетной записи")
                        .foregroundColor(Color.white.opacity(0.5))
                })
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack {
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                TextField("Эл.почта", text: $userName)
            }
            .padding()
            .background(Color.white.opacity(0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "lock")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                SecureField("Пароль", text: $userName)
            }
            .padding()
            .background(Color.white.opacity(0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            Button(action: {}, label: {
                Text("Войти")
                    .fontWeight(.heavy)
                    .font(.custom("", size: 14))
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 150)
                    .background(Color.blue)
                    .clipShape(Capsule())
            })
                .padding(.top)
            
            Button(action: {}, label: {
                Text("Forgot passsword?")
                    .foregroundColor(Color.green)
            }).padding(.top, 8)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 5) {
                Text("Don't have an account?")
                    .foregroundColor(Color.white.opacity(0.6))
                
                Button(action: {}, label: {
                    Text("Sign up")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.blue)
                })
            }.padding(.vertical)
        }
        
        .background(Color.green.ignoresSafeArea(.all, edges: .all))
    }
}

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
