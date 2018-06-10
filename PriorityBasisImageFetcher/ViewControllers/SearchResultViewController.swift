//
//  SearchResultViewController.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 08/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    @IBOutlet weak var galleryCollectionView: GalleryCollectionView!
    var query : String?
    let searchDataService = SearchDataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGalleryCollectionView()
        fetchAndUpdateGalleryCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func setUpGalleryCollectionView(){
        galleryCollectionView.searchDataService = searchDataService
        galleryCollectionView.dataSource = galleryCollectionView
        galleryCollectionView.delegate = galleryCollectionView
        galleryCollectionView.commonInit()
    }
    
    func fetchAndUpdateGalleryCollectionView(){
        if let queryStr = self.query{
            let searchApi = SearchEndpoint()
            searchApi.query = queryStr
            searchDataService.fetchImageData(endPoint: searchApi, success: { (photosRepo) in
                self.galleryCollectionView?.photosRepo = photosRepo
                self.galleryCollectionView?.reloadData()
            }) { (error) in
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
