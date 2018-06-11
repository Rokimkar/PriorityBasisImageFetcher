//
//  SearchDataService.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 09/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation

typealias SearchResponse = (PhotosRepo) -> Void

class SearchDataService{
    func fetchImageData(endPoint : EndPointType,success : @escaping SearchResponse,failure : @escaping (Error) -> Void){
        RouterManager.sharedInstance.fetchData(for: endPoint, fetchType: .cache, success: { (searchResponse : SearchPhotosResponse) in
            if let photosRepo = searchResponse.photos{
                ImageRouterManager.sharedInstance.resetState()
                success(photosRepo)
            }else{
                failure(NSError.init(domain: "Photos not fetched", code: 0, userInfo: [:]))
            }
        }) { (error) in
            failure(error)
        }
    }
}
