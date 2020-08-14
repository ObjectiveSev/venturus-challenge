//
//  Hotels.swift
//  Venturus Challenge
//
//  Created by Thiago Augusto on 24/07/20.
//  Copyright © 2020 objectivesev. All rights reserved.
//

import Foundation
import ObjectMapper

class QueryResult: Mappable {
    var data: Item?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.data <- map["data"]
    }
}

class Item: Mappable {
    var items: [ItemResult]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.items <- map["items"]
    }
}

class ItemResult: Mappable {
    var items: [PostItem]?
    var primary: ItemType?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.items <- map["items"]
        self.primary <- map["primary"]
    }
}

enum ItemTypeEnum: String {
    case post = "POSTS"
    case none = "none"
}

class ItemType: Mappable {
    var string: ItemTypeEnum?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        var type = ""
        type <- map["string"]
        self.string = ItemTypeEnum(rawValue: type)
    }
}

class PostItem: Mappable {
    var post: Post?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.post <- map["post"]
    }
}

class Post: Mappable {
    var images: [Image]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.images <- map["images"]
    }
}

class Image: Mappable {
    var link: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.link <- map["link"]
    }
}
