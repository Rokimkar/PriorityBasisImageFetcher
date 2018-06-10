//
//  GalleryCollectionView.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 09/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

enum ImageCollectionViewType{
    case twoImage
    case threeImage
    case fourImage
}

class GalleryCollectionView: UICollectionView {
    
    weak var searchDataService : SearchDataService?
    var photosRepo : PhotosRepo?
    var imageCollectionViewType = ImageCollectionViewType.threeImage
    
    func commonInit(){
        self.register(UINib.init(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GalleryCollectionViewCell")
    }
    
    func updateCollectionView(){
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        var imageLinearDimension = Constants.screenWidth/2
        flowLayout.itemSize = CGSize.init(width: imageLinearDimension, height: imageLinearDimension)
        switch imageCollectionViewType {
        case .twoImage:
            imageLinearDimension -= 15
            flowLayout.itemSize = CGSize.init(width: imageLinearDimension, height: imageLinearDimension)
            break
        case .threeImage:
            imageLinearDimension = Constants.screenWidth/3
            imageLinearDimension -= 15
            flowLayout.itemSize = CGSize.init(width: imageLinearDimension, height: imageLinearDimension)
            break
        case .fourImage:
            imageLinearDimension = Constants.screenWidth/4
            imageLinearDimension -= 15
            flowLayout.itemSize = CGSize.init(width: imageLinearDimension, height: imageLinearDimension)
            break
        }
        self.setCollectionViewLayout(flowLayout, animated: true)
        //self.reloadData()
    }
}

extension GalleryCollectionView : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let _ = photosRepo?.photo{
            return photosRepo!.photo!.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as! GalleryCollectionViewCell
        cell.backgroundColor = .gray
        cell.cellType = imageCollectionViewType
        if let photo = photosRepo?.photo?[indexPath.row]{
            cell.bindData(flickrPhoto: photo)
        }
        return cell
    }
    
}
