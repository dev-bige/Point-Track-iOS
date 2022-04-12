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
    
//    init() {
//        UINavigationBar.appearance().backgroundColor = UIColor(Color("MainColor"))
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(destination: MyPointsView(speciesType: "Antelope")) {
                   ButtonView(buttonText: "Antelope")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)

                NavigationLink(destination: MyPointsView(speciesType: "Black Bear")) {
                    ButtonView(buttonText: "Black Bear")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)

                NavigationLink(destination: MyPointsView(speciesType: "Bighorn Sheep")) {
                    ButtonView(buttonText: "Bighorn Sheep")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                
                NavigationLink(destination: MyPointsView(speciesType: "Bison")) {
                    ButtonView(buttonText: "Bison")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                
                NavigationLink(destination: MyPointsView(speciesType: "Elk")) {
                    ButtonView(buttonText: "Elk")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                
                NavigationLink(destination: MyPointsView(speciesType: "Deer")) {
                    ButtonView(buttonText: "Deer")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                
                NavigationLink(destination: MyPointsView(speciesType: "Moose")) {
                    ButtonView(buttonText: "Moose")
                }
                .padding(.vertical)
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                
                NavigationLink(destination: MyPointsView(speciesType: "Mountain Goat")) {
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
}

struct MyPointsListView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsListView()
    }
}
