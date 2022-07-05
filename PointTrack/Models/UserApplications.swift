//
//  UserApplications.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/21/22.
//

import Foundation

class UserApplications: Identifiable {
    
    var applications = [Application]()
    var totalApplyingCost: Double
    
    init(applications: [Application], totalApplyingCost: Double) {
        self.applications = applications
        self.totalApplyingCost = totalApplyingCost
    }
}
