//
//  ResultsEntity.swift
//  Meli-test
//
//  Created by Andres Mendieta on 26/03/24.
//

import Foundation

struct ResultsEntity: Codable {
    let siteID, countryDefaultTimeZone, query: String
    let paging: Paging
    let results: [ResultEntity]
    let sort: Sort
    let availableSorts: [Sort]
    let filters: [Filter]
    let availableFilters: [AvailableFilter]

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging, results, sort
        case availableSorts = "available_sorts"
        case filters
        case availableFilters = "available_filters"
    }
}

struct AvailableFilter: Codable {
    let id, name: String
    let type: String
    let values: [AvailableFilterValue]
}

struct AvailableFilterValue: Codable {
    let id, name: String
    let results: Int?
}

struct Sort: Codable {
    let id, name: String
}

struct Filter: Codable {
    let id, name: String
    let type: String
    let values: [FilterValue]
}

struct FilterValue: Codable {
    let id, name: String
    let pathFromRoot: [Sort]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case pathFromRoot = "path_from_root"
    }
}

struct Paging: Codable {
    let total, primaryResults, offset, limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}

struct ResultEntity: Codable {
    let id, title, thumbnailID: String
    let thumbnail: String
    let price: Int
    let officialStoreName: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case thumbnailID = "thumbnail_id"
        case thumbnail
        case price
        case officialStoreName = "official_store_name"
    }
}

struct Attribute: Codable {
    let id, name: String
    let valueName, valueID: String?
    let attributeGroupID, attributeGroupName: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case attributeGroupID = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
    }
}

struct Seller: Codable {
    let id: Int
    let nickname: String
}

struct Shipping: Codable {
    let storePickUp, freeShipping: Bool
    let mode: String
    let logisticType: String?
    let tags: [String]

    enum CodingKeys: String, CodingKey {
        case storePickUp = "store_pick_up"
        case freeShipping = "free_shipping"
        case logisticType = "logistic_type"
        case mode, tags
    }
}
