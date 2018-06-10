//
//  ImageSizeResponse.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 10/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation

class ImageSizeResponse : Codable{
    var sizes : ImageSizesRepo?
    var status : String?
    
    enum CodingKeys:String,CodingKey{
        case sizes = "sizes"
        case status = "stat"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encode(sizes, forKey: .sizes)
        try? container.encode(status, forKey: .status)
    }
    
    required init(decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        sizes = try? container.decode(ImageSizesRepo.self, forKey: .sizes)
        status = try? container.decode(String.self, forKey: .status)
    }
}
