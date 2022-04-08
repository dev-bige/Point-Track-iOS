//
//  MyBudgetTagsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/8/22.
//

import SwiftUI

struct MyBudgetTagsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Total Tag Cost: $0")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                    .padding()
                
                NavigationLink(destination: MyBudgetView()) {
                   ButtonView(buttonText: "Add Tags")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
            }
            .navigationTitle("My Tags")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
        }
    }
}

struct MyBudgetTagsView_Previews: PreviewProvider {
    static var previews: some View {
        MyBudgetTagsView()
    }
}
