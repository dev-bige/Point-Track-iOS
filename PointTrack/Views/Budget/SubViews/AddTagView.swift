//
//  AddTagView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/20/22.
//

import SwiftUI

struct AddTagView: View {
    
    @ObservedObject var budgetTagsViewModel = BudgetTagsViewModel()
    
    @State var stateOptions = [String]()
    @State var speciesOptions = [String]()
    
    @State var stateOptionsPopulated: Bool = false
    
    @State private var selectedState = ""
    @State private var selectedSpecies = ""
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
    }
    
    var body: some View {
        VStack {
            Text("Add Tag?")
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
                        budgetTagsViewModel.getSpeciesForTags(state: selectedState) { species in
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
                                    budgetTagsViewModel.addTag(state: selectedState, species: selectedSpecies)
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
                    Text(budgetTagsViewModel.addTagStatusMessage)
                        .foregroundColor(Color("MainColor"))
                        .bold()
                        .lineLimit(nil)
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .listRowBackground(Color("BackgroundColor"))
            }
        }
        .onAppear {
            budgetTagsViewModel.getStateForTags() { states in
                self.stateOptions = states
                self.stateOptionsPopulated = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
}

struct AddTagView_Previews: PreviewProvider {
    static var previews: some View {
        AddTagView()
    }
}
