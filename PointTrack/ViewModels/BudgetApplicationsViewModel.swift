//
//  BudgetApplicationsViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/21/22.
//

import Foundation

class BudgetApplicationsViewModel: ObservableObject {
    
    @Published var userApplications = [Application]()

    func getUserApplications() {
        
        FirebaseManager.shared.firestore
            .collection("user_applications")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .getDocument() { (document, error) in
                if let document = document, document.exists {
                
                }
            }
    }
}
