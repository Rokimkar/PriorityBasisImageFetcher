//
//  FlickrImageEndPoint.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 10/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation

class FlickrImageEndPoint : EndPointType{
    var baseUrl: String{
        return Constants.baseUrl
    }
    
    var endPointMethod: String{
        return "flickr.photos.getSizes"
    }
    
    var apiKey: String{
        return Constants.apiKey
    }
    
    var responseFormat: String{
        return "json&nojsoncallback=1"
    }
    
    var httpMethod: RequestMethod{
        return .GET
    }
    
    var headers: [String : String]?{
        return nil
    }
    
    var cacheTime: TimeInterval{
        return 240
    }
    
    var completeUrl: String?{
        return "\(baseUrl)?method=\(endPointMethod)&api_key=\(apiKey)&format=\(responseFormat)&photo_id=\(photoId)"
    }
    
    var photoId : String
    
    init(photoId : String){
        self.photoId = photoId
    }
}
