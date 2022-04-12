//
//  NewsPosts.swift
//  PointTrack
//
//  Created by Ethan Evans on 4/11/22.
//

import Foundation

class NewsPost: Identifiable {
    var title: String
    var author: String
    var link: String
    var date: String
    var website: String
    var imageLink: String
    
    init(title: String, author: String, link: String, date: String, website: String, imageLink: String) {
        self.title = title
        self.author = author
        self.link = link
        self.date = date
        self.website = website
        self.imageLink = imageLink
    }
}
