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
                .padding(.horizontal, 100)
                .padding(.vertical)
            
            HStack {
                VStack(alignment: .leading, spacing: 12, content: {
                    Text("Вход в аккаунт")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("primaryBlue"))
                    Text("Введите данные учетной записи")
                        .foregroundColor(Color("primaryBlue").opacity(0.5))
                })
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack {
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(Color("primaryBlue").opacity(0.7))
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
                    .foregroundColor(Color("primaryBlue").opacity(0.7))
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
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("primaryBlue"))
                        .clipShape(Capsule())
                })
                    .opacity(userName != "" && password != "" ? 1: 0.5)
                    .disabled(userName != "" && password != "" ? false: true)
                
                if getBiometricStatus() {
                    Button(action: { performAuthentification() }, label: {
                        Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color("primaryBlue"))
                    })
                }
            }.padding(.top)
            Button(action: {}, label: {
                Text("Забыли пароль?")
                    .foregroundColor(Color("primaryBlue"))
            }).padding(.top, 8)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 5) {
                Text("Еще нет аккаунта?")
                    .foregroundColor(Color("primaryBlue").opacity(0.8))
                
                Button(action: {}, label: {
                    Text("Зарегистрируйтесь")
                        .fontWeight(.medium)
                        .foregroundColor(Color("primaryBlue"))
                })
            }.padding(.vertical)
            
            Button(action: {}, label: {
                HStack(alignment: .center, spacing: 10) {
                Text("Войти через Facebook")
                    Image("facebookIcon")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                }
                .padding(.all, 10)
            })
        }
        .background(Color("white").ignoresSafeArea(.all, edges: .all))
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
