//
//  Post.swift
//  Belyaev.IOS-19-Networking
//
//  Created by максим  кондратьев  on 09.06.2021.
//

import Foundation

class Post: Codable{
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(userId: Int, id:Int, title:String,body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}

