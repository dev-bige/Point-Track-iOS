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
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Color("MainColor"))
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
        VStack {
            
            NavigationLink(destination: MyPointsView(speciesType: "antelope")) {
                ButtonView(buttonText: "Antelope")
            }
            
            NavigationLink(destination: MyPointsView(speciesType: "black_bear")) {
                ButtonView(buttonText: "Black Bear")
            }
            
            NavigationLink(destination: MyPointsView(speciesType: "bighorn_sheep")) {
                ButtonView(buttonText: "Bighorn Sheep")
            }
            
            NavigationLink(destination: MyPointsView(speciesType: "bison")) {
                ButtonView(buttonText: "Bison")
            }
            
            NavigationLink(destination: MyPointsView(speciesType: "elk")) {
                ButtonView(buttonText: "Elk")
            }
            
            NavigationLink(destination: MyPointsView(speciesType: "Deer")) {
                ButtonView(buttonText: "Deer")
            }
            
            NavigationLink(destination: MyPointsView(speciesType: "Moose")) {
                ButtonView(buttonText: "Moose")
            }
            
            NavigationLink(destination: MyPointsView(speciesType: "Mountain Goat")) {
                ButtonView(buttonText: "Mountain Goat")
            }
        }
        .navigationTitle("My Points")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
        }
    }
}

struct MyPointsListView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsListView()
    }
}
