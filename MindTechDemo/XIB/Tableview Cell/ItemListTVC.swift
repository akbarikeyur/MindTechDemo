//
//  ItemListTVC.swift
//  ITFAQ
//
//  Created by Keyur on 14/12/21.
//

import UIKit

class ItemListTVC: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupDetails(dict : SubProductModel) {
        imgView.downloadCachedImage(placeholder: "", urlString: dict.imageURL)
        nameLbl.text = dict.name
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
