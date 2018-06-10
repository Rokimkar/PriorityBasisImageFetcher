//
//  SearchResponse.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 10/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation

class SearchPhotosResponse : Codable{
    
    var photos : PhotosRepo?
    var status : String?
    
    enum CodingKeys:String,CodingKey{
        case photos = "photos"
        case status = "stat"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encode(photos, forKey: .photos)
        try? container.encode(status, forKey: .status)
    }
    
    required init(decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        photos = try? container.decode(PhotosRepo.self, forKey: .photos)
        status = try? container.decode(String.self, forKey: .status)
    }
}
