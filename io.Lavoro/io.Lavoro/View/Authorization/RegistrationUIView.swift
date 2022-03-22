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
    @AppStorage("stored_User") var user = "daria-vo@rambler.ru"
    @AppStorage("status") var logged = false
    @StateObject private var loginVM = LoginViewModel()
    
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
                    Text(Literals.logInText.rawValue)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primaryBlue)//(Color(Colors.primaryBlue.rawValue))
                })
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack {
                Image(systemName: Images.envelope.rawValue)
                    .font(.title2)
                    .foregroundColor(.primaryBlue).opacity(0.7)
                    .frame(width: 35)
                
                TextField(Literals.email.rawValue, text: $loginVM.username)
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
                
                SecureField(Literals.password.rawValue, text: $loginVM.password)
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color.white.opacity(0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            HStack(spacing: 15) {
                Button(action: { performAuthentification() }, label: {
                    Text(Literals.enter.rawValue)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        
                        //.backgroundColor(.primaryBlue)
                        .clipShape(Capsule())
                })
                    .opacity(1)//($loginVM.username != "" && loginVM.password != "" ? 1: 0.5)
                    .disabled(false)//($loginVM.userName != "" && $loginVM.password != "" ? false: true)
                
                if getBiometricStatus() {
                    Button(action: { performAuthentification() }, label: {
                        Image(systemName: LAContext().biometryType == .faceID ? Images.faceid.rawValue : Images.touchid.rawValue)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                           // .background(.primaryBlue)
                    })
                }
            }.padding(.top)
            Button(action: {}, label: {
                Text(Literals.forgotPassword.rawValue)
                    .foregroundColor(.primaryBlue)
            }).padding(.top, 8)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 5) {
                Text(Literals.noAccount.rawValue)
                    .foregroundColor(.primaryBlue).opacity(0.8)
                
                Button(action: {}, label: {
                    Text(Literals.register.rawValue)
                        .fontWeight(.medium)
                        .foregroundColor(.primaryBlue)
                })
            }.padding(.vertical)
            
            Button(action: {}, label: {
                HStack(alignment: .center, spacing: 10) {
                    Text(Literals.facebookText.rawValue)
                    Image(Images.facebookIcon.rawValue)
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                }
                .padding(.all, 10)
            })
        }
        .background(Color("white").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
    }
}

struct RegistrationUIView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationUIView()
    }
}
