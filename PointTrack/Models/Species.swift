//
//  Species.swift
//  PointTrack
//
//  Created by Ethan Evans on 7/6/22.
//

import Foundation

class Species: Identifiable {

    
    
    var speciesList : Set<String>
    
    init (speciesList: Set<String>) {
        self.speciesList = speciesList
    }
}
