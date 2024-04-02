//
//  Repository.swift
//  Meli-test
//
//  Created by Andres Mendieta on 26/03/24.
//

import Foundation

class Repository: RepositoryProtocol {
    private let servicesManager: ServicesManagerProtocol

    init(
        servicesManager: ServicesManagerProtocol = ServicesManager(apiClient: URLSessionAPIClient(),
                                                           dataDecoder: JSONDecoderWrapper())
    ) {
        self.servicesManager = servicesManager
    }

    func fetchItemWith(id: String) async throws -> ItemEntity {
        guard let apiUrl = try? MeliEndpoint.itemDetails(id: id).asUrl() else {
            throw ApiError.invalidURL
        }

        do {
            return try await servicesManager.request(apiUrl, entity: ItemEntity.self)
        } catch {
            throw error
        }
    }

    func fetchResults(for item: String, page: Int = 0) async throws -> ResultsEntity{
        guard let apiUrl = try? MeliEndpoint.search(item: item, page: page).asUrl() else {
            throw ApiError.invalidURL
        }

        do {
            return try await servicesManager.request(apiUrl, entity: ResultsEntity.self)
        } catch {
            print(error)
            throw error
        }
    }

    func fetchSuggestions(for word: String) async throws -> SuggestionEntity {
        guard let apiUrl = try? MeliEndpoint.autoSuggestions(searchedWord: word).asUrl()  else {
            throw ApiError.invalidURL
        }

        do {
            return try await servicesManager.request(apiUrl, entity: SuggestionEntity.self)
        } catch {
            throw error
        }
    }
}
