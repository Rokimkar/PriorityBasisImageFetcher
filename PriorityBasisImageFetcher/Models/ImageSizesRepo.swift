//
//  ImageSizesRepo.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 10/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation

class ImageSizesRepo : Codable{
    var canblog : Int?
    var canprint : Int?
    var candownload : Int?
    var imageSizes : [ImageDetailInfo]?
    
    enum CodingKeys:String,CodingKey{
        case canblog = "canblog"
        case canprint = "canprint"
        case candownload = "candownload"
        case imageSizes = "size"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encode(canblog, forKey: .canblog)
        try? container.encode(canprint, forKey: .canprint)
        try? container.encode(candownload, forKey: .candownload)
        try? container.encode(imageSizes, forKey: .imageSizes)
        
    }
    
    required init(decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        canblog = try? container.decode(Int.self, forKey: .canblog)
        canprint = try? container.decode(Int.self, forKey: .canprint)
        candownload = try? container.decode(Int.self, forKey: .candownload)
        imageSizes = try? container.decode([ImageDetailInfo].self, forKey: .imageSizes)
    }
}
