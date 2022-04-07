//
//  ContentView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/13/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @StateObject var session = SessionStore()
    var body: some View {
        Group {
            if session.session == nil {
                LoginView().environmentObject(session)
            } else {
                MainView().environmentObject(session)
            }
        }
        .environmentObject(session)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
