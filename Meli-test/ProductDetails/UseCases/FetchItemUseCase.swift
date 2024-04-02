//
//  FetchItemUseCase.swift
//  Meli-test
//
//  Created by Andres Mendieta on 30/03/24.
//

import Foundation

class FetchItemUseCase: FetchItemUseCaseProtocol {
    private let repository: RepositoryProtocol

    init(repository: RepositoryProtocol) {
        self.repository = repository
    }

    func getItemWith(id: String) async throws -> ItemEntity {
        do {
            let results = try await repository.fetchItemWith(id: id)
            return results
        } catch {
            print(error)
            throw error
        }
    }
    

}
