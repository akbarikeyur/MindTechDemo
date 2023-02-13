//
//  Utility.swift
//  MindTechDemo
//
//  Created by Hash Technocrats on 10/02/23.
//

import Foundation
import SDWebImage

//MARK: - downloadCachedImage
extension UIImageView{
    func downloadCachedImage(placeholder: String,urlString: String){
        let options: SDWebImageOptions = [.scaleDownLargeImages, .continueInBackground, .avoidAutoSetImage]
        let placeholder = UIImage(named: placeholder)
        self.sd_setImage(with: URL(string: urlString), placeholderImage: placeholder, options: options) { (image, _, cacheType,_ ) in
            //self.sainiRemoveLoader()
            guard image != nil else {
                //self.sainiRemoveLoader()
                return
            }
            guard cacheType != .memory, cacheType != .disk else {
                self.image = image
                //self.sainiRemoveLoader()
                return
            }
            UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: {
                //self.sainiRemoveLoader()
                self.image = image
                return
            }, completion: nil)
        }
    }
    
    func downloadImage(placeholder: String,urlString: String){
        let options: SDWebImageOptions = [.scaleDownLargeImages, .continueInBackground, .avoidAutoSetImage]
        let placeholder = UIImage(named: placeholder)
        self.sd_setImage(with: URL(string: urlString), placeholderImage: placeholder, options: options) { (image, _, cacheType,_ ) in
            //self.sainiRemoveLoader()
            guard image != nil else {
                //self.sainiRemoveLoader()
                return
            }
            guard cacheType != .memory, cacheType != .disk else {
                self.image = image
                //self.sainiRemoveLoader()
                return
            }
            UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: {
                //self.sainiRemoveLoader()
                self.image = image
                return
            }, completion: nil)
        }
    }
}

extension String {
    var trimmed:String{
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
