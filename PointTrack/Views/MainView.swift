//
//  MainView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/16/22.
//

import SwiftUI

struct MainView: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Color("MainColor"))
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        VStack {
            Image("Point_Track_Secondary_Logo")                .ignoresSafeArea(edges: .top)
            
            Button {
            } label: {
                NavigationLink(destination: MyPointsListView()) {
                    Text("My Points")
                        .foregroundColor(Color.white)
                        .bold()
                        .background(Color("MainColor"))
                    }
                .background(Color("MainColor"))
            }
            .padding(.vertical)
                .frame(width: 300.0, height: 50.0)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
            
            Group {
                Button {
                } label: {
                    NavigationLink(destination: ApplicationDeadlineView()) {
                        Text("Application Deadlines")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
                    .frame(width: 300.0, height: 50.0)
                    .buttonStyle(.bordered)
                    .background(Color("MainColor"))
            }
            .padding(.top)
            
            Group {
                Button {
                } label: {
                    NavigationLink(destination: MyBudgetView()) {
                        Text("My Budget")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                    .padding(.vertical)
                }
                .padding()
                .frame(width: 300.0, height: 50.0)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
            }
            .padding(.top)
            
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
