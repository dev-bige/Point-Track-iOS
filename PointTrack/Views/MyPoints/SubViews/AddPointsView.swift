//
//  AddPointsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/19/22.
//

import SwiftUI

struct AddPointsView: View {
    @Binding var speciesType: String
    @Binding var collectionPath: String
    
    @EnvironmentObject var myPointsViewModel: MyPointsViewModel
    
    @State private var points = ""
    @State private var state = ""
    
    private var reference = Reference()
    
    let states = ["Iowa", "Minnesota", "Colorado"]
    
    init (speciesType: Binding<String>, collectionPath: Binding<String>) {
        UITableView.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
        self._speciesType = speciesType
        self._collectionPath = collectionPath
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
                    Picker("State:", selection: $state) {
                        ForEach(reference.getSpeciesStates(species: collectionPath), id: \.self) {
                            Text($0)
                        }
                    }
//                    TextField(
//                        "State",
//                        text: $state
//                    )
//                    .keyboardType(.default)
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
                
                Section {
                    Button {
                    } label: {
                            Text("Add")
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    myPointsViewModel.addUserPoints(species: collectionPath, points: UserPoints(state: state, points: points))
                                }
                    }
                        .buttonStyle(.bordered)
                        .cornerRadius(10)
                        .background(Color("MainColor"))
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .listRowBackground(Color("BackgroundColor"))
                
                Section {
                    if (self.myPointsViewModel.addPointsError) {
                        Text(self.myPointsViewModel.addPointStatusMessage)
                            .bold()
                            .foregroundColor(.red)
                            .lineLimit(nil)
                    } else {
                        Text(self.myPointsViewModel.addPointStatusMessage)
                            .bold()
                            .foregroundColor(Color("MainColor"))
                            .lineLimit(nil)
                    }
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .listRowBackground(Color("BackgroundColor"))
            }
            
        }
        .background(Color("BackgroundColor"))
    }
}

//struct AddPointsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPointsView(speciesType: Binding<String>, collectionPath: Binding<String>)
//    }
//}
