//
//  MainView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/16/22.
//

import SwiftUI

struct MainView: View {
    
//    init() {
//        UINavigationBar.appearance().backgroundColor = UIColor(Color("MainColor"))
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    var body: some View {
        VStack {
            Image("Point_Track_Secondary_Logo")
                .padding(.bottom, 100.0)
                .ignoresSafeArea(edges: .top)
            
            NavigationLink(destination: MyPointsListView()) {
                ButtonView(buttonText: "My Points")
            }
            
            NavigationLink(destination: ApplicationDeadlineView()) {
                ButtonView(buttonText: "Application Deadline")
            }
            
            NavigationLink(destination: MyBudgetView()) {
                ButtonView(buttonText: "My Budget")
            }
            
            Text("News")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
        
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
        .toolbar {
            NavigationLink(destination: SettingsView()) {
                Image("White_More_Icon")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
