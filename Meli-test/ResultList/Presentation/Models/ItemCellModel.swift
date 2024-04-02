//
//  ItemCellModel.swift
//  Meli-test
//
//  Created by Andres Mendieta on 1/04/24.
//

import UIKit

class ItemCellModel {
    let title: String
    let subtitle: String
    var image: UIImageView

    init(title: String, subtitle: String, image: UIImageView) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
