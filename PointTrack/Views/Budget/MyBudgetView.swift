//
//  MyBudgetView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/22/22.
//

import SwiftUI

struct MyBudgetView: View {
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
                
                Text("Total Applying Cost: $0")
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
                
                Text("Total Tag Cost: $0")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                
                Text("Total Cost")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MainColor"))
                    .padding()
                
                Text("Total Cost: $0")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)

                Text("Total Monthly Cost: $0")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
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
