//
//  MeliEndpoint.swift
//  Meli-test
//
//  Created by Andres Mendieta on 31/03/24.
//

import Foundation

enum MeliEndpoint {
    case search(item: String, page: Int)
    case autoSuggestions(searchedWord: String)
    case itemDetails(id: String)

    var urlString: String {
        switch self {
            case .search:
                return "https://api.mercadolibre.com/sites/COUNTRY_CODE/search".replacingOccurrences(of: AppConstants.countryPlaceholder, with: Utils.getCountry())
            case .autoSuggestions:
                return "https://http2.mlstatic.com/resources/sites/COUNTRY_CODE/autosuggest".replacingOccurrences(of: AppConstants.countryPlaceholder, with: Utils.getCountry())
            case .itemDetails(id: let id):
                return "https://api.mercadolibre.com/items/\(id)"
        }
    }

    func asUrl() throws -> URL {
        guard let url = URL(string: urlString) else { throw ApiError.invalidURL }

        switch self {
            case .search(item: let item, page: let page):
                let itemQuery = URLQueryItem(name: "q", value: item)
                let offsetQuery = URLQueryItem(name: "offset", value: String(page))
                return url.appending(queryItems: [itemQuery, offsetQuery])
            case .autoSuggestions(searchedWord: let searchedWord):
                let searchedWordQuery = URLQueryItem(name: "q", value: searchedWord)
                return url.appending(queryItems: [searchedWordQuery])
            case .itemDetails:
                return url
        }
    }
}
