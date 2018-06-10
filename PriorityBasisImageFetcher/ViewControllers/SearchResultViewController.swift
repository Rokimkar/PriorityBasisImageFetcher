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
        addRightBarButton()
        // Do any additional setup after loading the view.
    }
    
    func addRightBarButton(){
        let rightBarButton = UIBarButtonItem.init(title: "Options", style: .plain, target: self, action: #selector(optionButtonPressed))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func setUpGalleryCollectionView(){
        galleryCollectionView.imageCollectionViewType = .fourImage
        galleryCollectionView.updateCollectionView()
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
                self.galleryCollectionView.reloadData()
            }) { (error) in
                print(error)
            }
        }
    }
    
    @objc func optionButtonPressed(){
        let actionSheet = UIActionSheet.init(title: "Mode", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Two Images", otherButtonTitles: "Three Images", "Four Images")
        actionSheet.show(in: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SearchResultViewController : UIActionSheetDelegate{
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        if buttonIndex == 0{
            galleryCollectionView.imageCollectionViewType = .twoImage
        }else if buttonIndex == 2{
            galleryCollectionView.imageCollectionViewType = .threeImage
        }else{
            galleryCollectionView.imageCollectionViewType = .fourImage
        }
        galleryCollectionView.updateCollectionView()
    }
}
