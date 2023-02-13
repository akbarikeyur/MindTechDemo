//
//  HomeModel.swift
//  MindTechDemo
//
//  Created by Hash Technocrats on 10/02/23.
//

import Foundation

// MARK: - ProductModel
struct ProductModel: Codable {
    let name: String
    let imageURL: String
    let slots: [SubProductModel]
    
    enum CodingKeys: String, CodingKey {
        case name, slots
        case imageURL = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? DocumentDefaultValues.Empty.string
        imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL) ?? DocumentDefaultValues.Empty.string
        slots = try values.decodeIfPresent([SubProductModel].self, forKey: .slots) ?? [SubProductModel]()
    }
    
    init() {
        name = DocumentDefaultValues.Empty.string
        imageURL = DocumentDefaultValues.Empty.string
        slots = [SubProductModel]()
    }
}

// MARK: - SlotModel
struct SubProductModel: Codable {
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? DocumentDefaultValues.Empty.string
        imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL) ?? DocumentDefaultValues.Empty.string
    }
    
    init() {
        name = DocumentDefaultValues.Empty.string
        imageURL = DocumentDefaultValues.Empty.string
    }
}
