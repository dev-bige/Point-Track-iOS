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
                AsyncImage(url: URL(string: "\(newsPost.imageLink)")) { phase in
                    switch phase {
                    case .empty:
                        Color.white.opacity(0.1)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                    case .failure(_):
                        Color.white.opacity(0.1)
                    @unknown default:
                        Color.white.opacity(0.1)
                    }
                }
                
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

struct MainView: View {
    
    @ObservedObject private var newsPostsViewModel = NewsPostViewModel()
    
    var body: some View {
        TabView {
            VStack {
                Image("Point_Track_Secondary_Logo")
                    .padding()
                
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
            
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
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
