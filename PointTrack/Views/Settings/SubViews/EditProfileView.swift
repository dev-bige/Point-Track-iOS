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
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
    }
    
    var body: some View {
        VStack {
            
            Text("Edit Profile")
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
                .font(.title)
                .padding()
            
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
                                    self.authViewModel.updateProfile(name: name, username: username, residentState: residentState)
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
                
                Section {
                    Text(self.authViewModel.updateProfileStatusMessage)
                        .foregroundColor(Color("MainColor"))
                        .bold()
                        .lineLimit(nil)
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
