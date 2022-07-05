//
//  ResetPasswordView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/20/22.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @State private var email: String = ""
    
    @ObservedObject private var authViewModel = AuthViewModel()

    var body: some View {
        VStack {
            Text("Would you like to send a password reset email?")
                .multilineTextAlignment(.center)
                .padding()
            
            Button {
            } label: {
                Text("Send Reset Email")
                    .foregroundColor(Color.white)
                    .onTapGesture {
                        self.authViewModel.sendPasswordResetEmail(email: email)
                    }
            }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
