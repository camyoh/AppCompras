//
//  RepositoryProtocol.swift
//  Meli-test
//
//  Created by Andres Mendieta on 26/03/24.
//

import Foundation

protocol RepositoryProtocol {
    func fetchResults(for: String, page: Int) async throws -> ResultsEntity
    func fetchSuggestions(for: String) async throws -> SuggestionEntity
    func fetchItemWith(id: String) async throws -> ItemEntity
}
