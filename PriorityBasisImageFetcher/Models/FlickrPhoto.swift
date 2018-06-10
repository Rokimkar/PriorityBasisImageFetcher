//
//  FlickrPhoto.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 09/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation

class FlickrPhoto : Codable{
    var id : String?
    var owner : String?
    var secret : String?
    var server : String?
    var farm : Int?
    var title : String?
    var isPublic : Int?
    var isFriend : Int?
    var isFamily : Int?
    
    enum CodingKeys : String,CodingKey{
        case id = "id"
        case owner = "owner"
        case secret = "secret"
        case server = "server"
        case farm = "farm"
        case title = "title"
        case isPublic = "ispublic"
        case isFriend = "isfriend"
        case isFamily = "isfamily"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encode(id, forKey: .id)
        try? container.encode(owner, forKey: .owner)
        try? container.encode(secret, forKey: .secret)
        try? container.encode(server, forKey: .server)
        try? container.encode(farm, forKey: .farm)
        try? container.encode(title, forKey: .title)
        try? container.encode(isPublic, forKey: .isPublic)
        try? container.encode(isFriend, forKey: .isFriend)
        try? container.encode(isFamily, forKey: .isFamily)
    }
    
    required init(decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try? container.decode(String.self, forKey: .id)
        owner = try? container.decode(String.self, forKey: .owner)
        secret = try? container.decode(String.self, forKey: .secret)
        server = try? container.decode(String.self, forKey: .server)
        farm = try? container.decode(Int.self, forKey: .farm)
        title = try? container.decode(String.self, forKey: .title)
        isPublic = try? container.decode(Int.self, forKey: .isPublic)
        isFriend = try? container.decode(Int.self, forKey: .isFriend)
        isFamily = try? container.decode(Int.self, forKey: .isFamily)
    }
}
