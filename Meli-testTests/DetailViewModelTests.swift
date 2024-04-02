//
//  DetailViewModelTests.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 2/04/24.
//

import XCTest
@testable import Meli_test

final class DetailViewModelTests: XCTestCase {

    var sut: DetailViewModel!
    var coordinator: CoordinatorMock!
    var useCase: FetchItemUseCaseMock!

    override func setUp() {
        super.setUp()
        useCase = FetchItemUseCaseMock()
        coordinator = CoordinatorMock()
        sut = DetailViewModel(coordinator: coordinator, useCase: useCase)
    }

    override func tearDown() {
        sut = nil
        useCase = nil
        coordinator = nil
        super.tearDown()
    }

    func testAttributesText_withValue_returnNameValueText() async {
        // Given
        let id = "id"
        let item = Stubs.item
        let expectedAtributesText = "- version: 1.0\n"
        useCase.result = .success(item)

        // When
        await sut.fetchItemWith(id: id)

        // Then
        XCTAssertEqual(sut.attributesText, expectedAtributesText)
    }

    func testAttributesText_withoutValue_returnOnlyName() async {
        // Given
        let id = "id"
        let item = Stubs.itemNoValueInAttributes
        let expectedAtributesText = "- version\n"
        useCase.result = .success(item)

        // When
        await sut.fetchItemWith(id: id)

        // Then
        XCTAssertEqual(sut.attributesText, expectedAtributesText)
    }

    func testFetchItemWith_withError_shouldShowAler() async {
        // Given
        let id = "id"
        useCase.result = .failure(ApiError.requestFailed)

        // When
        await sut.fetchItemWith(id: id)

        // Then
        print("respuesta calledmethods \(coordinator.calledMethods)")
        XCTAssertTrue(coordinator.calledMethods.contains(.alert))
    }


}
