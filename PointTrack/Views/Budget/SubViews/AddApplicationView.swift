//
//  AddApplicationView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/20/22.
//

import SwiftUI

struct AddApplicationView: View {
    
    @ObservedObject var budgetApplicationsViewModel = BudgetApplicationsViewModel()
    
    @State var stateOptions = [String]()
    @State var speciesOptions = [String]()
    
    @State var stateOptionsPopulated: Bool = false
    
    @State private var selectedState = ""
    @State private var selectedSpecies = [String]()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
    }
    
    var body: some View {
        VStack {
            Text("Add Application?")
                .font(.title)
                .bold()
                .foregroundColor(Color("MainColor"))
            
            Form {
                Section {
                    Picker("State", selection: $selectedState) {
                        ForEach(stateOptions, id: \.self) { state in
                            Text(state)
                                .foregroundColor(Color("MainColor"))
                                .bold()
                        }
                    }
                }
                
                Section {
                    Picker("Species", selection: $selectedSpecies) {
                        ForEach(speciesOptions, id: \.self) { species in
                            Text(species)
                                .foregroundColor(Color("MainColor"))
                                .bold()
                        }
                    }
                    .onChange(of: !selectedState.isEmpty) { state in
                        budgetApplicationsViewModel.getSpeciesForApplications(state: selectedState) { species in
                            self.speciesOptions = species
                        }
                    }
                }
                
                Section {
                    Button {
                    } label: {
                            Text("Add")
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    budgetApplicationsViewModel.addApplication(state: selectedState, species: selectedSpecies)
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
                    Text(budgetApplicationsViewModel.addApplicationStatusMessage)
                        .foregroundColor(Color("MainColor"))
                        .bold()
                        .lineLimit(nil)
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .listRowBackground(Color("BackgroundColor"))
            }
        }
        .onAppear() {
            budgetApplicationsViewModel.getStateForApplications() { states in
                self.stateOptions = states
                self.stateOptionsPopulated = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct AddApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        AddApplicationView()
    }
}
