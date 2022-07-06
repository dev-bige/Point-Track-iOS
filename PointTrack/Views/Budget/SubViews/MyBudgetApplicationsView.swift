//
//  MyBudgetApplicationsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/8/22.
//

import SwiftUI

struct MyBudgetApplicationRow: View {
    
    @State var userApplication: Application
    
    var body: some View {
        VStack {
            Text(userApplication.state)
                .foregroundColor(.white)
                .bold()
                .padding(.top)
            
            HStack {
                Text(userApplication.species.formatted())
                    .foregroundColor(.white)
                    .padding(.leading)
                    .lineLimit(nil)
                Spacer()
                Text("$" + userApplication.totalCost.formatted())
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .lineLimit(nil)
            }
            .padding(.bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("MainColor"))
        .listRowSeparator(.hidden)
        .listRowBackground(Color("BackgroundColor"))
        .cornerRadius(10)
    }
}

struct MyBudgetApplicationsView: View {
    
    @StateObject var budgetApplicationsViewModel = BudgetApplicationsViewModel()
    
    var body: some View {
            VStack {
                Text("Total Applying Cost: $" + budgetApplicationsViewModel.totalApplyingCost.formatted())
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
                
                Text("My Applications")
                    .font(.title3)
                    .bold()
                    .foregroundColor(Color("MainColor"))
                
                List {
                    ForEach (budgetApplicationsViewModel.userApplications) { userApplication in
                        MyBudgetApplicationRow(userApplication: userApplication)
                    }
                    .onDelete(perform: delete)
                }
                .lineLimit(nil)
                .background(Color("BackgroundColor"))
                .listStyle(PlainListStyle())
                .padding()
            }
            .onAppear {
                budgetApplicationsViewModel.getUserApplications()
            }
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
    }
    
    func delete(at offsets: IndexSet) {
        let indexToDelete = offsets[offsets.startIndex]
        
        budgetApplicationsViewModel.deleteApplication(applicationToDelete: budgetApplicationsViewModel.userApplications[indexToDelete])
        
        budgetApplicationsViewModel.userApplications.remove(atOffsets: offsets)
    }
}

struct MyBudgetApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        MyBudgetApplicationsView()
    }
}
