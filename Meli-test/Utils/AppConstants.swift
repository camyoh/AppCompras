//
//  AppConstants.swift
//  Meli-test
//
//  Created by Andres Mendieta on 26/03/24.
//

import Foundation

struct AppConstants {
    static let countryPlaceholder = "COUNTRY_CODE"
    static let searchBarPlaceholder = "Busca en Mercado Libre"
    static let searchBarCancelText = "Cancelar"
    static let searchViewTitle = "Buscar"
}



enum Country: String {
    case argentina = "MLA"
    case brasil = "MLB"
    case chile = "MLC"
    case colombia = "MCO"
    case mexico = "MLM"
    case uruguay = "MLU"
    case venezuela = "MLV"
}
