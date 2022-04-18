//
//  AuthViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/17/22.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    @Published var shouldTransit = false
    @Published var loginStatusMessage = ""
    
    func login(email: String, password: String) {
        print(shouldTransit)
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to login user:", error)
                self.loginStatusMessage = error.localizedDescription
                return
            }
            self.shouldTransit = true
        }
        print(shouldTransit)

    }
    
    func signOut() {
        do {
            print("User logged out")
            try FirebaseManager.shared.auth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
          }
    }
}
