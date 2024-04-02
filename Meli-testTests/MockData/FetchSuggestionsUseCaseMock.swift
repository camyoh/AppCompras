//
//  FetchSuggestionsUseCaseMock.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 2/04/24.
//

import Foundation
@testable import Meli_test

class FetchSuggestionsUseCaseMock: FetchSuggestionsUseCaseProtocol {
    enum Methods {
        case getSuggestions
    }

    var calledMethods: [Methods] = []
    var result: Result<SuggestionEntity, ApiError>!

    func getSuggestions(for: String) async throws -> SuggestionEntity {
        calledMethods.append(.getSuggestions)

        switch result {
            case .success(let success):
                return success
            case .failure(let failure):
                throw failure
            case .none:
                throw ApiError.requestFailed
        }
    }
}

class FetchItemUseCaseMock: FetchItemUseCaseProtocol {
    enum Methods {
        case getItemWith
    }

    var calledMethods: [Methods] = []
    var result: Result<ItemEntity, ApiError>!

    func getItemWith(id: String) async throws -> ItemEntity {
        calledMethods.append(.getItemWith)

        switch result {
            case .success(let success):
                return success
            case .failure(let failure):
                throw failure
            case .none:
                throw ApiError.requestFailed
        }
    }
}

class FetchResultsUseCaseMock: FetchResultsUseCaseProtocol {

    enum Methods {
        case getResults
    }

    var calledMethods: [Methods] = []
    var result: Result<ResultsEntity, ApiError>!

    func getResults(for: String, page: Int) async throws -> ResultsEntity {
        calledMethods.append(.getResults)

        switch result {
            case .success(let success):
                return success
            case .failure(let failure):
                throw failure
            case .none:
                throw ApiError.requestFailed
        }
    }
}
