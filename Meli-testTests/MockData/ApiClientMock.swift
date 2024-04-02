//
//  ApiClientMock.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 1/04/24.
//

import Foundation
@testable import Meli_test

class ApiClientMock: ApiClientProtocol {
    enum Methods {
        case fetchData
    }

    var calledMethods: [Methods] = []
    var dataResult: Result<Data, ApiError>!

    func fetchData(from url: URL) async throws -> Data {
        calledMethods.append(.fetchData)

        switch dataResult {
            case .success(let success):
                return success
            case .failure(let error):
                throw error
            case .none:
                throw ApiError.requestFailed
        }
    }
}
