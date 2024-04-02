//
//  SuggestionEntity.swift
//  Meli-test
//
//  Created by Andres Mendieta on 26/03/24.
//

import Foundation

struct SuggestionEntity: Codable {
    let q: String
    let suggestedQueries: [SuggestedQuery]

    enum CodingKeys: String, CodingKey {
        case q
        case suggestedQueries = "suggested_queries"
    }
}

struct SuggestedQuery: Codable {
    let q: String
    let matchStart, matchEnd: Int

    enum CodingKeys: String, CodingKey {
        case q
        case matchStart = "match_start"
        case matchEnd = "match_end"
    }
}
