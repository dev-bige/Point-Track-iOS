//
//  MyPointsViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/12/22.
//

import Foundation


class MyPointsViewModel: ObservableObject {
    
    @Published var userPoints = [UserPoints]()
    
    func getUserPoints(species: String) {
        
        self.userPoints.removeAll()
        
        FirebaseManager.shared.firestore
            .collection("\(species.lowercased())_points")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .getDocument() { (document, error) in
                if let document = document, document.exists {
                    let data = document.data()

                    if let a = data {
                        for (key, value) in a {
                            print(key, value)
                            self.userPoints.append(UserPoints(state: key, points: value as! String))
                        }
                    }
  
                } else {
                    print("No Documents Found!")
                }
            }
    }
    
    func addUserPoints(species: String, points: UserPoints) {
        
        FirebaseManager.shared.firestore
            .collection("\(species.lowercased())_points")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .setData([points.state : points.points], merge: true)
    }

}
