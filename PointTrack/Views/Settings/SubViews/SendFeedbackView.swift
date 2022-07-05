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
                        text: $message
                    )
                    .keyboardType(.default)
                }
                
                Section {
                    Button {
                    } label: {
                        Text("Send Feedback")
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                let mailToString = "pointtracksupport@gmail.com?subject=" + self.subject + "&body=" + (self.message
                                    .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "error")
                                
                                let mailtoUrl = URL(string: mailToString)!
                                if UIApplication.shared.canOpenURL(mailtoUrl) {
                                        UIApplication.shared.open(mailtoUrl, options: [:])
                                }
                            }
                    }
                    .buttonStyle(.bordered)
                    .background(Color("MainColor"))
                    .cornerRadius(10)
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

struct SendFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        SendFeedbackView()
    }
}
