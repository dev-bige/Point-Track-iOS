//
//  ForgotPasswordView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/13/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    
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
            
            Button(action: resetPassword) {
                Text("Reset Password")
                    .foregroundColor(Color.white)
            }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
    
    private func resetPassword() {
        
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
