//
//  MyProfileView.swift
//  PointTrack
//
//  Created by Ethan Evans on 7/4/22.
//

import SwiftUI

struct MyProfileView: View {
    
    @ObservedObject private var authViewModel = AuthViewModel()

    var body: some View {
        VStack {
            Text("My Profile")
                .font(.title)
                .bold()
                .foregroundColor(Color("MainColor"))
            
            Button {
            } label: {
                NavigationLink(destination: EditProfileView()) {
                    Text("Edit Profile")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 200.0, height: 30.0)
                }
            }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                .multilineTextAlignment(.center)
            
            Form {
                Section(header: Text("Name")) {
                    Text(self.authViewModel.currentUserObj.name)
                }
                
                Section(header: Text("Email")) {
                    Text(self.authViewModel.currentUserObj.email)
                }
                
                Section(header: Text("Username")) {
                    Text(self.authViewModel.currentUserObj.username)
                }
                
                Section(header: Text("Resident State")) {
                    Text(self.authViewModel.currentUserObj.residentState)
                }
            }
        }
        .onAppear {
            self.authViewModel.getCurrentUserObj()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
