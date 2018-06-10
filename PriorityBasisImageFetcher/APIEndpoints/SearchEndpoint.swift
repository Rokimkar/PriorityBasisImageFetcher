//
//  SearchEndpoint.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 09/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation

class SearchEndpoint : EndPointType{
    var baseUrl: String{
        return Constants.baseUrl
    }
    
    var endPointMethod: String{
        return "flickr.photos.search"
    }
    
    var apiKey: String{
        return Constants.apiKey
    }
    
    var httpMethod: RequestMethod{
        return .GET
    }
    
    var headers : [String : String]?{
        return [:]
    }
    
    var responseFormat: String{
        return "json&nojsoncallback=1"
    }
    
    var cacheTime: TimeInterval{
        return 240
    }
    
    var query : String?
    
    var completeUrl: String?{
        if let queryStr = query{
            return "\(baseUrl)?method=\(endPointMethod)&api_key=\(apiKey)&format=\(responseFormat)&text=\(queryStr)"
        }else{
            return nil
        }
        
    }
    
}
