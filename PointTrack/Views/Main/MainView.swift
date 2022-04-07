//
//  MainView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/16/22.
//

import SwiftUI

struct BodyView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("Point_Track_Secondary_Logo")
                    .padding(.bottom, 100.0)
                    .ignoresSafeArea(edges: .top)
                
//                NavigationLink(destination: MyPointsListView()) {
//                    ButtonView(buttonText: "My Points")
//                }
//
//                NavigationLink(destination: ApplicationDeadlineView()) {
//                    ButtonView(buttonText: "Application Deadline")
//                }
//
//                NavigationLink(destination: MyBudgetView()) {
//                    ButtonView(buttonText: "My Budget")
//                }
                
                Text("News")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
            
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
        }
    }
}

struct MainView: View {
    
    var body: some View {
        TabView {
            BodyView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            MyPointsListView()
                .tabItem {
                    Image(systemName: "point.topleft.down.curvedto.point.bottomright.up.fill")
                    Text("My Points")
                }
            
            ApplicationDeadlineView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Deadlines")
                }
            
            MyBudgetView()
                .tabItem {
                    Image(systemName: "dollarsign.square")
                    Text("Budget")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(Color("MainColor"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
