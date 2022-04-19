//
//  ForgotPasswordView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/13/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    
    @ObservedObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            Text("Forgot Password?")
                .font(.title)
                .bold()
                .foregroundColor(Color("MainColor"))
                .padding()
            
            Text("Please enter your email and we will send you an email with instructions to reset your password")
                .foregroundColor(Color("MainColor"))
            
            TextField(
                "Email",
                text: $email
            )
                .textFieldStyle(.roundedBorder)
                .border(Color("MainColor"))
                .padding([.leading, .bottom, .trailing])
            
            Button {
            } label: {
                Text("Reset Password")
                    .foregroundColor(Color.white)
                    .onTapGesture {
                        self.authViewModel.sendPasswordResetEmail(email: email)
                    }
            }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
            
            Text(self.authViewModel.forgetPasswordStatusMessage)
                .foregroundColor(.red)
                .padding()
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
