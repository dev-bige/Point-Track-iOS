//
//  SettingsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/22/22.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject private var authViewModel = AuthViewModel()
    
    var body: some View {
            VStack {
                NavigationLink(destination: MyProfileView()) {
                   Text("My Profile")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: ResetPasswordView()) {
                    Text("Reset Password")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: SendFeedbackView()) {
                    Text("Send Feedback")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                    Text("Logout")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 275.0, height: 30.0)
                }
                .simultaneousGesture(TapGesture().onEnded({
                    self.authViewModel.signOut()
                }))
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
