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
        
    init() {
        UITableView.appearance().contentInset.top = -35
        UITableView.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
    }
    
    var body: some View {
        VStack {
            Text("Create New Account")
                .bold()
                .foregroundColor(Color("MainColor"))
            
            Form {
                Section (header:
                            Text("Full Name:")
                            .bold()
                            .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "Full Name",
                        text: $name
                    )
                        .keyboardType(.alphabet)
                }
                
                Section (header:
                            Text("Username:")
                            .bold()
                            .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "Username",
                        text: $username
                    )
                    .keyboardType(.default)
                }
            
                Section (header:
                            Text("Email:")
                            .bold()
                            .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "Email",
                        text: $email
                    )
                    .keyboardType(.emailAddress)
                }

                Section {
                    Picker("Resident State:", selection: $residentState) {
                        ForEach(reference.residentStates, id: \.self) {
                            Text($0)
                            .bold()
                            .foregroundColor(Color("MainColor"))
                        }
                    }
                }
                
                Section (header:
                            Text("Password:")
                            .bold()
                            .foregroundColor(Color("MainColor"))
                ) {
                    SecureField(
                        "Password",
                        text: $password
                    )
                    .keyboardType(.default)
                }

                Section (header:
                            Text("Re-enter Passoword")
                            .bold()
                            .foregroundColor(Color("MainColor"))
                ) {
                    SecureField(
                        "Re-enter Password",
                        text: $passwordVerify
                    )
                    .keyboardType(.default)
                }

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
                    .multilineTextAlignment(.center)
                    .buttonStyle(.bordered)
                    .cornerRadius(10)
                    .background(Color("MainColor"))
                    .padding()
                    .listRowBackground(Color("BackgroundColor"))
                
//                Text(self.authViewModel.signUpStatusMessage)
//                    .foregroundColor(.red)
//                    .bold()
//                    .lineLimit(nil)
//                    .background(Color("BackgroundColor"))
                }
            
//                Section {
//
//                }
//                .frame(maxWidth: .infinity)
//                .listRowBackground(Color("BackgroundColor"))
        }
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
