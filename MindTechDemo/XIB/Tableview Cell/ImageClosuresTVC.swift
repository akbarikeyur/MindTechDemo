//
//  ImageClosuresTVC.swift
//  MindTechDemo
//
//  Created by Hash Technocrats on 13/02/23.
//

import UIKit

protocol ImageClosuresDelegate {
    func didSelectImageClosures(_ index : Int)
}

class ImageClosuresTVC: UITableViewCell {

    @IBOutlet weak var imageCV: UICollectionView!
    @IBOutlet weak var myPageControl: UIPageControl!
    
    var homeVM = HomeViewModel()
    var delegate : ImageClosuresDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerCollectionView()
    }

    func setupDetail() {
        myPageControl.numberOfPages = homeVM.itemList.value.count
        imageCV.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK:- Collectionview Method
extension ImageClosuresTVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func registerCollectionView() {
        imageCV.register(UINib.init(nibName: COLLECTION_VIEW_CELL.ImageCVC.rawValue, bundle: nil), forCellWithReuseIdentifier: COLLECTION_VIEW_CELL.ImageCVC.rawValue)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeVM.itemList.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN.WIDTH, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ImageCVC = imageCV.dequeueReusableCell(withReuseIdentifier: COLLECTION_VIEW_CELL.ImageCVC.rawValue, for: indexPath) as! ImageCVC
        cell.setupDetails(homeVM.itemList.value[indexPath.row])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView == imageCV) {
            myPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
            delegate?.didSelectImageClosures(myPageControl.currentPage)

        }
        
    }
}
