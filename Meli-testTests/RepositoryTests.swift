//
//  RepositoryTests.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 1/04/24.
//

import XCTest
@testable import Meli_test

final class RepositoryTests: XCTestCase {
    var sut: Repository!
    var servicesManager: ServicesManagerMock!

    override func setUp() {
        super.setUp()
        servicesManager = ServicesManagerMock()
        sut = Repository(servicesManager: servicesManager)
    }

    override func tearDown() {
        sut = nil
        servicesManager = nil
        super.tearDown()
    }

    func testFetchItemWith_returnItem() async throws {
        // Given
        let id = "id"
        let item = Stubs.item
        servicesManager.result = .success(item)

        // When
        let entity = try await sut.fetchItemWith(id:id)

        // Then
        XCTAssertEqual(entity.id, item.id)
    }

    func testFetchItemWith_throwDecodingError() async throws {
        // Given
        let id = "id"
        let decodingError = ApiError.decodingError
        servicesManager.result = .failure(decodingError)

        // When
        do {
            _ = try await sut.fetchItemWith(id:id)
        } catch {
            XCTAssertTrue(error is ApiError)
            XCTAssertEqual(error as! ApiError, decodingError)
        }
    }

    func testFetchResults_returnResults() async throws {
        // Given
        let item = "iphone"
        let results = Stubs.results
        servicesManager.result = .success(results)

        // When
        let entity = try await sut.fetchResults(for: item)

        // Then
        XCTAssertEqual(entity.siteID, results.siteID)
    }

    func testFetchResults_throwDecodingError() async throws {
        // Given
        let item = "iphone"
        let decodingError = ApiError.decodingError
        servicesManager.result = .failure(decodingError)

        // When
        do {
            _ = try await sut.fetchResults(for: item)
        } catch {
            XCTAssertTrue(error is ApiError)
            XCTAssertEqual(error as! ApiError, decodingError)
        }
    }

    func testFetchSuggestions_returnSuggestions() async throws {
        // Given
        let item = "iphone"
        let results = Stubs.suggestions
        servicesManager.result = .success(results)

        // When
        let entity = try await sut.fetchSuggestions(for: item)

        // Then
        XCTAssertEqual(entity.q, results.q)
    }

    func testFetchSuggestions_throwDecodingError() async throws {
        // Given
        let item = "iphone"
        let decodingError = ApiError.decodingError
        servicesManager.result = .failure(decodingError)

        // When
        do {
            _ = try await sut.fetchSuggestions(for: item)
        } catch {
            XCTAssertTrue(error is ApiError)
            XCTAssertEqual(error as! ApiError, decodingError)
        }
    }

}


