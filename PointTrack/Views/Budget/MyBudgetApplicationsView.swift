//
//  MyBudgetApplicationsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/8/22.
//

import SwiftUI

struct MyBudgetApplicationsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Total Applying Cost: $0")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                    .padding()
                
                NavigationLink(destination: MyBudgetView()) {
                   ButtonView(buttonText: "Add Application")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
            }
            .navigationTitle("My Applications")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
        }
    }
}

struct MyBudgetApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        MyBudgetApplicationsView()
    }
}
