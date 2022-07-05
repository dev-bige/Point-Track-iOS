//
//  User.swift
//  PointTrack
//
//  Created by Ethan Evans on 7/4/22.
//

import Foundation
import Firebase

class UserObj: Identifiable, Codable {
    
    var email: String
    var name: String
    var residentState: String
    var username: String
    
    init (email: String, name: String, residentState: String, username: String) {
        self.email = email
        self.name = name
        self.residentState = residentState
        self.username = username
    }
}
