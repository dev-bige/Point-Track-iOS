//
//  NewsPostViewModel.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/12/22.
//

import Foundation

class NewsPostViewModel: ObservableObject {
    
    @Published var newsPosts = [NewsPost]()
    
    func getAllNewsPosts() {
        FirebaseManager.shared.firestore.collection("news").getDocuments() { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.newsPosts = documents.map { (queryDocumentSnapshot) -> NewsPost in
                let data = queryDocumentSnapshot.data()

                let title = data["title"] as? String ?? ""
                let author = data["author"] as? String ?? ""
                let link = data["link"] as? String ?? ""
                let date = data["date"] as? String ?? ""
                let website = data["website"] as? String ?? ""
                let imageLink = data["imageLink"] as? String ?? ""
                
                return NewsPost(
                    title: title,
                    author: author,
                    link: link,
                    date: date,
                    website: website,
                    imageLink: imageLink
                )
            }
        }
    }
}
