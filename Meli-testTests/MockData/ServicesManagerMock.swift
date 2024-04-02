//
//  ServicesManagerMock.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 1/04/24.
//

import Foundation
@testable import Meli_test

class ServicesManagerMock: ServicesManagerProtocol {
    enum Methods {
        case request
    }

    var calledMethods: [Methods] = []
    var result: Result<Decodable, ApiError>!

    func request<T>(_ url: URL, entity: T.Type) async throws -> T where T : Decodable {
        calledMethods.append(.request)
        
        switch result {
            case .success(let data):
                guard let decodedEntity = data as? T else {
                    throw ApiError.decodingError
                }
                return decodedEntity
            case .failure(let error):
                throw error
            case .none:
                throw ApiError.decodingError
        }
    }
}
