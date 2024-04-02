//
//  ItemEntity.swift
//  Meli-test
//
//  Created by Andres Mendieta on 30/03/24.
//

import Foundation

struct ItemEntity: Codable {
    let id, title: String
    let price: Int
    let warranty: String?
    let pictures: [ItemPicture]
    let attributes: [ItemAttribute]?
}

struct ItemAttribute: Codable {
    let id, name: String
    let valueName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueName = "value_name"
    }
}

struct ItemPicture: Codable {
    let id: String
    let url: String
    let secureURL: String

    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
    }
}
