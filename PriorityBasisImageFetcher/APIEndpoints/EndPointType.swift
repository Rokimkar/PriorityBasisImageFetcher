//
//  File.swift
//  SearchFilter
//
//  Created by S@nchit on 31/05/18.
//  Copyright © 2018 til. All rights reserved.
//

import UIKit

public enum RequestMethod : String{
    case GET = "GET"
    case POST = "POST"
}

protocol EndPointType {
    var baseUrl : String {get}
    var endPointMethod : String{get}
    var apiKey : String{get}
    var responseFormat : String{get}
    var httpMethod : RequestMethod {get}
    var headers : [String : String]? {get}
    var cacheTime : TimeInterval {get}
    
    var completeUrl : String? {get}
}
