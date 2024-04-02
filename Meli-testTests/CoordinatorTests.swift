//
//  CoordinatorTests.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 2/04/24.
//

import XCTest
@testable import Meli_test

final class CoordinatorTests: XCTestCase {
    var sut: Coordinator!
    var navigationController: UINavigationController!

    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        sut = Coordinator(navigationController: navigationController)
    }

    override func tearDown() {
        navigationController = nil
        sut = nil
        super.tearDown()
    }

    func testStart_navigationControllerShuoldHaveSuggestionsViewController() {
        // When
        sut.start()

        // Then
        XCTAssertTrue(navigationController.viewControllers.count == 1)
        XCTAssertTrue(navigationController.viewControllers.first is SuggestionsViewController)
    }

    func testStart_navigationControllerShuoldHaveListViewController() {
        // Given
        let text = "iphone"

        // When
        sut.list(searchText: text)

        // Then
        XCTAssertTrue(navigationController.viewControllers.count == 1)
        XCTAssertTrue(navigationController.viewControllers.first is ListViewController)
    }

    func testStart_navigationControllerShuoldHaveDetailViewController() {
        // Given
        let itemID = "iphone_id"

        // When
        sut.detailOf(itemId: itemID)

        // Then
        XCTAssertTrue(navigationController.viewControllers.count == 1)
        XCTAssertTrue(navigationController.viewControllers.first is DetailViewController)
    }
}
