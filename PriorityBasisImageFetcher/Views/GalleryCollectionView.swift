//
//  GalleryCollectionView.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 09/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class GalleryCollectionView: UICollectionView {
    func commonInit(){
        self.register(UINib.init(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GalleryCollectionViewCell")
    }
}

extension GalleryCollectionView : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as! GalleryCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
    
}
