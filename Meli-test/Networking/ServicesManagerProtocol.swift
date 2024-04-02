//
//  ServicesManagerProtocol.swift
//  Meli-test
//
//  Created by Andres Mendieta on 31/03/24.
//

import Foundation

protocol ServicesManagerProtocol {
    func request<T: Decodable>(_ url: URL, entity: T.Type) async throws -> T
}

class ServicesManager: ServicesManagerProtocol {
    private let apiClient: ApiClientProtocol
    private let dataDecoder: DataDecoderProtocol

    init(apiClient: ApiClientProtocol, dataDecoder: DataDecoderProtocol) {
        self.apiClient = apiClient
        self.dataDecoder = dataDecoder
    }

    func request<T>(_ url: URL, entity: T.Type) async throws -> T where T : Decodable {
        do {
            let data = try await apiClient.fetchData(from: url)
            let entity = try dataDecoder.decode(entity.self, from: data)
            return entity
        } catch {
            throw error
        }
    }
}
