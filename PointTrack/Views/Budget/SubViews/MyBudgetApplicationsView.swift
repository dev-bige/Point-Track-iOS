//
//  MyBudgetApplicationsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/8/22.
//

import SwiftUI

struct MyApplicationRow: View {
    
    var body: some View {
        VStack {
            HStack {
            
            }
        }
    }
}

struct MyBudgetApplicationsView: View {
    
    
    
    var body: some View {
            VStack {
                Text("Total Applying Cost: $0")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                    .padding()
                
                NavigationLink(destination: AddApplicationView()) {
                    Text("Add Application")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                List(myPointsViewModel.userPoints) { userPoints in
                    MyPointsRow(userPoint: userPoints, speciesType: speciesType, collectionPath: collectionPath).environmentObject(myPointsViewModel)
                }
                    .background(Color("BackgroundColor"))
                    .listStyle(PlainListStyle())
                    .padding(.bottom)
            }
            .navigationTitle("My Applications")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
    }
}

struct MyBudgetApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        MyBudgetApplicationsView()
    }
}
