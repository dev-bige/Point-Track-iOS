//
//  UserTags.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/21/22.
//

import Foundation

class UserTags: Identifiable {
    
    var tags = [Tag]()
    var totalTagCost: UInt64
    
    init(tags: [Tag], totalTagCost: UInt64) {
        self.tags = tags
        self.totalTagCost = totalTagCost
    }
}
