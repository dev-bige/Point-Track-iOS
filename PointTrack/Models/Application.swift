//
//  Application.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/21/22.
//

import Foundation
import Firebase

class Application: Identifiable {
    
    var state: String
    var species = [String]()
    var totalCost = Int64()
    
    init(state: String, species: [String], totalCost: Int64) {
        self.state = state
        self.species = species
        self.totalCost = totalCost
    }
}
