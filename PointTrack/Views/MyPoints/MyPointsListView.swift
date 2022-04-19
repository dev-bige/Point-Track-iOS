//
//  MyPointsListView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/22/22.
//

import SwiftUI

class SpeciesType: ObservableObject {
    @Published var speciesType = ""
}

struct MyPointsListView: View {
    
    @StateObject var speciesTypeObj = SpeciesType()
    
    var body: some View {
            VStack {
                
                NavigationLink(destination: MyPointsView(speciesType: "Antelope", collectionPath: "antelope")) {
                   ButtonView(buttonText: "Antelope")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)

                NavigationLink(destination: MyPointsView(speciesType: "Black Bear", collectionPath: "black_bear")) {
                    ButtonView(buttonText: "Black Bear")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)

                NavigationLink(destination: MyPointsView(speciesType: "Bighorn Sheep", collectionPath: "bighorn_sheep")) {
                    ButtonView(buttonText: "Bighorn Sheep")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                
                NavigationLink(destination: MyPointsView(speciesType: "Bison", collectionPath: "bison")) {
                    ButtonView(buttonText: "Bison")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                
                NavigationLink(destination: MyPointsView(speciesType: "Elk", collectionPath: "elk")) {
                    ButtonView(buttonText: "Elk")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                
                NavigationLink(destination: MyPointsView(speciesType: "Deer", collectionPath: "deer")) {
                    ButtonView(buttonText: "Deer")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                
                NavigationLink(destination: MyPointsView(speciesType: "Moose", collectionPath: "moose")) {
                    ButtonView(buttonText: "Moose")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                
                NavigationLink(destination: MyPointsView(speciesType: "Mountain Goat", collectionPath: "mountain_goat")) {
                    ButtonView(buttonText: "Mountain Goat")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
            }
            .navigationTitle("My Points")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
    }
}

struct MyPointsListView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsListView()
    }
}
