//
//  BudgetApplicationsViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/21/22.
//

import Foundation

class BudgetApplicationsViewModel: ObservableObject {
    
    @Published var authViewModel: AuthViewModel
    
    init() {
        authViewModel = AuthViewModel()
        authViewModel.getCurrentUserObj()
    }
    
    @Published var userApplications = [Application]()
    @Published var totalApplyingCost: Int64 = 0
    
    @Published var species = [String]()
    
    @Published var getUserApplicationStatusMessage = ""
    @Published var addApplicationStatusMessage = ""

    func getUserApplications() {
        
        self.userApplications.removeAll()
        self.addApplicationStatusMessage = ""
        
        var userApplicationsTemp = [Application]()
    
        FirebaseManager.shared.firestore
            .collection("user_applications")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .getDocument() { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    
                    self.totalApplyingCost = data?["totalApplyingCost"] as? Int64 ?? 0
                    
                    
                    
                } else {
                    self.getUserApplicationStatusMessage = "No Applications found!"
                }
            }
        
        userApplications.sort { $0.totalCost > $1.totalCost}
        
        if userApplicationsTemp.isEmpty {
            self.getUserApplicationStatusMessage = "No Applications found!"
        }
    }
    
    func addApplication() {
        
    }
    
    func deleteApplication(applicationToDelete: Application) {
        
    }
    
    func getStateForApplications(completionHandler: @escaping ([String]) -> Void) {
        var tempStates = [String]()
        
        FirebaseManager.shared.firestore
            .collection("reference_applications")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let tempStateFormatted = document.documentID.replacingOccurrences(of: "_", with: " ").capitalized
                        tempStates.append(tempStateFormatted)
                    }
                }
                completionHandler(tempStates)
            }
    }
    
    func getSpeciesForApplications(state: String, completionHandler: @escaping ([String]) -> Void) {
        var tempSpecies = [String]()
        
        if (!state.isEmpty) {
            let stateFormatted = state.lowercased().replacingOccurrences(of: " ", with: "_")
            print(stateFormatted)
            
            FirebaseManager.shared.firestore
                .collection("reference_applications")
                .document(stateFormatted)
                .getDocument() { (document, error) in
                    if let document = document, document.exists {
                        let data = document.data()
                        
                        tempSpecies = data?["species_applications"] as? [String] ?? ["error"]
                    } else {
                        print("Error getting species for " + stateFormatted)
                    }
                    completionHandler(tempSpecies)
                }
        }
    }
}
