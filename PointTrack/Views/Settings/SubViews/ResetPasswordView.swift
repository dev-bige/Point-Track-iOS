//
//  ResetPasswordView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/20/22.
//

import SwiftUI

struct ResetPasswordView: View {
    
    var body: some View {
        VStack {
            Text("Would you like to send a password reset email?")
            
            Button {
            } label: {
                Text("Send")
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
