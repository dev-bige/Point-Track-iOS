//
//  MainView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/16/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image("Point_Track_Secondary_Logo")                .ignoresSafeArea(edges: .top)
            Text("News")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
