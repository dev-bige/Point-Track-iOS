//
//  MyPointsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/5/22.
//

import SwiftUI

struct AddPointsView: View {
    @Binding var speciesType: String
    
    @State private var points = ""
    @State private var state = ""
    
    init (speciesType: Binding<String>) {
        UITableView.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
        self._speciesType = speciesType
    }
        
    var body: some View {
        VStack {
            Text("Add \(speciesType) Points?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
                .padding()
            
            Form {
                Section(header:
                            Text("State:")
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "State",
                        text: $state
                    )
                    .keyboardType(.decimalPad)
                }
                
                Section(header:
                            Text("Points:")
                                .fontWeight(.bold)
                                .foregroundColor(Color("MainColor"))
                ) {
                    TextField(
                        "Points",
                        text: $points
                    )
                    .keyboardType(.decimalPad)
                }
            }
            .padding()
        }
        .background(Color("BackgroundColor"))
    }
}

struct MyPointsView: View {
    @State var speciesType: String
    @State private var showingAddingPointsPopover = false

    var body: some View {
        NavigationView {
            VStack {
                Text("No points, press the \"+\" to add your points")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
        }
        .navigationTitle("\(speciesType) Points")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
        .toolbar {
            Button(action: {
                showingAddingPointsPopover = true
            }) {
                Image(systemName: "plus")
            }
            .popover(isPresented: $showingAddingPointsPopover) {
                AddPointsView(speciesType: $speciesType)
            }
        }
    }
}

struct MyPointsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsView(speciesType: String())
    }
}
