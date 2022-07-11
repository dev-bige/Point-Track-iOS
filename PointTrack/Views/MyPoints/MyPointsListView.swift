//
//  MyPointsListView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/22/22.
//

import SwiftUI

struct SpeciesItem: Identifiable {
    let id = UUID()
    let speciesType: String
    let collectionPath: String
}

struct MyPointsListView: View {
    
    private let speciesList: [SpeciesItem] = [
        SpeciesItem(speciesType: "Antelope", collectionPath: "antelope"),
        SpeciesItem(speciesType: "Black Bear", collectionPath: "black_bear"),
        SpeciesItem(speciesType: "Bighorn Sheep", collectionPath: "bighorn_sheep"),
        SpeciesItem(speciesType: "Bison", collectionPath: "bison"),
        SpeciesItem(speciesType: "Elk", collectionPath: "elk"),
        SpeciesItem(speciesType: "Deer", collectionPath: "deer"),
        SpeciesItem(speciesType: "Moose", collectionPath: "moose"),
        SpeciesItem(speciesType: "Mountain Goat", collectionPath: "mountain_goat")
    ]
    
    var body: some View {
            VStack() {
                List(speciesList) { speciesItem in
                    NavigationLink(destination: MyPointsView(speciesType: speciesItem.speciesType, collectionPath: speciesItem.collectionPath)) {
                        Text(speciesItem.speciesType)
                        .foregroundColor(.white)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    }
                    .buttonStyle(.bordered)
                    .background(Color("MainColor"))
                    .cornerRadius(10)
                    .padding()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color("BackgroundColor"))
                }
                .listStyle(PlainListStyle())
                .background(Color("BackgroundColor"))
                .padding()
            }
            .background(Color("BackgroundColor"))
            .navigationBarHidden(true)
    }
}

struct MyPointsListView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsListView()
    }
}
