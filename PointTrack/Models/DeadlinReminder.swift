//
//  DeadlinReminder.swift
//  PointTrack
//
//  Created by Ethan Evans on 7/1/22.
//

import Foundation
import Firebase

class DeadlineReminder: Identifiable {
    
    var notificationTime: Timestamp
    var reminderTitle: String
    var requestCode: Int
    
    init (notificationTime: Timestamp, reminderTitle: String, requestCode: Int) {
        self.notificationTime = notificationTime
        self.reminderTitle = reminderTitle
        self.requestCode = requestCode
    }

}
