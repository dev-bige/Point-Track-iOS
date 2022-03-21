//
//  FirebaseManager.swift
//  PointTrack
//
//  Created by Ethan Evans on 3/20/22.
//

import Foundation
import Firebase


class FirebaseManager: NSObject {

    let auth: Auth
    let firestore: Firestore

    static let shared = FirebaseManager()

    override init() {
        FirebaseApp.configure()

        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()

        super.init()
    }

}
