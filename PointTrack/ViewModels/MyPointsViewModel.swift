//
//  MyPointsViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/12/22.
//

import Foundation
import Firebase


class MyPointsViewModel: ObservableObject {
    
    @Published var userPoints = [UserPoints]()
    
    @Published var addPointStatusMessage = ""
    @Published var addPointsError = false
    
    @Published var updatePointsStatusMessage = ""
    @Published var updatePointsError = false
    
    @Published var deletePointsStatusMessage = ""
    @Published var deletePointsError = false
    
    func getUserPoints(species: String) {
        
        self.addPointStatusMessage = ""
        self.addPointsError = false
        
        self.updatePointsStatusMessage = ""
        self.updatePointsError = false
        
        self.deletePointsStatusMessage = ""
        self.deletePointsError = false
        
        self.userPoints.removeAll()
        
        var userPointsTemp = [UserPoints]()
        
        FirebaseManager.shared.firestore
            .collection("\(species)_points")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .getDocument() { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()

                    if let a = data {
                        for (key, value) in a {
                            userPointsTemp.append(UserPoints(state: key, points: value as! String))
                        }
                    }

                    self.userPoints = userPointsTemp.sorted(by: { Int($0.points)! > Int($1.points)! })
                    
                } else {
                    print("No Documents Found!")
                }
            }
        

    }
    
    func addUserPoints(species: String, points: UserPoints) {
        
        self.addPointStatusMessage = ""
        self.addPointsError = false
        
        if (points.state.isEmpty) {
            self.addPointStatusMessage = "You must specify a state!"
            self.addPointsError = true
            return
        }
        
        if (points.points.isEmpty) {
            self.addPointStatusMessage = "You must specify the number of points!"
            self.addPointsError = true
            return
        }
        
        if (Int(points.points)! <= 0) {
            self.addPointStatusMessage = "You must specify a number of points greater than 0!"
            self.addPointsError = true
            return
        }
        
        FirebaseManager.shared.firestore
            .collection("\(species)_points")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .setData([points.state : points.points], merge: true)
        
        self.addPointStatusMessage = "Points added succesfully!"
        self.addPointsError = false
    }
    
    func updateUserPoints(species: String, points: UserPoints) {
        
        self.updatePointsStatusMessage = ""
        self.updatePointsError = false
        
        if (Int(points.points)! <= 0) {
            self.updatePointsStatusMessage = "You must specify a number of points greater than 0!"
            self.updatePointsError = true
            return
        }
        
        FirebaseManager.shared.firestore
            .collection("\(species)_points")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .setData([points.state : points.points], merge: true)
        
        self.updatePointsStatusMessage = "Points updated succesfully!"
        self.updatePointsError = false
        
        
        print(updatePointsError)
    }
    
    func deleteUserPoints(species: String, points: UserPoints) {
        
        let speciesFormatted = species.lowercased().replacingOccurrences(of: " ", with: "_")
        
        self.deletePointsStatusMessage = ""
        self.deletePointsError = false
        
        FirebaseManager.shared.firestore
            .collection("\(speciesFormatted)_points")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .updateData([points.state: FieldValue.delete(),]) { err in
                if let err = err {
                    self.deletePointsStatusMessage = "Error updating points!"
                    self.deletePointsError = true
                } else {
                    self.deletePointsStatusMessage = "Points deleted succesfully!"
                    self.deletePointsError = true
                }
            }
    }
}
