//
//  FetchItemUseCaseProtocol.swift
//  Meli-test
//
//  Created by Andres Mendieta on 30/03/24.
//

import Foundation

protocol FetchItemUseCaseProtocol {
    func getItemWith(id: String) async throws -> ItemEntity
}
