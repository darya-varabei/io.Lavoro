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
    @StateObject private var loginVM = LoginViewModel()
    let defaults = UserDefaults.standard
    
    var body: some View {
        VStack {
            
            Spacer(minLength: 0)
            Image(Images.logo.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 50)
                .padding(.vertical)
            
            HStack {
                VStack(alignment: .leading, spacing: 12, content: {
                    Text(Literals.logInText)
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
                
                Spacer()
                Button(action: {
                    loginVM.username = defaults.string(forKey: "login") ?? ""
                    loginVM.password = defaults.string(forKey: "password") ?? ""
                    performAuthentification()
                }, label: {
                    Image(systemName: LAContext().biometryType == .faceID ? Images.faceid.rawValue : Images.touchid.rawValue)
                        .font(.title)
                        .foregroundColor(.darkBlue)
                })
            }
            .padding()
            .background(Color.darkBlue.opacity(0.12))
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
            .background(Color.darkBlue.opacity(0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            HStack(spacing: 15) {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.darkBlue)
                        .frame(width: UIScreen.main.bounds.width - 150, height: 48, alignment: .center)
                    Button(action: {
                        loginVM.login()
                        defaults.setValue(loginVM.username, forKey: "login")
                        defaults.setValue(loginVM.password, forKey: "password")
                    }, label: {
                        Text(Literals.enter)
                            .fontWeight(.semibold)
                            .foregroundColor(.customWhite)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .clipShape(Capsule())
                    })
                    .opacity(1)
                    .disabled(false)
                }
            }.padding(.top)
            Button(action: {}, label: {
                Text(Literals.forgotPassword)
                    .foregroundColor(.primaryBlue)
            }).padding(.top, 8)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 5) {
                Text(Literals.noAccount)
                    .foregroundColor(.primaryBlue).opacity(0.8)
                
                Button(action: {}, label: {
                    Text(Literals.register)
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
        .navigate(to: MainUIView(), when: $loginVM.isAuthenticated)
        .background(Color("white").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
    }
    
    private func getBiometricStatus() -> Bool {
        let scanner = LAContext()
        if scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none) {
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
            withAnimation(.easeOut){ loginVM.login() }
        }
    }
}

struct HomeUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView()
    }
}
