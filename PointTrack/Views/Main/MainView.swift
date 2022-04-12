//
//  MainView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/16/22.
//

import SwiftUI

struct NewsPostRow: View {
    var newsPost: NewsPost
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "newspaper")
            VStack(alignment: .trailing) {
                Text("\(newsPost.title)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                
                Text("At \(newsPost.website)")
                Text("By: \(newsPost.author)")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .listRowSeparator(.hidden)
        .cornerRadius(10)
    }
}

struct BodyView: View {
    
    let newsPosts = [
            NewsPost(
                title: "2022 Arizona Strategy", author: "GoHunt", link: "gohunt.com", date: "4-11-22", website: "gohunt", imageLink: "Point_Track_Secondary_Logo"
                )
        ]
    
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
                
                List(newsPosts) { newsPost in
                    NewsPostRow(newsPost: newsPost)
                }
                .background(Color("BackgroundColor"))
                .listStyle(PlainListStyle())
                .padding()
            
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
