//
//  SessionStore.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/21/22.
//

import Foundation
import Firebase

class SessionStore: ObservableObject {
    @Published var session: User?
    var handle: AuthStateDidChangeListenerHandle?

    func listen() {
        handle =  FirebaseManager.shared.auth.addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = user
            } else {
                self.session = nil
            }
        }
    }
    
    public static func signInUser(email: String, password: String) {
        
    }
}
