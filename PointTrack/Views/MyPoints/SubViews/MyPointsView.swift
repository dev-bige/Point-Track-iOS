//
//  MyPointsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/5/22.
//

import SwiftUI

struct EditPointsView: View {
    
    @Binding var userPoints: UserPoints
    @Binding var speciesType: String
    @Binding var collectionPath: String
    
    @EnvironmentObject var myPointsViewModel: MyPointsViewModel
    
    init (speciesType: Binding<String>, collectionPath: Binding<String>, userPoints: Binding<UserPoints>) {
        UITableView.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
        self._speciesType = speciesType
        self._collectionPath = collectionPath
        self._userPoints = userPoints
    }
    
    var body: some View {
        Text("Edit \(speciesType) Points for \(userPoints.state)?")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color("MainColor"))
            .padding()
        
        Form {
            Section(header:
                        Text("Points:")
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
            ) {
                TextField(
                    "Points",
                    text: $userPoints.points
                )
                .keyboardType(.decimalPad)
            }
            
            Section {
                HStack {
                    Button {
                    } label: {
                            Text("Delete")
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    myPointsViewModel.deleteUserPoints(species: collectionPath, points: userPoints)
                                }
                    }
                        .buttonStyle(.bordered)
                        .cornerRadius(10)
                        .background(.red)
                        .padding()
                    Spacer()
                    Button {
                    } label: {
                            Text("Update")
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    myPointsViewModel.updateUserPoints(species: collectionPath, points: userPoints)
                                }
                    }
                        .buttonStyle(.bordered)
                        .cornerRadius(10)
                        .background(Color("MainColor"))
                        .padding()
                }
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .listRowBackground(Color("BackgroundColor"))
            
            Section {
                if (self.myPointsViewModel.updatePointsError) {
                    Text(self.myPointsViewModel.updatePointsStatusMessage)
                        .bold()
                        .foregroundColor(.red)
                        .lineLimit(nil)
                } else {
                    Text(self.myPointsViewModel.updatePointsStatusMessage)
                        .bold()
                        .foregroundColor(Color("MainColor"))
                        .lineLimit(nil)
                }
                
                if (self.myPointsViewModel.deletePointsError) {
                    Text(self.myPointsViewModel.deletePointsStatusMessage)
                        .bold()
                        .foregroundColor(.red)
                        .lineLimit(nil)
                }
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .listRowBackground(Color("BackgroundColor"))
        }
        .background(Color("BackgroundColor"))
    }
}

struct MyPointsRow: View {
    @State private var showingAddingPointsPopover = false

    @State var userPoint: UserPoints
    @State var speciesType: String
    @State var collectionPath: String
    
    @EnvironmentObject var myPointsViewModel: MyPointsViewModel

    var body: some View {
        
        Button(action: {
            showingAddingPointsPopover = true
        }) {
            HStack {
                Text(userPoint.state)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer()
                Text(userPoint.points)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
        .popover(isPresented: $showingAddingPointsPopover) {
            EditPointsView(speciesType: $speciesType, collectionPath: $collectionPath, userPoints: $userPoint).environmentObject(myPointsViewModel)
        }
        .padding()
        .background(Color("MainColor"))
        .listRowSeparator(.hidden)
        .listRowBackground(Color("BackgroundColor"))
        .cornerRadius(10)
    }
}

struct MyPointsView: View {
    @State var speciesType: String
    @State var collectionPath: String
    
    @ObservedObject private var myPointsViewModel = MyPointsViewModel()

    var body: some View {
            VStack {
                if myPointsViewModel.userPoints.isEmpty {
                    Text("No points, press the \"+\" to add your points")
                } else {
                    List(myPointsViewModel.userPoints) { userPoints in
                        MyPointsRow(userPoint: userPoints, speciesType: speciesType, collectionPath: collectionPath).environmentObject(myPointsViewModel)
                    }
                        .background(Color("BackgroundColor"))
                        .listStyle(PlainListStyle())
                        .padding(.bottom)
                }
            }
            .padding(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
            .navigationTitle("\(speciesType) Points")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
            .toolbar {
                NavigationLink(destination: AddPointsView(speciesType: $speciesType, collectionPath: $collectionPath).environmentObject(myPointsViewModel)) {
                    Image(systemName: "plus")
                }
            }
            .onAppear() {
                self.myPointsViewModel.getUserPoints(species: collectionPath)
            }
    }
}

struct MyPointsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsView(speciesType: String(), collectionPath: String())
    }
}
