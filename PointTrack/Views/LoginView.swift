//
//  LoginView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/13/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Point_Track_Main_Logo")                .ignoresSafeArea(edges: .top)
                
                TextField(
                    "Email",
                    text: $email
                )

                    .textFieldStyle(.roundedBorder)
                    .border(Color("MainColor"))
                    .padding(.horizontal)

                
                SecureField(
                    "Password",
                    text: $password
                )
                    .textFieldStyle(.roundedBorder)
                    .border(Color("MainColor"))
                    .padding(.horizontal)
                
                NavigationLink(destination: ForgotPasswordView()) {
                    Text("Forgot Password?")
                        .foregroundColor(Color("MainColor"))
                        .bold()
                        .frame(maxWidth: .infinity, alignment:
                                    .trailing)
                        .padding(.trailing)
                    
                }
                
                Button(action: login) {
                    Text("Login")
                        .foregroundColor(Color.white)

                }
                    .buttonStyle(.bordered)
                    .background(Color("MainColor"))
                
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account? Sign up here")
                        .foregroundColor(Color("MainColor"))
                        .bold()
                }.foregroundColor(Color.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    private func login() {
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
        }
    }
}
