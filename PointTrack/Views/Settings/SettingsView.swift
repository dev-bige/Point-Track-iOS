//
//  SettingsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/22/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: MyBudgetApplicationsView()) {
                   ButtonView(buttonText: "Edit Profile")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                .buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: MyBudgetApplicationsView()) {
                   ButtonView(buttonText: "Reset Password")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: MyBudgetApplicationsView()) {
                   ButtonView(buttonText: "Send Feedback")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: MyBudgetApplicationsView()) {
                   ButtonView(buttonText: "Logout")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
