//
//  UserApplications.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/21/22.
//

import Foundation

class UserApplications: Identifiable {
    
    var applications = [Application]()
    var totalApplyingCost: UInt64
    
    init(applications: [Application], totalApplyingCost: UInt64) {
        self.applications = applications
        self.totalApplyingCost = totalApplyingCost
    }
}
