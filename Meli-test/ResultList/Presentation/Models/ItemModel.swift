//
//  ListModel.swift
//  Meli-test
//
//  Created by Andres Mendieta on 27/03/24.
//

import Foundation

struct ItemModel {
    let id: String
    let title: String
    let price: Int
    let imageUrl: String
    let imageID: String
    let store: String?
    var formattedPrice: String {
        return "\(price.formatted(.currency(code: Utils.getCountryCurrency())))"
    }

    init(
        id: String = "",
        title: String = "",
        price: Int = 0,
        imageUrl: String = "",
        imageID: String = "",
        store: String? = nil
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.imageUrl = imageUrl
        self.imageID = imageID
        self.store = store
    }
}
