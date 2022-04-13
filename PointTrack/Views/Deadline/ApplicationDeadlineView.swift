//
//  ApplicationDeadlineView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/22/22.
//

import SwiftUI

struct ApplicationDeadlineRow: View {
    var applicationDeadline: ApplicationDeadline

    var body: some View {
        VStack(alignment: .center) {
            Text(applicationDeadline.title)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .padding(.top)
            HStack {
                Text(applicationDeadline.details)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color.white)
                Text(applicationDeadline.applicationPeriod)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color.white)
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

struct ApplicationDeadlineView: View {

    @ObservedObject private var applicationDeadlineViewModel = ApplicationDeadlineViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Upcoming Deadlines")
                List(applicationDeadlineViewModel.applicationDeadlines) { applicationDeadline in
                    ApplicationDeadlineRow(applicationDeadline: applicationDeadline)
                }
                .onAppear() {
                    applicationDeadlineViewModel.getAllDeadlines()
                }
                .background(Color("BackgroundColor"))
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Application Deadlines")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
        }
        .background(Color("BackgroundColor"))
    }
}

struct ApplicationDeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationDeadlineView()
    }
}
