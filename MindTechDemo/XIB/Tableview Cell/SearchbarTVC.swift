//
//  SearchbarTVC.swift
//  MindTechDemo
//
//  Created by Hash Technocrats on 13/02/23.
//

import UIKit

protocol SearchbarDelegate {
    func didChangeSearch(_ search : String)
}

class SearchbarTVC: UITableViewCell, UISearchBarDelegate {

    @IBOutlet weak var searchTxt: UISearchBar!
    
    var delegate : SearchbarDelegate?
    var timer : Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if timer != nil {
            timer?.invalidate()
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { time in
            self.delegate?.didChangeSearch(searchText)
        })
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
