//
//  MyPointsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/5/22.
//

import SwiftUI

struct EditPointsView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @StateObject var myPointsViewModel = MyPointsViewModel()
    
    @Binding var userPoints: UserPoints
    @Binding var species: String
    @Binding var collectionPath: String
    
    init (userPoints: Binding<UserPoints>, species: Binding<String>, collectionPath: Binding<String>) {
        self._userPoints = userPoints
        self._species = species
        self._collectionPath = collectionPath
    }
    
    var body: some View {
        VStack {
            Text("Update Points?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
                .padding()
            
            Text("Current points for " + species + " in " + userPoints.state + " are " + userPoints.points)
                .foregroundColor(Color("MainColor"))
                .lineLimit(nil)
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
                    Button {
                    } label: {
                        Text("Update")
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                myPointsViewModel.updateUserPoints(species: collectionPath, points: userPoints)
                                
                                if !myPointsViewModel.updatePointsError {
                                    self.presentation.wrappedValue.dismiss()
                                }
                            }
                    }
                    .buttonStyle(.bordered)
                    .cornerRadius(10)
                    .background(Color("MainColor"))
                    .padding()
                }
                .buttonStyle(.bordered)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .listRowBackground(Color("BackgroundColor"))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        NavigationLink(destination: EditPointsView(userPoints: $userPoint, species: $speciesType, collectionPath: $collectionPath)) {
            HStack {
                Text(userPoint.state)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer()
                Text(userPoint.points)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
                        .foregroundColor(Color("MainColor"))
                        .bold()
                } else {
                    List {
                        ForEach (myPointsViewModel.userPoints) { userPoints in
                            MyPointsRow(userPoint: userPoints, speciesType: speciesType, collectionPath: collectionPath).environmentObject(myPointsViewModel)
                        }
                        .onDelete(perform: delete)
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
    
    func delete(at offsets: IndexSet) {
        let indexToDelte = offsets[offsets.startIndex]
        
        let pointsToDelete = myPointsViewModel.userPoints[indexToDelte]
        
        myPointsViewModel.deleteUserPoints(species: speciesType, points: pointsToDelete)
        
        myPointsViewModel.userPoints.remove(atOffsets: offsets)
    }
}

struct MyPointsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPointsView(speciesType: String(), collectionPath: String())
    }
}
