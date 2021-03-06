//
//  AuthViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/17/22.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var shouldTransitLogin = false
    @Published var loginStatusMessage = ""
    
    @Published var shouldTransitSignUp = false
    @Published var signUpStatusMessage = ""
    
    @Published var forgetPasswordStatusMessage = ""
    
    @Published var updateProfileStatusMessage = ""
    
    @Published var currentUserObj: UserObj = UserObj(email: "", name: "", residentState: "", username: "")
    
    func login(email: String, password: String) {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to login user:", error)
                self.loginStatusMessage = error.localizedDescription
                return
            }
            self.shouldTransitLogin = true
        }
    }
    
    func signUp(name: String, username: String, email: String, residentState: String, password: String, passwordVerify: String) {
        if (!password.elementsEqual(passwordVerify)) {
            signUpStatusMessage = "Passwords Must Match!"
            return
        }
        
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to create user:", error)
                self.signUpStatusMessage = error.localizedDescription
                return
            }
            
            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
            let userData = ["email": email, "uid": uid, "name": name, "username": username, "residentState": residentState, "createdOn": Date.now, "devicedCreatedOn": "iOS"] as [String : Any]
            
            FirebaseManager.shared.firestore.collection("users").document(uid).setData(userData) { error in
                    if let error = error {
                        print(error)
                        self.signUpStatusMessage = "Failed to create user: \(error)"
                        return
                    }
                }
            self.shouldTransitSignUp = true
        }
    }
    
    func sendPasswordResetEmail(email: String) {
        FirebaseManager.shared.auth.sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Failed to reset email:", error)
                self.forgetPasswordStatusMessage = error.localizedDescription
                return
            }
            self.forgetPasswordStatusMessage = "Reset Password Email Sent"
        }
    }
    
    func updateProfile(name: String, username: String, residentState: String) {
        
        self.updateProfileStatusMessage = ""
        
        if (name.isEmpty && username.isEmpty && residentState.isEmpty) {
            updateProfileStatusMessage = "Please update one of the fields above."
        } else {
            let docRef = FirebaseManager.shared.firestore.collection("users").document(FirebaseManager.shared.auth.currentUser!.uid)
            
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    
                    let dataName = data?["name"] as? String ?? ""
                    let dataUserName = data?["username"] as? String ?? ""
                    let dataResidentState = data?["residentState"] as? String ?? ""
                    
                    if (!name.isEmpty && !name.elementsEqual(dataName)) {
                        docRef.updateData(["name": name])
                    }
                    
                    if (!username.isEmpty && !username.elementsEqual(dataUserName)) {
                        docRef.updateData(["username": username])
                    }
                    
                    if (!residentState.isEmpty && !residentState.elementsEqual(dataResidentState)) {
                        docRef.updateData(["residentState": residentState])
                    }
                } else {
                    print("Document does not exist")
                }
            }
            
            updateProfileStatusMessage = "Profile updated succesfully!"
        }
    }
    
    func getCurrentUserObj() {
        let docRef = FirebaseManager.shared.firestore.collection("users").document(FirebaseManager.shared.auth.currentUser!.uid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                
                let dataName = data?["name"] as? String ?? ""
                let dataEmail = data?["email"] as? String ?? ""
                let dataUserName = data?["username"] as? String ?? ""
                let dataResidentState = data?["residentState"] as? String ?? ""
                
                self.currentUserObj = UserObj(email: dataEmail, name: dataName, residentState: dataResidentState, username: dataUserName)
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func signOut() {
        do {
            print("User logged out")
            self.shouldTransitSignUp = false
            self.shouldTransitLogin = false
            try FirebaseManager.shared.auth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
          }
    }
}
