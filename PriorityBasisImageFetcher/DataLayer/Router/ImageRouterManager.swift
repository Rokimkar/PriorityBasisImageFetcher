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
    
    func fetchImage(for urlStr : String,success : @escaping (UIImage)->Void,failure :@escaping (Error)->Void){
        CacheRouter.readData(for: urlStr, cacheTime: 60, success: { (imageData) in
            if let image = UIImage.init(data: imageData){
                success(image)
            }
        }) { (error) in
            self.fetchImageFromNetwork(for: urlStr, success: { (imageData) in
                if let image = UIImage.init(data: imageData){
                    CacheRouter.writeToCache(for: urlStr, cacheTime: 60, data: imageData)
                    success(image)
                }
            }, failure: { (error) in
                failure(error)
            })
        }
        
    }
    
    func fetchImageFromNetwork(for urlStr : String,success : @escaping (Data)->Void,failure :@escaping (Error)->Void){
        guard let url = URL(string:urlStr) else{return}
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let err = error{
                failure(err)
            }
            guard let imageData = data else {
                return
            }
            success(imageData)
            }.resume()
    }
}
