//
//  FetchSuggestionsUseCase.swift
//  Meli-test
//
//  Created by Andres Mendieta on 27/03/24.
//

import Foundation

class FetchSuggestionsUseCase: FetchSuggestionsUseCaseProtocol {
    private let repository: RepositoryProtocol

    init(repository: RepositoryProtocol) {
        self.repository = repository
    }

    func getSuggestions(for searchedWord: String) async throws -> SuggestionEntity {
        do {
            let results = try await repository.fetchSuggestions(for: searchedWord)
            return results
        } catch {
            throw error
        }
    }

}
