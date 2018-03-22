//
//  PostModel.swift
//  BlogAPI
//
//  Created by Bogdan Dubiahin on 17.03.2018.
//  Copyright © 2018 Bogdan Dubiahin. All rights reserved.
//

import UIKit

class PostModel: Codable {
    
    var datePublic: String
    var id: Int
    var text: String
    var title: String
    
    init(datePublic:String, id: Int, text: String, title: String) {
        self.datePublic = datePublic
        self.id = id
        self.text = text
        self.title = title
    }
    
}

class BlogComment: Codable {
    
    var author: String
    var datePublic: String
    var id: Int
    var text: String
    
    init(author:String, datePublic: String, id: Int, text: String) {
        self.author = author
        self.datePublic = datePublic
        self.id = id
        self.text = text
    }
        
}

