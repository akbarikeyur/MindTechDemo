//
//  HomeVC.swift
//  MindTechDemo
//
//  Created by Hash Technocrats on 10/02/23.
//

import UIKit

class HomeVC: UIViewController {

    
    @IBOutlet weak var tblView: UITableView!
    
    var homeVM = HomeViewModel()
    var arrSlots = [SubProductModel]()
    var arrSearch = [SubProductModel]()
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configUI()
    }

    func configUI() {
        
        registerTableView()
        callAPI()
        bindAllData()
    }
}




extension HomeVC: UITableViewDelegate, UITableViewDataSource, ImageClosuresDelegate, SearchbarDelegate {
    func registerTableView() {
        tblView.register(UINib.init(nibName: TABLE_VIEW_CELL.ItemListTVC.rawValue, bundle: nil), forCellReuseIdentifier: TABLE_VIEW_CELL.ItemListTVC.rawValue)
        tblView.register(UINib.init(nibName: TABLE_VIEW_CELL.ImageClosuresTVC.rawValue, bundle: nil), forCellReuseIdentifier: TABLE_VIEW_CELL.ImageClosuresTVC.rawValue)
        tblView.register(UINib.init(nibName: TABLE_VIEW_CELL.SearchbarTVC.rawValue, bundle: nil), forCellReuseIdentifier: TABLE_VIEW_CELL.SearchbarTVC.rawValue)
//        tblView.tableHeaderView = searchTxt
        tblView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 1
        }else{
            return 56
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView.init()
        }else{
            let cell : SearchbarTVC = tblView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL.SearchbarTVC.rawValue) as! SearchbarTVC
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (searchTxt.text?.trimmed == "" ? arrSlots : arrSearch).count
        if(section == 0) {
            return 1
        }
        return (searchText != "" ? arrSearch : arrSlots).count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0) {
            let cell : ImageClosuresTVC = tblView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL.ImageClosuresTVC.rawValue) as! ImageClosuresTVC
            cell.delegate = self
            cell.homeVM = homeVM
            cell.setupDetail()
            return cell
        }
        else{
            let cell : ItemListTVC = tblView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL.ItemListTVC.rawValue) as! ItemListTVC
            cell.setupDetails(dict: (searchText != "" ? arrSearch : arrSlots)[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func didSelectImageClosures(_ index: Int) {
        arrSlots = homeVM.itemList.value[index].slots
        tblView.reloadData()
    }
    
    func didChangeSearch(_ search: String) {
        searchText = search
        if !search.trimmed.isEmpty {
            arrSearch = [SubProductModel]()
            arrSearch = arrSlots.filter({ (result) -> Bool in
                let nameTxt: NSString = result.name as NSString
                return (nameTxt.range(of: search, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
            })
        }
        
        tblView.reloadData()
    }
}

extension HomeVC {
    func callAPI() {
        homeVM.getAllItemData()
    }
    
    func bindAllData() {
        
        homeVM.itemList.bind { [weak self](_) in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                if self.homeVM.itemList.value.count > 0 {
                    self.arrSlots = self.homeVM.itemList.value.first!.slots
                }
                
                self.arrSearch = [SubProductModel]()
                self.tblView.reloadData()
            }
        }
    }
}
