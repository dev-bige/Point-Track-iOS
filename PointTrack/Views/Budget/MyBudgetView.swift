//
//  MyBudgetView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/22/22.
//

import SwiftUI

struct MyBudgetView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, Budget!")
            }
            .navigationTitle("My Budget")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
        }
    }
}

struct MyBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        MyBudgetView()
    }
}
