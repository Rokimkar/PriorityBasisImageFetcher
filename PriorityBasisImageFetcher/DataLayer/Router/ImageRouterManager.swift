//
//  ImageRouterManager.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 10/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class ImageRouterManager{
    static let sharedInstance = ImageRouterManager()
    var imageFetcherQueue = OperationQueue()
    var imageFetchOperations : [String : ImageDataFetchOperation]? = [:]
    
    func fetchImage(for urlStr : String,success : @escaping (UIImage)->Void,failure :@escaping (Error)->Void){
        if let fetchOperation = imageFetchOperations?[urlStr]{
            if fetchOperation.isExecuting == true{
                fetchOperation.failure = failure
                fetchOperation.success = success
                fetchOperation.qualityOfService = .userInitiated
            }else{
                fetchOperation.cancel()
                let imageFetchOperation = ImageDataFetchOperation.init(with: urlStr)
                imageFetchOperation.success = success
                imageFetchOperation.failure = failure
                imageFetchOperation.qualityOfService = .utility
                imageFetcherQueue.addOperation(imageFetchOperation)
                imageFetchOperations?[urlStr] = imageFetchOperation
            }
        }else{
            let imageFetchOperation = ImageDataFetchOperation.init(with: urlStr)
            imageFetchOperation.success = success
            imageFetchOperation.failure = failure
            imageFetchOperation.qualityOfService = .background
            imageFetcherQueue.addOperation(imageFetchOperation)
            imageFetchOperations?[urlStr] = imageFetchOperation
      }
    }
    
    func resetState(){
        imageFetchOperations?.removeAll()
    }
}
