//
//  SuggestionsViewModelTests.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 2/04/24.
//

import XCTest
@testable import Meli_test

final class SuggestionsViewModelTests: XCTestCase {

    var sut: SuggestionsViewModel!
    var coordinator: CoordinatorMock!
    var useCase: FetchSuggestionsUseCaseMock!

    override func setUp() {
        super.setUp()
        useCase = FetchSuggestionsUseCaseMock()
        coordinator = CoordinatorMock()
        sut = SuggestionsViewModel(coordinator: coordinator, useCase: useCase)
    }

    override func tearDown() {
        sut = nil
        useCase = nil
        coordinator = nil
        super.tearDown()
    }

    func testFetchSuggestions_getData() async throws {
        // Given
        let word = "iphone"
        useCase.result = .success(Stubs.suggestions)
        let expectedSuggestion = Stubs.suggestions.suggestedQueries.first?.q

        // When
        await sut.fetchSuggestions(for: word)

        // Then
        XCTAssertEqual(sut.model.suggestions.first, expectedSuggestion)
    }

    func testFetchSuggestions_getError() async throws {
        // Given
        let word = "iphone"
        useCase.result = .failure(ApiError.requestFailed)

        // When
        await sut.fetchSuggestions(for: word)

        // Then
        XCTAssertTrue(coordinator.calledMethods.contains(.alert))
    }

    func testClearSuggestions_shouldBeEmpty() {
        // Given
        sut.model.suggestions = ["iphone", "Samsung"]

        // When
        sut.clearSuggestions()

        // Then
        XCTAssertTrue(sut.model.suggestions.isEmpty)
    }

    func testShowResultsFor_withText_shouldCallListView() {
        // Given
        let searchedText = "iphone"

        // When
        sut.showResultsFor(searchedText: searchedText)

        // Then
        XCTAssertTrue(coordinator.calledMethods.contains(.list))
    }

    func testShowResultsFor_withNoText_shouldReturn() {
        // Given
        let searchedText: String? = nil

        // When
        sut.showResultsFor(searchedText: searchedText)

        // Then
        XCTAssertTrue(coordinator.calledMethods.isEmpty)
    }
}
