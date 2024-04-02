//
//  Stubs.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 2/04/24.
//

import Foundation
@testable import Meli_test

struct Stubs {
    static var item = ItemEntity(
        id: "123",
        title: "title",
        price: 1,
        warranty: nil,
        pictures: [ItemPicture(id: "id", url: "url", secureURL: "secure")],
        attributes: [ItemAttribute(id: "id", name: "version", valueName: "1.0")]
    )

    static var itemNoValueInAttributes = ItemEntity(
        id: "123",
        title: "title",
        price: 1,
        warranty: nil,
        pictures: [ItemPicture(id: "id", url: "url", secureURL: "secure")],
        attributes: [ItemAttribute(id: "id", name: "version", valueName: nil)]
    )

    static var results = ResultsEntity(
        siteID: "MCO",
        countryDefaultTimeZone: "",
        query: "",
        paging: Paging(total: 1, primaryResults: 1, offset: 0, limit: 6),
        results: [ResultEntity(id: "id",
                               title: "iphone",
                               thumbnailID: "",
                               thumbnail: "",
                               price: 1000,
                               officialStoreName: nil)],
        sort: Sort(id: "id", name: "name"),
        availableSorts: [],
        filters: [],
        availableFilters: []
    )

    static var suggestions = SuggestionEntity(
        q: "ip",
        suggestedQueries: [SuggestedQuery(q: "iphone", matchStart: 1, matchEnd: 1)]
    )
}
