//
//  GalleryCollectionViewCell.swift
//  PriorityBasisImageFetcher
//
//  Created by S@nchit on 09/06/18.
//  Copyright © 2018 self. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contentImageView: UIImageView!
    var cellType = ImageCollectionViewType.twoImage
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(flickrPhoto : FlickrPhoto){
        let flickrImageEndPoint = FlickrImageEndPoint.init(photoId: flickrPhoto.id ?? "")
        RouterManager.sharedInstance.fetchData(for: flickrImageEndPoint, fetchType: .cache, success: { (imageSizeResponse : ImageSizeResponse) in
            if let sizesArray = imageSizeResponse.sizes?.imageSizes{
                for size in sizesArray{
                    if let label = size.label{
                        switch self.cellType{
                        case .twoImage:
                            if label == "Large Square"{
                                self.updateCell(with: size.sourceUrl ?? "")
                                break
                            }
                            break
                        case .threeImage:
                            if label == "Large Square"{
                                self.updateCell(with: size.sourceUrl ?? "")
                                break
                            }
                            break
                        case .fourImage:
                            if label == "Square"{
                                self.updateCell(with: size.sourceUrl ?? "")
                                break
                            }
                            break
                        }
                    }
                    
                }
            }
            
        }) { (error) in
            //
        }
    }

    func updateCell(with imageUrl : String){
        ImageRouterManager.sharedInstance.fetchImage(for: imageUrl, success: { (image) in
            DispatchQueue.main.async {
                self.contentImageView.image = image
            }
        }) { (error) in
            print(error)
        }
    }
}
