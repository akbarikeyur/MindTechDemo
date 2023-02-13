//
//  ImageCVC.swift
//  ITFAQ
//
//  Created by Keyur on 13/12/21.
//

import UIKit

class ImageCVC: UICollectionViewCell {

    @IBOutlet weak var productImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setupDetails(_ dict: ProductModel) {
        productImgView.downloadCachedImage(placeholder: "", urlString: dict.imageURL)
    }

}
