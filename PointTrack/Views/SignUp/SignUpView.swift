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
    @State private var signUpStatusMessage = ""
    @State private var shouldTransit = false
    
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
            
            Button {
            } label: {
                NavigationLink(destination: MainView().navigationBarBackButtonHidden(true), isActive: $shouldTransit) {
                    Text("Sign Up")
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            self.signUp()
                        }
                }
            }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
            
            Text(self.signUpStatusMessage)
                .foregroundColor(.red)
                .padding()
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
    
    private func signUp() {
        
        if (!self.password.elementsEqual(self.passwordVerify)) {
            signUpStatusMessage = "Passwords Must Match!"
        }
        
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to create user:", error)
                self.signUpStatusMessage = error.localizedDescription
                return
            }
            
            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
            let userData = ["email": self.email, "uid": uid, "name": self.name, "username": self.username, "residentState": self.residentState, "createdOn": Date.now, "devicedCreatedOn": "iOS"] as [String : Any]
            
            FirebaseManager.shared.firestore.collection("users")
                .document(uid).setData(userData) { error in
                    if let error = error {
                        print(error)
                        self.signUpStatusMessage = "Failed to create user: \(error)"
                        return
                    }
                }
            self.shouldTransit = true
        }
    }

}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
