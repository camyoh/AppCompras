//
//  DetailModel.swift
//  Meli-test
//
//  Created by Andres Mendieta on 30/03/24.
//

import Foundation

struct DetailModel {
    let id: String
    let title: String
    let price: Int
    let warranty: String?
    let pictureUrl: String
    let attributes: [DetailAttributeModel]
    var formattedPrice: String {
        return "\(price.formatted(.currency(code: Utils.getCountryCurrency())))"
    }

    init(
        id: String = "",
        title: String = "",
        price: Int = 0,
        warranty: String? = nil,
        pictureUrl: String = "",
        attributes: [DetailAttributeModel] = []
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.warranty = warranty
        self.pictureUrl = pictureUrl
        self.attributes = attributes
    }
}

struct DetailAttributeModel {
    let name: String
    let value: String?
}
