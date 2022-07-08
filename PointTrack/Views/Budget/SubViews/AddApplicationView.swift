//
//  AddApplicationView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/20/22.
//

import SwiftUI

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}

struct AddApplicationView: View {
    
    @ObservedObject var budgetApplicationsViewModel = BudgetApplicationsViewModel()
    
    @EnvironmentObject var selections: ApplicationMultPicker
    
    @State var stateOptions = [String]()
    @State var speciesOptions = [String]()
    
    @State var stateOptionsPopulated: Bool = false
    
    @State private var selectedState = ""
    @State private var selectedSpecies : Set<String> = [""]
    
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
                    MultiSelector(
                         label: Text("Species"),
                         options: speciesOptions,
                         optionToString: { $0 },
                         selected: $selectedSpecies
                     )
                    .onChange(of: !selectedState.isEmpty) { state in
                        budgetApplicationsViewModel.getSpeciesForApplications(state: selectedState) { species in
                            self.selectedSpecies.removeAll()
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
