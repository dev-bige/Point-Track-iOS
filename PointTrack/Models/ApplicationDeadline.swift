//
//  ApplicationDeadline.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/8/22.
//

import Foundation

class ApplicationDeadline: Identifiable {
    var title: String
    var species: String
    var deadlineDate: String
    
    init(title: String, species: String, deadlineDate: String) {
        self.title = title
        self.species = species
        self.deadlineDate = deadlineDate
    }
}
