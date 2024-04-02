//
//  FetchResultsUseCase.swift
//  Meli-test
//
//  Created by Andres Mendieta on 27/03/24.
//

import Foundation

class FetchResultsUseCase: FetchResultsUseCaseProtocol {
    private let repository: RepositoryProtocol

    init(repository: RepositoryProtocol) {
        self.repository = repository
    }

    func getResults(for searchedItem: String, page: Int = 0) async throws -> ResultsEntity {
        do {
            let results = try await repository.fetchResults(for: searchedItem, page: page)
            return results
        } catch {
            print(error)
            throw error
        }
    }

}
