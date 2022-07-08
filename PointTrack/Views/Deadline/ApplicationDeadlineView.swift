//
//  ApplicationDeadlineView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/22/22.
//

import SwiftUI
import Firebase

struct ApplicationDeadlineDetailsView: View {
    
    @ObservedObject private var deadlineReminderViewModel: DeadlineReminderViewModel
    
    @Binding var applicationDeadline: ApplicationDeadline
    @State var reminderTime = Date()
    
    init (applicationDeadline: Binding<ApplicationDeadline>) {
        self._applicationDeadline = applicationDeadline
        deadlineReminderViewModel = DeadlineReminderViewModel()
    }
    
    var body: some View {
        VStack() {
            Text(applicationDeadline.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
                .padding()
            
            Text("Apply for " + applicationDeadline.details + " during the period of " + applicationDeadline.applicationPeriod + ".")
                .lineLimit(nil)
                .padding()
            
            Link("Press here to apply for the tag", destination: URL(string: applicationDeadline.applicationLink)!)
                .padding()

            Text("Set Reminder")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
                .padding()
                        
            Text("Set the date and time you would like to be reminded to apply.")
            
            DatePicker("Select a Date", selection: $reminderTime)
                .labelsHidden()
                .background(Color(.white))
            
            Button {
            } label: {
                    Text("Set")
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            let deadlineReminderVar = DeadlineReminder(notificationTime: Timestamp(date: reminderTime), reminderTitle: applicationDeadline.title, requestCode: 1)
                            
                            deadlineReminderViewModel.addNewDeadline(deadlineReminder: deadlineReminderVar)
                            
                            scheduleLocal(userDeadlineReminder: deadlineReminderVar)
                        }
            }
                .buttonStyle(.bordered)
                .cornerRadius(10)
                .background(Color("MainColor"))
                .padding()
            
            Text(self.deadlineReminderViewModel.addDeadlineReminderStatusMessage)
                .foregroundColor(Color("MainColor"))
                .padding()
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
    }
    
    func scheduleLocal(userDeadlineReminder: DeadlineReminder) {
        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = userDeadlineReminder.reminderTitle
        content.body = "Apply for " + applicationDeadline.details + " during the period of " + applicationDeadline.applicationPeriod + "."
        content.categoryIdentifier = "alarm"
        content.sound = UNNotificationSound.default

        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: Date(timeIntervalSince1970: Double(userDeadlineReminder.notificationTime.seconds)))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
}

struct ApplicationDeadlineRow: View {
    @State var applicationDeadline: ApplicationDeadline

    var body: some View {
        NavigationLink(destination: ApplicationDeadlineDetailsView(applicationDeadline: $applicationDeadline)) {
            VStack(alignment: .center) {
                Text(applicationDeadline.title)
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding(.top)
                HStack {
                    Text(applicationDeadline.details)
                        .foregroundColor(Color.white)
                        .padding(.trailing)
                        .padding(.leading)
                        .lineLimit(nil)
                    Spacer()
                    Text(applicationDeadline.applicationPeriod)
                        .foregroundColor(Color.white)
                        .padding(.trailing)
                        .padding(.leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("MainColor"))
            .listRowSeparator(.hidden)
            .listRowBackground(Color("BackgroundColor"))
            .cornerRadius(10)
        }
}

struct ApplicationDeadlineView: View {

    @StateObject private var applicationDeadlineViewModel = ApplicationDeadlineViewModel()
    @State private var searchText = ""
    
//    @State var filterDeadlines: [ApplicationDeadline] {
//        get {
//            if searchText.isEmpty {
//                return applicationDeadlineViewModel.applicationDeadlines
//            } else {
//                return applicationDeadlineViewModel.applicationDeadlines.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
//            }
//        }
//    }
    
    init () {
        UINavigationBar.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
    }
    
    var searchResults: [ApplicationDeadline] {
        if searchText.isEmpty {
            return self.applicationDeadlineViewModel.applicationDeadlines
        } else {
            return self.applicationDeadlineViewModel.applicationDeadlines.filter { $0.title.contains(searchText) }
        }
    }
    
    var body: some View {


                
//                List(applicationDeadlineViewModel.applicationDeadlines) { applicationDeadline in
//                    ApplicationDeadlineRow(applicationDeadline: applicationDeadline)
//                }
//                .searchable(text: $searchText)
//                .lineLimit(nil)
//                .background(Color("BackgroundColor"))
//                .listStyle(PlainListStyle())
//                .padding()
        

        
                NavigationView {
                    VStack {
                        Text("Deadlines")
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
                            .font(.title)
                            .padding(.bottom)

                        NavigationLink(destination: DeadlineReminderView()) {
                            Text("View Deadline Reminders")
                                .fontWeight(.bold)
                                .foregroundColor(Color("MainColor"))
                                .font(.title2)
                        }

                        List(searchResults) { applicationDeadline in
                            ApplicationDeadlineRow(applicationDeadline: applicationDeadline)
                        }
                        .lineLimit(nil)
                        .background(Color("BackgroundColor"))
                        .listStyle(PlainListStyle())
                        .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("BackgroundColor"))
                }
                .onAppear() {
                    self.applicationDeadlineViewModel.getAllDeadlines()
                }
                .padding(.zero)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .searchable(text: $searchText, prompt: "Search Deadlines")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BackgroundColor"))
//            }
//            .onAppear() {
//                self.applicationDeadlineViewModel.getAllDeadlines() { applicationDeadlines in
//                    if searchText.isEmpty {
//                        self.filterDeadlines = applicationDeadlines
//                        print(filterDeadlines.count)
//                    } else {
//                        self.filterDeadlines = applicationDeadlines.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
//                    }
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color("BackgroundColor"))
    }
}

struct ApplicationDeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationDeadlineView()
    }
}
