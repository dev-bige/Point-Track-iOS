//
//  MyPointsListView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/22/22.
//

import SwiftUI

struct MyPointsListView: View {
    
    var body: some View {
            VStack {
                NavigationLink(destination: MyPointsView(speciesType: "Antelope", collectionPath: "antelope")) {
                    Text("Antelope")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()

                NavigationLink(destination: MyPointsView(speciesType: "Black Bear", collectionPath: "black_bear")) {
                    Text("Black Bear")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()

                NavigationLink(destination: MyPointsView(speciesType: "Bighorn Sheep", collectionPath: "bighorn_sheep")) {
                    Text("Bighorn Sheep")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: MyPointsView(speciesType: "Bison", collectionPath: "bison")) {
                    Text("Bison")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: MyPointsView(speciesType: "Elk", collectionPath: "elk")) {
                    Text("Elk")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: MyPointsView(speciesType: "Deer", collectionPath: "deer")) {
                    Text("Deer")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: MyPointsView(speciesType: "Moose", collectionPath: "moose")) {
                    Text("Moose")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                NavigationLink(destination: MyPointsView(speciesType: "Mountain Goat", collectionPath: "mountain_goat")) {
                    Text("Mountain Goat")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
    }
}

struct MyPointsListView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsListView()
    }
}
