//
//  UserPoints.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/12/22.
//

import Foundation

class UserPoints: Identifiable, Comparable {
    var state: String
    var points: String
    
    init(state: String, points: String) {
        self.state = state
        self.points = points
    }
    
    static func ==(lhs: UserPoints, rhs: UserPoints) -> Bool {
        return lhs.points == rhs.points
    }

    static func <(lhs: UserPoints, rhs: UserPoints) -> Bool {
        return lhs.points < rhs.points
    }
}
