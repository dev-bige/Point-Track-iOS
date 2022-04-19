//
//  ContentView.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/13/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore

    func getUser () {
        session.listen()
    }
    
    var body: some View {
        NavigationView {
            Group {
                if session.session == nil {
                    LoginView()
                } else {
                    MainView()
                }
            }
            .onAppear(perform: getUser)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
