//
//  HomeUIView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 6.03.22.
//

import SwiftUI
import LocalAuthentication

struct HomeUIView: View {
    
    @State var userName = ""
    @State var password = ""
    @AppStorage("stored_User") var user = "daria-vo@rambler.ru"
    @AppStorage("status") var logged = false
    
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
                    .autocapitalization(.none)
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
                
                SecureField("Пароль", text: $password)
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color.white.opacity(0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            HStack(spacing: 15) {
                Button(action: { performAuthentification() }, label: {
                    Text("Войти")
                        .fontWeight(.heavy)
                        .font(.custom("", size: 14))
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color.blue)
                        .clipShape(Capsule())
                })
                    .opacity(userName != "" && password != "" ? 1: 0.5)
                    .disabled(userName != "" && password != "" ? false: true)
                    //.padding(.top)
                
                if getBiometricStatus() {
                    Button(action: { performAuthentification() }, label: {
                        Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.blue)
                    })
                }
            }.padding(.top)
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
        .animation(.easeOut)
    }
    
    private func getBiometricStatus() -> Bool {
        let scanner = LAContext()
        if userName == user && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none) {
            return true
        }
        return false
    }
    
    private func performAuthentification() {
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To unlock \(userName)") { (status, err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            withAnimation(.easeOut){ logged = true }
        }
    }
}

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
