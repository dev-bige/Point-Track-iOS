//
//  DeadlineReminderViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 7/1/22.
//

import Foundation
import Firebase
import FirebaseFirestore

class DeadlineReminderViewModel: ObservableObject {
    
    @Published var userDeadlineReminders = [DeadlineReminder]()
    
    @Published var addDeadlineReminderStatusMessage = ""
    
    func getAllDeadlineReminders() {
        self.userDeadlineReminders.removeAll()
        
        let currentTimestamp = Timestamp(seconds: Int64(Date().timeIntervalSince1970), nanoseconds: 0)
        
        var userDeadlineReminderTemp = [DeadlineReminder]()
        
        FirebaseManager.shared.firestore
            .collection("user_deadline_reminders")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .getDocument() { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    
                    if let array = data?["userReminders"] as? [[String: Any]] {
                        for aValue in array {
                            let notificationTime = aValue["notificationTime"] as? Timestamp ?? Timestamp(date: Date())
                            let reminderTitle = aValue["reminderTitle"] as? String ?? "error"
                            let requestCode = aValue["requestCode"] as? Int ?? 0
                            
                            let userReminder = DeadlineReminder(notificationTime: notificationTime, reminderTitle: reminderTitle, requestCode: requestCode)
                            
                            userDeadlineReminderTemp.append(userReminder)
                        }
                    }
                    
                    else {
                        print("No deadline reminders found")
                    }
                    
                    self.userDeadlineReminders = userDeadlineReminderTemp
                }
            }
    }
    
    func addNewDeadline(deadlineReminder: DeadlineReminder) {
        self.addDeadlineReminderStatusMessage = ""

        let deadlineReminderData = [
            "notificationTime": deadlineReminder.notificationTime,
            "reminderTitle": deadlineReminder.reminderTitle,
            "requestCode": deadlineReminder.requestCode
        ] as [String : Any]
        
        let docRef = FirebaseManager.shared.firestore
            .collection("user_deadline_reminders")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
        
        docRef.getDocument { (document, err) in
            if let document = document, document.exists {
                docRef.updateData(["userReminders" :
                                    FieldValue.arrayUnion([deadlineReminderData])
                ])
            } else {
                let newData = [
                    "userReminders": [deadlineReminderData]
                ]
                docRef.setData(newData)
            }
        }
        
        self.addDeadlineReminderStatusMessage = "Reminder set!"
    }
    
    func deleteDeadlineReminder(deadlineReminder: DeadlineReminder) {
        
        let deadlineReminderData = [
            "notificationTime": deadlineReminder.notificationTime,
            "reminderTitle": deadlineReminder.reminderTitle,
            "requestCode": deadlineReminder.requestCode
        ] as [String : Any]
        
        let docRef = FirebaseManager.shared.firestore
            .collection("user_deadline_reminders")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
        
        docRef.getDocument { (document, err) in
            if let document = document, document.exists {
                docRef.updateData(["userReminders" : FieldValue.arrayRemove([deadlineReminderData])])
            } else {
                print("Error deleting user deadline reminder")
            }
        }
    }
}
