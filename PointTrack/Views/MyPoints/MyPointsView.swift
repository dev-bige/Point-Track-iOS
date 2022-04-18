//
//  MyPointsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/5/22.
//

import SwiftUI

struct AddPointsView: View {
    @Binding var speciesType: String
    @EnvironmentObject var myPointsViewModel: MyPointsViewModel
    
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
            
            Button {
            } label: {
                    Text("Add")
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            myPointsViewModel.addUserPoints(species: speciesType, points: UserPoints(state: state, points: points))
                        }
            }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
        }
        .background(Color("BackgroundColor"))
    }
}

struct MyPointsRow: View {
    var userPoint: UserPoints
    
    var body: some View {
        HStack {
            Text(userPoint.state)
            Text(userPoint.points)
        }
    }
}

struct MyPointsView: View {
    @State var speciesType: String
    @State private var showingAddingPointsPopover = false
    
    @ObservedObject private var myPointsViewModel = MyPointsViewModel()

    var body: some View {
            VStack {
                if myPointsViewModel.userPoints.isEmpty {
                    Text("No points, press the \"+\" to add your points")
                } else {
                    List(myPointsViewModel.userPoints) { userPoints in
                        MyPointsRow(userPoint: userPoints)
                    }
                    .onAppear() {
                        self.myPointsViewModel.getUserPoints(species: speciesType)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
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
                        .environmentObject(myPointsViewModel)
                }
            }
    }
}

struct MyPointsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsView(speciesType: String())
    }
}
