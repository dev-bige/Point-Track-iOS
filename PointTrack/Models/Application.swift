//
//  Application.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/21/22.
//

import Foundation
import Firebase

class Application: Identifiable {
    
    var title: String
    var applicationPeriod: String
    var state: String
    var species = [String]()
    var applicationLink: String
    var application_end: Timestamp
    var details: String
    var applicationEpochTime: UInt64
    
    init(title: String, applicationPeriod: String, state: String, species: [String], applicationLink: String, application_end: Timestamp, details: String, applicationEpochTime: UInt64) {
        self.title = title
        self.applicationPeriod = applicationPeriod
        self.state = state
        self.species = species
        self.applicationLink = applicationLink
        self.application_end = application_end
        self.details = details
        self.applicationEpochTime = applicationEpochTime
    }
}
