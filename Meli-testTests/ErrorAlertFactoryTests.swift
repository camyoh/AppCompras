//
//  ErrorAlertFactoryTests.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 1/04/24.
//

import XCTest
@testable import Meli_test

final class ErrorAlertFactoryTests: XCTestCase {
    var error: ApiError!
    var alert: UIAlertController!

    override func setUp() {
        super.setUp()
        error = ApiError.noInternet
        alert = UIAlertController()
    }

    override func tearDown() {
        error = nil
        alert = nil
        super.tearDown()
    }

    func testMakeAlert_NoInternetConection() {
        // Given
        error = .noInternet
        let expectedAlertTitle = "Ups..."
        let expectedAlertMessage = "No tienes conexión a internet, intenta más tarde"

        // When
        alert = ErrorAlertFactory.make(for: error)

        // Then
        XCTAssertEqual(alert.title, expectedAlertTitle)
        XCTAssertEqual(alert.message, expectedAlertMessage)
        XCTAssertEqual(alert.actions.count, 1)
    }

    func testMakeAlert_invalidURL() {
        // Given
        error = .invalidURL
        let expectedAlertTitle = "Ups..."
        let expectedAlertMessage = "Tenemos problemas de nuestro lado, intenta más tarde"

        // When
        alert = ErrorAlertFactory.make(for: error)

        // Then
        XCTAssertEqual(alert.title, expectedAlertTitle)
        XCTAssertEqual(alert.message, expectedAlertMessage)
        XCTAssertEqual(alert.actions.count, 1)
    }

    func testMakeAlert_requestFailed() {
        // Given
        error = .requestFailed
        let expectedAlertTitle = "Ups..."
        let expectedAlertMessage = "Tenemos problemas de nuestro lado, intenta más tarde"

        // When
        alert = ErrorAlertFactory.make(for: error)

        // Then
        XCTAssertEqual(alert.title, expectedAlertTitle)
        XCTAssertEqual(alert.message, expectedAlertMessage)
        XCTAssertEqual(alert.actions.count, 1)
    }

    func testMakeAlert_invalidResponse() {
        // Given
        error = .invalidResponse
        let expectedAlertTitle = "Ups..."
        let expectedAlertMessage = "Tenemos problemas de nuestro lado, intenta más tarde"

        // When
        alert = ErrorAlertFactory.make(for: error)

        // Then
        XCTAssertEqual(alert.title, expectedAlertTitle)
        XCTAssertEqual(alert.message, expectedAlertMessage)
        XCTAssertEqual(alert.actions.count, 1)
    }

    func testMakeAlert_decodingError() {
        // Given
        error = .decodingError
        let expectedAlertTitle = "Ups..."
        let expectedAlertMessage = "Tenemos problemas de nuestro lado, intenta más tarde"

        // When
        alert = ErrorAlertFactory.make(for: error)

        // Then
        XCTAssertEqual(alert.title, expectedAlertTitle)
        XCTAssertEqual(alert.message, expectedAlertMessage)
        XCTAssertEqual(alert.actions.count, 1)
    }

    func testMakeAlert_default() {
        // Given
        error = .none
        let expectedAlertTitle = "Ups..."
        let expectedAlertMessage = "Tenemos problemas de nuestro lado, intenta más tarde"

        // When
        alert = ErrorAlertFactory.make(for: error)

        // Then
        XCTAssertEqual(alert.title, expectedAlertTitle)
        XCTAssertEqual(alert.message, expectedAlertMessage)
        XCTAssertEqual(alert.actions.count, 1)
    }

}
