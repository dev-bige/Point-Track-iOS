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
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
