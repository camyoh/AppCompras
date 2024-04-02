//
//  ListViewModelTests.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 2/04/24.
//

import XCTest
@testable import Meli_test

final class ListViewModelTests: XCTestCase {
    var sut: ListViewModel!
    var coordinator: CoordinatorMock!
    var useCase: FetchResultsUseCaseMock!

    override func setUp() {
        super.setUp()
        useCase = FetchResultsUseCaseMock()
        coordinator = CoordinatorMock()
        sut = ListViewModel(coordinator: coordinator, useCase: useCase)
    }

    override func tearDown() {
        sut = nil
        useCase = nil
        coordinator = nil
        super.tearDown()
    }

    func testFetchResults_shouldUpdateModel() async {
        // Given
        let word = "iphone"
        let entity = Stubs.results
        let expectedTitle = entity.results.first?.title
        useCase.result = .success(entity)

        // When
        await sut.fetchResults(for: word)

        // Then
        XCTAssertEqual(sut.model.first?.title, expectedTitle)
    }

    func testFetchResults_withError_shouldShowAlert() async {
        // Given
        let word = "iphone"
        useCase.result = .failure(ApiError.requestFailed)

        // When
        await sut.fetchResults(for: word)

        // Then
        XCTAssertTrue(coordinator.calledMethods.contains(.alert))
    }


}
