//
//  ApplicationDeadline.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/8/22.
//

import Foundation

class ApplicationDeadline: Identifiable {
    var title: String
    var applicationPeriod: String
    var details: String
    
    init(title: String, applicationPeriod: String, details: String) {
        self.title = title
        self.applicationPeriod = applicationPeriod
        self.details = details
    }
}
