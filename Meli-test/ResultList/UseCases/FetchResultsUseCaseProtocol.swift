//
//  FetchResultsUseCaseProtocol.swift
//  Meli-test
//
//  Created by Andres Mendieta on 27/03/24.
//

import Foundation

protocol FetchResultsUseCaseProtocol {
    func getResults(for: String, page: Int) async throws -> ResultsEntity
}
