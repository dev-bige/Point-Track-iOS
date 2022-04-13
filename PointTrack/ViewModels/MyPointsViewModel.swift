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
        //FirebaseManager.shared.firestore.collection("\(species)_points").document(FirebaseManager.shared.auth.getuid())
    }

}
