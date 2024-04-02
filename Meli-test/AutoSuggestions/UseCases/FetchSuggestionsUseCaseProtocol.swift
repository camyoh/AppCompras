//
//  FetchSuggestionsUseCaseProtocol.swift
//  Meli-test
//
//  Created by Andres Mendieta on 27/03/24.
//

import Foundation

protocol FetchSuggestionsUseCaseProtocol {
    func getSuggestions(for: String) async throws -> SuggestionEntity
}
