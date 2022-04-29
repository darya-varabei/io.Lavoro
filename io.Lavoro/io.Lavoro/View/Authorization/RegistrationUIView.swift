//
//  RegistrationUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import SwiftUI

struct RegistrationUIView: View {
    @State var userName = ""
    @State var password = ""
    @State var role = "employee"
    @StateObject private var loginVM = LoginViewModel()
    @State var showLoginView = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            Image(Images.logo.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 100)
                .padding(.vertical)
            
            HStack {
                VStack(alignment: .leading, spacing: 12, content: {
                    Text("Регистрация")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primaryBlue)
                })
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack {
                Image(systemName: Images.envelope.rawValue)
                    .font(.title2)
                    .foregroundColor(.primaryBlue).opacity(0.7)
                    .frame(width: 35)
                
                TextField(Literals.email, text: $loginVM.username)
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color.white.opacity(0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            
            HStack {
                Image(systemName: Images.lock.rawValue)
                    .font(.title2)
                    .foregroundColor(.primaryBlue).opacity(0.7)
                    .frame(width: 35)
                
                SecureField(Literals.password, text: $loginVM.password)
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color.white.opacity(0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            HStack(spacing: 15) {
                Button(action: { self.role = "employee"
                }, label: {
                    Text("Специалист")
                        .fontWeight(.medium)
                        .padding(.vertical)
                        .frame(width: 100)
                        .foregroundColor( self.role == "project" ? .gray.opacity(0.5) : Color.primaryBlue)
                        .clipShape(Capsule())
                })
                
                Button(action: { self.role = "project"
                }, label: {
                    Text("Проект")
                        .fontWeight(.medium)
                        .padding(.vertical)
                        .frame(width: 100)
                        .foregroundColor( self.role == "employee" ? .gray.opacity(0.5) : Color.primaryBlue)
                        .clipShape(Capsule())
                })
            }
            
            HStack(spacing: 15) {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.darkBlue)
                        .frame(width: UIScreen.main.bounds.width - 150, height: 48, alignment: .center)
                Button(action: { loginVM.register() }, label: {
                    Text("Зарегистрироваться")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .clipShape(Capsule())
                })
                }
            }
            
            Spacer(minLength: 0)
            
            HStack(spacing: 5) {
                Text("Уже есть аккаунт?")
                    .foregroundColor(.primaryBlue).opacity(0.8)
                
                Button(action: {
                    showLoginView = true
                }, label: {
                    Text("Авторизируйтесь")
                        .fontWeight(.medium)
                        .foregroundColor(.primaryBlue)
                })
            }.padding(.vertical)
            
            Button(action: {}, label: {
                HStack(alignment: .center, spacing: 10) {
                    Text(Literals.facebookText)
                    Image(Images.facebookIcon.rawValue)
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                }
                .padding(.all, 10)
            })
        }
        .navigate(to: HomeUIView(), when: $showLoginView)
        .navigate(to: MainUIView(), when: $loginVM.isAuthenticated)
        .background(Color("white").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
    }
}

struct RegistrationUIView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationUIView()
    }
}
