//
//  HomeViewModel.swift
//  MindTechDemo
//
//  Created by Hash Technocrats on 10/02/23.
//

import Foundation

protocol HomeViewDelegate {
    
    var itemList: Box<[ProductModel]> { get set }
    func getAllItemData()
    
}

public class HomeViewModel : HomeViewDelegate {
    
    var itemList: Box<[ProductModel]> = Box([])
    
    func getAllItemData()
    {
        if let filePath = Bundle.main.path(forResource: "product", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
            do {

                let success = try JSONDecoder().decode([ProductModel].self, from: data as Data) // decode the
                self.itemList.value = success.self
            }
            catch {
                //Handle error
            }
        }
    }
}
