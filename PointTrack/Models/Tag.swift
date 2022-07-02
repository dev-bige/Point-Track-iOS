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
    var cost: UInt64
    
    init(state: String, species: String, cost: UInt64) {
        self.state = state
        self.species = species
        self.cost = cost
    }
}
