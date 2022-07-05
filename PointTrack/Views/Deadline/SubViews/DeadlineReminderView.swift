//
//  DeadlineReminderView.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/20/22.
//

import SwiftUI

struct DeadlineReminderRowView: View {
    
    @State var userDeadlineReminder: DeadlineReminder
        
    var body: some View {
        VStack {
            Text("Reminder set at " + Date(timeIntervalSince1970: Double(userDeadlineReminder.notificationTime.seconds)).formatted() + " for " + userDeadlineReminder.reminderTitle)
                .padding()
                .foregroundColor(Color(.white))
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("MainColor"))
            .listRowSeparator(.hidden)
            .listRowBackground(Color("BackgroundColor"))
            .cornerRadius(10)
    }
}

struct DeadlineReminderView: View {
    
    @StateObject private var deadlineReminderViewModel = DeadlineReminderViewModel()
    
    var body: some View {
        VStack {
            Text("Reminders")
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
                .font(.title)
                .padding(.bottom)
            
            Text(deadlineReminderViewModel.getDeadlineReminderStatusMessage)
                .foregroundColor(Color("MainColor"))
            
            List {
                ForEach (deadlineReminderViewModel.userDeadlineReminders) { userDeadlineReminder in
                    DeadlineReminderRowView(userDeadlineReminder: userDeadlineReminder)
                }
                .onDelete(perform: delete)
            }
            .lineLimit(nil)
            .background(Color("BackgroundColor"))
            .listStyle(PlainListStyle())
            .padding()
        }
        .onAppear() {
            self.deadlineReminderViewModel.getAllDeadlineReminders()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
    
    func delete(at offsets: IndexSet) {
        let indexToDelete = offsets[offsets.startIndex]
        
        deadlineReminderViewModel.deleteDeadlineReminder(deadlineReminder: deadlineReminderViewModel.userDeadlineReminders[indexToDelete])
        
        deadlineReminderViewModel.userDeadlineReminders.remove(atOffsets: offsets)
    }
}

struct DeadlineReminderView_Previews: PreviewProvider {
    static var previews: some View {
        DeadlineReminderView()
    }
}
