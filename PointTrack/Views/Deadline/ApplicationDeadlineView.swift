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
                    .foregroundColor(Color.white)
                    .padding(.trailing)
                    .lineLimit(nil)
                Spacer()
                Text(applicationDeadline.applicationPeriod)
                    .foregroundColor(Color.white)
                    .padding(.leading)
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
            VStack {
                Text("Upcoming Deadlines")
                List(applicationDeadlineViewModel.applicationDeadlines) { applicationDeadline in
                    ApplicationDeadlineRow(applicationDeadline: applicationDeadline)
                }
                .onAppear() {
                    applicationDeadlineViewModel.getAllDeadlines()
                }
                .lineLimit(nil)
                .background(Color("BackgroundColor"))
                .listStyle(PlainListStyle())
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
    }
}

struct ApplicationDeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationDeadlineView()
    }
}
