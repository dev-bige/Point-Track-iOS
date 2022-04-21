//
//  MyBudgetTagsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/8/22.
//

import SwiftUI

struct MyBudgetTagsView: View {
    var body: some View {
            VStack {
                Text("Total Tag Cost: $0")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                    .padding()
                
                NavigationLink(destination: AddTagView()) {
                    Text("Add Tag")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
            }
            .navigationTitle("My Tags")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
    }
}

struct MyBudgetTagsView_Previews: PreviewProvider {
    static var previews: some View {
        MyBudgetTagsView()
    }
}
