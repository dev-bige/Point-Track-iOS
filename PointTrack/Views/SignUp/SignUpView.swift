//
//  SignUpView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/13/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var residentState: String = ""
    @State private var password: String = ""
    @State private var passwordVerify: String = ""
    
    private var reference = Reference()
    
    @ObservedObject private var authViewModel = AuthViewModel()
    
    var states = ["Iowa", "Minnesota"]
    
    var body: some View {
        VStack {
            Text("Create New Account")
                .font(.title)
                .bold()
                .foregroundColor(Color("MainColor"))
                .padding()
            
            TextField(
                "Full Name",
                text: $name
            )
                .textFieldStyle(.roundedBorder)
                .border(Color("MainColor"))
                .padding([.leading, .bottom, .trailing])
                .keyboardType(.alphabet)
        
            TextField(
                "Username",
                text: $username
            )
                .textFieldStyle(.roundedBorder)
                .border(Color("MainColor"))
                .padding([.leading, .bottom, .trailing])
                .keyboardType(.default)
            
            TextField(
                "Email",
                text: $email
            )
                .textFieldStyle(.roundedBorder)
                .border(Color("MainColor"))
                .padding([.leading, .bottom, .trailing])
                .keyboardType(.emailAddress)
            
            Picker("Resident State:", selection: $residentState) {
                ForEach(reference.residentStates, id: \.self) {
                    Text($0)
                }
            }
            
            SecureField(
                "Password",
                text: $password
            )
                .textFieldStyle(.roundedBorder)
                .border(Color("MainColor"))
                .padding([.leading, .bottom, .trailing])
            
            SecureField(
                "Re-enter Password",
                text: $passwordVerify
            )
                .textFieldStyle(.roundedBorder)
                .border(Color("MainColor"))
                .padding([.leading, .bottom, .trailing])
            
            Button {
            } label: {
                NavigationLink(destination: MainView().navigationBarBackButtonHidden(true), isActive: self.$authViewModel.shouldTransitSignUp) {
                    Text("Sign Up")
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            self.authViewModel.signUp(name: name, username: username, email: email, residentState: residentState, password: password, passwordVerify: passwordVerify)
                        }
                }
            }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
            
            Text(self.authViewModel.signUpStatusMessage)
                .foregroundColor(.red)
                .padding()
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
