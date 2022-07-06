//
//  BudgetTagsViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/21/22.
//

import Foundation
import Firebase
import FirebaseFirestore

class BudgetTagsViewModel: ObservableObject {
    
    @Published var authViewModel: AuthViewModel
    
    init () {
        authViewModel = AuthViewModel()
        authViewModel.getCurrentUserObj()
    }
    
    @Published var userTags = [Tag]()
    @Published var totalTagCost: Int64 = 0
        
    @Published var species = [String]()
        
    @Published var getUserTagStatusMessage = ""
    @Published var addTagStatusMessage = ""
    
    func getUserTags() {
        
        self.userTags.removeAll()
        self.getUserTagStatusMessage = ""
        
        var userTagsTemp = [Tag]()
        
        FirebaseManager.shared.firestore
            .collection("user_tags")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .getDocument() { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()
                    
                    self.totalTagCost = data?["totalTagCost"] as? Int64 ?? 0
                    
                    if let array = data?["tags"] as? [[String: Any]] {
                        for aValue in array {
                            let state = aValue["state"] as? String ?? ""
                            let species = aValue["species"] as? String ?? ""
                            let cost = aValue["cost"] as? Int64 ?? 0
                            
                            let tag = Tag(state: state, species: species, cost: cost)
                            
                            userTagsTemp.append(tag)
                        }
                    }
                    
                } else {
                    self.getUserTagStatusMessage = "No Tags found!"
                }
                
                userTagsTemp.sort { $0.cost > $1.cost}
                
                if userTagsTemp.isEmpty {
                    self.getUserTagStatusMessage = "No Tags found!"
                }
                
                self.userTags = userTagsTemp
            }
    }
    
    func addTag(state: String, species: String) {
        
        let stateFormatted = state.lowercased().replacingOccurrences(of: " ", with: "_")
        let speciesFormatted = species.lowercased().replacingOccurrences(of: " ", with: "_")
        
        let budgetRef = FirebaseManager.shared.firestore
            .collection("user_tags")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
        
        let refTag = FirebaseManager.shared.firestore
            .collection("reference_tag")
            .document(stateFormatted)
        
        refTag.getDocument { (document, err) in
            var tagRefCost = -1

            if let document = document, document.exists {
                var documentPath = ""
                
                // resident
                if self.authViewModel.currentUserObj.residentState.elementsEqual(state) {
                    documentPath = "resident" + "_" + speciesFormatted
                }
                else {
                    documentPath = "nonresident" + "_" + speciesFormatted
                }
                
                if (!documentPath.isEmpty) {
                    tagRefCost = document.data()?[documentPath] as? Int ?? -1
                }
            }
            
            let tagData = [
                "state": state,
                "species": species,
                "cost": tagRefCost
            ] as [String : Any ]
            
            budgetRef.getDocument { (document, err) in
                if let document = document, document.exists {
                    budgetRef.updateData([
                        "tags" : FieldValue.arrayUnion([tagData]
                    )])
                    
                    budgetRef.updateData([
                        "totalTagCost" : FieldValue.increment(Int64(tagRefCost))
                    ])
                    
                    self.addTagStatusMessage = "Tag Added Succesfully!"
                } else {
                    let newData = [
                        "tags": [tagData],
                        "totalTagCost": tagRefCost
                    ] as [String : Any ]
                    
                    budgetRef.setData(newData)
                    self.addTagStatusMessage = "Tag Added Succesfully!"
                }
            }
        }
    }
    
    func deleteTag(tagToDelete: Tag) {
        
        let tagData = [
            "state": tagToDelete.state,
            "species": tagToDelete.species,
            "cost": tagToDelete.cost
        ] as [String : Any ]
        
        let docRef = FirebaseManager.shared.firestore
            .collection("user_tags")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
        
        docRef.getDocument { (document, err) in
            if let document = document, document.exists {
                docRef.updateData(["tags" : FieldValue.arrayRemove([tagData])])
                
                docRef.updateData([
                    "totalTagCost"  : FieldValue.increment(Int64(tagToDelete.cost) * -1)
                ])
                
                self.totalTagCost -= tagToDelete.cost
            } else {
                print("Error deleting user tag")
            }
        }
    }
    
    func getStateForTags(completionHandler: @escaping ([String]) -> Void) {
        var tempStates = [String]()
        
        FirebaseManager.shared.firestore
            .collection("reference_tag")
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
    
    func getSpeciesForTags(state: String, completionHandler: @escaping ([String]) -> Void) {
        var tempSpecies = [String]()
        
        if (!state.isEmpty) {
            
            let stateFormatted = state.lowercased().replacingOccurrences(of: " ", with: "_")
            print(stateFormatted)
            
            FirebaseManager.shared.firestore
                .collection("reference_tag")
                .document(stateFormatted)
                .getDocument() { (document, error) in
                    if let document = document, document.exists {
                        let data = document.data()
                        
                        tempSpecies = data?["species_tag"] as? [String] ?? ["error"]
                    } else {
                        print("Erorr getting species for " + stateFormatted)
                    }
                    completionHandler(tempSpecies)
                }
        }
    }
}
