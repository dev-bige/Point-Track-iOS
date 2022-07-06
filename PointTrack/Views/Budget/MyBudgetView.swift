//
//  MyBudgetView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/22/22.
//

import SwiftUI

struct MyBudgetView: View {
    
    @StateObject var budgetTagsViewModel = BudgetTagsViewModel()
    @StateObject var budgetApplicationsViewModel = BudgetApplicationsViewModel()
    
    var body: some View {
            VStack {
                Text("Applications")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                    .padding()
                
                NavigationLink(destination: MyBudgetApplicationsView()) {
                    Text("Show Applications")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                Text("Total Applying Cost: $" + budgetApplicationsViewModel.totalApplyingCost.formatted())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                Text("Tags")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                    .padding()
                
                NavigationLink(destination: MyBudgetTagsView()) {
                    Text("Show Tags")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                Text("Total Tag Cost: $" + budgetTagsViewModel.totalTagCost.formatted())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                Text("Total Cost")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                    .padding()
                
                Text("Total Cost: $" + (budgetTagsViewModel.totalTagCost + budgetApplicationsViewModel.totalApplyingCost).formatted())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)

                Text("Total Monthly Cost: $" + ((budgetTagsViewModel.totalTagCost + budgetApplicationsViewModel.totalApplyingCost) / 12).formatted())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
            }
            .onAppear {
                self.budgetTagsViewModel.getUserTags()
                self.budgetApplicationsViewModel.getUserApplications()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
    }
}

struct MyBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        MyBudgetView()
    }
}
