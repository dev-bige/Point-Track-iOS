//
//  LocalNotificationManager.swift
//  PointTrack
//
//  Created by Ethan Evans on 7/3/22.
//

import Foundation
import NotificationCenter

class LocalNotificationMangager: ObservableObject {
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuthorization() async throws {
        try await notificationCenter.requestAuthorization(options: [.sound, .badge, .alert])
    }
}
