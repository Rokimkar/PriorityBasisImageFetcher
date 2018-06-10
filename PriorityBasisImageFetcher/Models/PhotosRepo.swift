//
//  ImageRepo.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 09/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation

class PhotosRepo : Codable{
    var page : Int?
    var pages : Int?
    var perpage : Int?
    var total : String?
    var photo : [FlickrPhoto]?
    
    enum CodingKeys:String,CodingKey {
        case page = "page"
        case pages = "pages"
        case perpage = "perpage"
        case total = "total"
        case photo = "photo"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try? container.encode(page, forKey: .page)
        try? container.encode(pages, forKey: .pages)
        try? container.encode(perpage, forKey: .perpage)
        try? container.encode(total, forKey: .total)
        try? container.encode(photo, forKey: .photo)
    }
    
    required init(decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        page = try? container.decode(Int.self, forKey: .page)
        pages = try? container.decode(Int.self, forKey: .pages)
        perpage = try? container.decode(Int.self, forKey: .perpage)
        total = try? container.decode(String.self, forKey: .total)
        photo = try? container.decode([FlickrPhoto].self, forKey: .photo)
    }
}
