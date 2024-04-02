//
//  UrlSessionAPIClient.swift
//  Meli-test
//
//  Created by Andres Mendieta on 26/03/24.
//

import Foundation

protocol ApiClientProtocol {
    func fetchData(from url: URL) async throws -> Data
}

class URLSessionAPIClient: ApiClientProtocol {
    func fetchData(from url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            if error is URLError {
                throw ApiError.noInternet
            }
            throw ApiError.requestFailed
        }
    }
}
