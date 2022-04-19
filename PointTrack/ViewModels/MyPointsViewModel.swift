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
                                        
                    self.userPoints = userPointsTemp.sorted(by: { (point0: UserPoints, point1: UserPoints) -> Bool in
                        return point0 > point1
                    })
                    
                } else {
                    print("No Documents Found!")
                }
            }
        

    }
    
    func addUserPoints(species: String, points: UserPoints) {
        
        FirebaseManager.shared.firestore
            .collection("\(species)_points")
            .document(FirebaseManager.shared.auth.currentUser!.uid)
            .setData([points.state : points.points], merge: true)
    }

}
