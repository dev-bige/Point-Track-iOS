//
//  ApplicationDeadlineViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/12/22.
//

import Foundation
import Firebase


class ApplicationDeadlineViewModel: ObservableObject {
    
    @Published var applicationDeadlines = [ApplicationDeadline]()
    
    func getAllDeadlines() {
        
        self.applicationDeadlines.removeAll()
        
        let currentTimestamp = Timestamp(seconds: Int64(Date().timeIntervalSince1970), nanoseconds: 0)
        
        FirebaseManager.shared.firestore.collection("reference_deadline").whereField("application_end", isGreaterThan: currentTimestamp).getDocuments() { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.applicationDeadlines = documents.map { (queryDocumentSnapshot) -> ApplicationDeadline in
                let data = queryDocumentSnapshot.data()

                let title = data["title"] as? String ?? ""
                let applicationPeriod = data["applicationPeriod"] as? String ?? ""
                let details = data["details"] as? String ?? ""
                let applicationLink = data["applicationLink"] as? String ?? ""
                
                
                
                return ApplicationDeadline(
                    title: title,
                    applicationPeriod: applicationPeriod,
                    details: details,
                    applicationLink: applicationLink
                )
            }
        }
    }
}
