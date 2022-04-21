//
//  Reference.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/20/22.
//

import Foundation

class Reference: Identifiable {
    
    // Resident States
    let residentStates = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin"]
    
    
    func getSpeciesStates(species: String) -> Array<String> {
        switch species {
        case "antelope":
            return antelope
        case "bison":
            return bison
        case "black_bear":
            return black_bear
        case "bighorn_sheep":
            return bighorn_sheep
        case "elk":
            return elk
        case "deer":
            return deer
        case "moose":
            return moose
        case "mountain_goat":
            return mountain_goat
        default:
            return []
        }
    }
    
    // Antelope States
    let antelope = ["Arizona", "California", "Colorado", "Idaho", "South Dakota", "North Dakota", "Nevada", "New Mexico", "Montana", "Oregon", "Utah", "Washington", "Wyoming"]
    
    // Bison states
    let bison = ["Arizona", "South Dakota", "Montana", "Utah", "Wyoming"]
    
    let black_bear = ["Arizona", "California", "Colorado", "Idaho", "Kentucky", "Maine", "Nevada", "New Mexico", "Montana", "Utah", "Washington", "Wyoming"]
    
    let bighorn_sheep = ["Arizona", "California", "Colorado", "Idaho", "South Dakota", "North Dakota", "Nevada", "New Mexico", "Montana", "Oregon", "Utah", "Washington", "Wyoming"]
    
    let elk = ["Arizona", "California", "Colorado", "Idaho", "Kentucky", "South Dakota", "North Dakota", "Nevada", "New Mexico", "Montana", "Oregon", "Utah", "Washington", "Wyoming"]
    
    let deer = ["Arizona", "California", "Colorado", "Idaho", "Iowa", "Kentucky", "Maine", "South Dakota", "North Dakota", "Nevada", "New Mexico", "Montana", "Oregon", "Utah", "Washington", "Wyoming"]
    
    let moose = ["Colorado", "Idaho", "Maine", "North Dakota", "Montana", "Utah", "Washington", "Wyoming"]
    
    let mountain_goat = ["Colorado", "Idaho", "South Dakota", "Nevada", "Montana", "Oregon", "Utah", "Washington", "Wyoming"]
}
