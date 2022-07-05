//
//  Tag.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/21/22.
//

import Foundation

class Tag: Identifiable {
    
    var state: String
    var species: String
    var cost: Int64
    
    init(state: String, species: String, cost: Int64) {
        self.state = state
        self.species = species
        self.cost = cost
    }
}
