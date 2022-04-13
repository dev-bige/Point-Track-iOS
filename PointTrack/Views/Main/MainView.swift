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
        Link(destination: URL(string: "\(newsPost.link)")!) {
            HStack(alignment: .center) {
                AsyncImage(
                    url: URL(string: "\(newsPost.imageLink)")
                )
                .frame(width: 10, height: 10)
                
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
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .listRowSeparator(.hidden)
        .listRowBackground(Color("BackgroundColor"))
        .cornerRadius(10)
    }
}

struct BodyView: View {
    
    @ObservedObject private var newsPostsViewModel = NewsPostViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Point_Track_Secondary_Logo")
                
                Text("News")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                
                List(newsPostsViewModel.newsPosts) { newsPost in
                    NewsPostRow(newsPost: newsPost)
                }
                .onAppear() {
                    self.newsPostsViewModel.getAllNewsPosts()
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
