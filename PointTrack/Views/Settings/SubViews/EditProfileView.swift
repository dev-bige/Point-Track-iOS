//
//  EditProfileView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/20/22.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var name = ""
    @State private var username = ""
    @State private var email = ""
    @State private var residentState = ""
    
    @ObservedObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            Form {
                Section(header:
                            Text("Edit Name:")
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "Enter your new name",
                        text: $name
                    )
                    .keyboardType(.default)
                }
                
                Section(header:
                            Text("Edit Username:")
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "Enter your new username",
                        text: $username
                    )
                    .keyboardType(.default)
                }
                
                Section(header:
                            Text("Edit Email:")
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "Enter your new email",
                        text: $email
                    )
                    .keyboardType(.emailAddress)
                }
                
                Section(header:
                            Text("Edit Resident State:")
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "Enter your new resident state",
                        text: $residentState
                    )
                    .keyboardType(.default)
                }
                
                Section {
                    Button {
                    } label: {
                            Text("Update")
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    authViewModel.updateProfile()
                                }
                    }
                        .buttonStyle(.bordered)
                        .cornerRadius(10)
                        .background(Color("MainColor"))
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .listRowBackground(Color("BackgroundColor"))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
