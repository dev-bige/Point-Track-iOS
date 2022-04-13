//
//  UserPoints.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/12/22.
//

import Foundation

class UserPoints: Identifiable {
    var state: String
    var points: String
    
    init(state: String, points: String) {
        self.state = state
        self.points = points
    }
}
