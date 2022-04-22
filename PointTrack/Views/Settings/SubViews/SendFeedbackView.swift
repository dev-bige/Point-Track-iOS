//
//  SendFeedbackView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/20/22.
//

import SwiftUI

struct SendFeedbackView: View {
    
    @State private var subject = ""
    @State private var message = ""
    
    var body: some View {
        VStack {
            Text("Send Feedback")
            Form {
                Section(header:
                            Text("Subject:")
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "Enter message subject",
                        text: $subject
                    )
                    .keyboardType(.default)
                }
                
                Section(header:
                            Text("Message:")
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "Enter message",
                        text: $subject
                    )
                    .keyboardType(.default)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct SendFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        SendFeedbackView()
    }
}
