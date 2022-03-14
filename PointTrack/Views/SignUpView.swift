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
        
            TextField(
                "Username",
                text: $username
            )
                .textFieldStyle(.roundedBorder)
                .border(Color("MainColor"))
                .padding([.leading, .bottom, .trailing])
            
            TextField(
                "Email",
                text: $email
            )
                .textFieldStyle(.roundedBorder)
                .border(Color("MainColor"))
                .padding([.leading, .bottom, .trailing])
            
            TextField(
                "Resident State",
                text: $residentState
            )
                .textFieldStyle(.roundedBorder)
                .border(Color("MainColor"))
                .padding([.leading, .bottom, .trailing])
            
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
            
            Button(action: signUp) {
                Text("Sign Up")
                    .foregroundColor(Color.white)

            }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
    
    private func signUp() {
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
