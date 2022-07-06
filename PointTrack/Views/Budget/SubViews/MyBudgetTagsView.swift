//
//  MyBudgetTagsView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/8/22.
//

import SwiftUI

struct MyBudgetTagsRow: View {
    
    @State var userTag: Tag
    
    var body: some View {
        VStack {
            Text(userTag.state)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .padding(.top)
            HStack {
                Text(userTag.species)
                    .foregroundColor(Color.white)
                    .padding(.leading)
                    .lineLimit(nil)
                Spacer()
                Text("$" + userTag.cost.formatted())
                    .foregroundColor(Color.white)
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

struct MyBudgetTagsView: View {
    
    @StateObject var budgetTagsViewModel = BudgetTagsViewModel()
    
    var body: some View {
            VStack {
                Text("Total Tag Cost: $" + budgetTagsViewModel.totalTagCost.formatted())
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                    .padding()
                
                NavigationLink(destination: AddTagView()) {
                    Text("Add Tag")
                         .foregroundColor(.white)
                         .bold()
                         .frame(width: 275.0, height: 30.0)
                }
                .buttonStyle(.bordered)
                .background(Color("MainColor"))
                .cornerRadius(10)
                .padding()
                
                Text("My Tags")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                
                List {
                    ForEach (budgetTagsViewModel.userTags) { userTag in
                        MyBudgetTagsRow(userTag: userTag)
                    }
                    .onDelete(perform: delete)
                }
                .lineLimit(nil)
                .background(Color("BackgroundColor"))
                .listStyle(PlainListStyle())
                .padding()
            }
            .onAppear {
                self.budgetTagsViewModel.getUserTags()
            }
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
    }
    
    func delete(at offsets: IndexSet) {
        let indexToDelete = offsets[offsets.startIndex]
        
        budgetTagsViewModel.deleteTag(tagToDelete: budgetTagsViewModel.userTags[indexToDelete])
        
        budgetTagsViewModel.userTags.remove(atOffsets: offsets)
    }
}

struct MyBudgetTagsView_Previews: PreviewProvider {
    static var previews: some View {
        MyBudgetTagsView()
    }
}
