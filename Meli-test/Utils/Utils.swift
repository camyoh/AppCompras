//
//  Utils.swift
//  Meli-test
//
//  Created by Andres Mendieta on 1/04/24.
//

import Foundation

struct Utils {
    // TODO: Mirar con el location el país, y con un enum hacer match con los valores de países de meli.
    static func getCountry() -> String {
        Country.colombia.rawValue
    }

    static func getCountryCurrency() -> String {
        "COP"
    }
}
