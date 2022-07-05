//
//  PointTrackApp.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/13/22.
//

import SwiftUI
import Firebase

@main
struct PointTrackApp: App {

    @StateObject var localNotificationManger = LocalNotificationMangager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SessionStore())
                .environmentObject(localNotificationManger)
        }
    }
}
