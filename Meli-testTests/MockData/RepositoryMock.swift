//
//  RepositoryMock.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 1/04/24.
//

import Foundation
@testable import Meli_test

class RepositoryMock: RepositoryProtocol {
    enum Methods {
        case fetchResults
        case fetchSuggestions
        case fetchItemWith
    }

    var calledMethods: [Methods] = []
    var results: Result<ResultsEntity, ApiError>!
    var suggestions: Result<SuggestionEntity, ApiError>!
    var item: Result<ItemEntity, ApiError>!

    func fetchResults(for: String, page: Int) async throws -> ResultsEntity {
        calledMethods.append(.fetchResults)

        switch results {
            case .success(let success):
                return success
            case .failure:
                throw ApiError.requestFailed
            case .none:
                throw ApiError.requestFailed
        }
    }
    
    func fetchSuggestions(for: String) async throws -> SuggestionEntity {
        calledMethods.append(.fetchSuggestions)

        switch suggestions {
            case .success(let success):
                return success
            case .failure(let failure):
                throw failure
            case .none:
                throw ApiError.requestFailed
        }
    }
    
    func fetchItemWith(id: String) async throws -> ItemEntity {
        calledMethods.append(.fetchItemWith)

        switch item {
            case .success(let success):
                return success
            case .failure(let failure):
                throw failure
            case .none:
                throw ApiError.requestFailed
        }
    }
    

}
