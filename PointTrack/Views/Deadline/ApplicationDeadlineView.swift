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
                Text(applicationDeadline.species)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color.white)
                Text(applicationDeadline.deadlineDate)
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
    var body: some View {
        let applicationDeadlines = [
                ApplicationDeadline(
                    title: "Colorado", species: "Elk", deadlineDate: "4-08-22"),
                ApplicationDeadline(
                    title: "Utah", species: "Deer", deadlineDate: "4-08-22"),
                ApplicationDeadline(
                    title: "Arizona", species: "Elk, Sheep", deadlineDate: "4-08-22")
            ]

        NavigationView {
            VStack {
                Text("Upcoming Deadlines")
                List(applicationDeadlines) { applicationDeadline in
                    ApplicationDeadlineRow(applicationDeadline: applicationDeadline)
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
