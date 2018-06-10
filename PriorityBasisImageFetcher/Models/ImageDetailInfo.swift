//
//  ImageDetailInfo.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 10/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation

class ImageDetailInfo : Codable{
    var label : String?
    var sourceUrl : String?
    var url : String?
    var media : String?
    
    enum CodingKeys:String,CodingKey{
        case label = "label"
        case sourceUrl = "source"
        case url = "url"
        case media = "media"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encode(label, forKey: .label)
        try? container.encode(sourceUrl, forKey: .sourceUrl)
        try? container.encode(url, forKey: .url)
        try? container.encode(media, forKey: .media)
    }
    
    required init(decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        label = try? container.decode(String.self, forKey: .label)
        sourceUrl = try? container.decode(String.self, forKey: .sourceUrl)
        url = try? container.decode(String.self, forKey: .url)
        media = try? container.decode(String.self, forKey: .media)
    }
}
