//
//  BudgetApplicationsViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/21/22.
//

import Foundation
import Firebase
import FirebaseFirestore

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
                    
                    if let array = data?["applications"] as? [[String : Any]] {
                        for aValue in array {
                            let state = aValue["state"] as? String ?? ""
                            let species = aValue["species"] as? [String] ?? [String]()
                            let totalCost = aValue["totalCost"] as? Int64 ?? 0
                            
                            let application = Application(state: state, species: species, totalCost: totalCost)
                            
                            userApplicationsTemp.append(application)
                        }
                    }
                    
                } else {
                    self.getUserApplicationStatusMessage = "No Applications found!"
                }
            }
        
        userApplications.sort { $0.totalCost > $1.totalCost}
        
        if userApplicationsTemp.isEmpty {
            self.getUserApplicationStatusMessage = "No Applications found!"
        }
        
        self.userApplications = userApplicationsTemp
    }
    
    func addApplication(state: String, species: [String]) {
        
        let stateFormatted = state.lowercased().replacingOccurrences(of: " ", with: "_")
        
        let speciesFormatted = species.formatted().lowercased().replacingOccurrences(of: " ", with: "_")
        
        let budgetRef = FirebaseManager.shared.firestore
            .collection("user_applications")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
        
        let refApplication = FirebaseManager.shared.firestore
            .collection("reference_applications")
            .document(stateFormatted)
    
        refApplication.getDocument { (document, err) in
            var applicationRefCost = -1
            
            if let document = document, document.exists {
                var resident = false
                
                if self.authViewModel.currentUserObj.residentState.elementsEqual(state) {
                    resident = true
                }
                
                let applyingCostCalculator = ApplyingCostCalculator()
                
                applicationRefCost = applyingCostCalculator.calculateApplyingCost(state: state, documentSnapshot: document, species: species, resident: resident)
            }
            
            let applicationData = [
                "state" : state,
                "species" : species,
                "totalCost" : applicationRefCost
            ] as [String : Any]
            
            budgetRef.getDocument { (document, err) in
                if let document = document, document.exists {
                    budgetRef.updateData([
                        "applications" : FieldValue.arrayUnion([applicationData])
                    ])
                    
                    budgetRef.updateData([
                        "totalApplyingCost" : FieldValue.increment(Int64(applicationRefCost))
                    ])
                    
                    self.addApplicationStatusMessage = "Application Added Succesfully!"
                } else {
                    let newData = [
                        "applications" : [applicationData],
                        "totalApplyingCost" : applicationRefCost
                    ] as [String : Any]
                    
                    budgetRef.setData(newData)
                    self.addApplicationStatusMessage = "Application Added Succesfully!"
                }
            }
            
        }
    }
    
    func deleteApplication(applicationToDelete: Application) {
        
        let applicationData = [
            "state": applicationToDelete.state,
            "species": applicationToDelete.species,
            "totalCost": applicationToDelete.totalCost
        ] as [String : Any ]
        
        let docRef = FirebaseManager.shared.firestore
            .collection("user_applications")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
        
        docRef.getDocument { (document, err) in
            if let document = document, document.exists {
                docRef.updateData(
                    ["applications" : FieldValue.arrayRemove([applicationData])])
                
                docRef.updateData(
                    ["totalApplyingCost" : FieldValue.increment(Int64(applicationToDelete.totalCost) * -1)
                ])
                
                self.totalApplyingCost -= applicationToDelete.totalCost
                
            } else {
                print("Error deleting user application")
            }
        }
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
                        
                        print(data?["species_applications"])
                        
                        tempSpecies = data?["species_applications"] as? [String] ?? ["error"]
                    } else {
                        print("Error getting species for " + stateFormatted)
                    }
                    completionHandler(tempSpecies)
                }
        }
    }
}
