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
    
    @ObservedObject private var authViewModel = AuthViewModel()

    var body: some View {
            VStack {
                Image("Point_Track_Main_Logo")
                    .ignoresSafeArea(edges: .top)
                
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
                
                Button {
                } label: {
                    NavigationLink(
                        destination: MainView().navigationBarBackButtonHidden(true),
                        isActive: self.$authViewModel.shouldTransit) {
                            Text("Login")
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    self.authViewModel.login(email: email, password: password)
                                }
                    }
                }
                    .buttonStyle(.bordered)
                    .background(Color("MainColor"))
                
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account? Sign up here")
                        .foregroundColor(Color("MainColor"))
                        .bold()
                }
                    .foregroundColor(Color.black)
                
                Text(self.authViewModel.loginStatusMessage)
                    .foregroundColor(.red)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
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
