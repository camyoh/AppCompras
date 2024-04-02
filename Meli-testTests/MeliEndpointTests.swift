//
//  MeliEndpointTests.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 1/04/24.
//

import XCTest
@testable import Meli_test

final class MeliEndpointTests: XCTestCase {

    func testUrlString_searchUrl() {
        // Given
        let searchEndpoint = MeliEndpoint.search(item: "item", page: 0)
        let expectedUrlString = "https://api.mercadolibre.com/sites/MCO/search"

        // When
        let urlString = searchEndpoint.urlString

        // Then
        XCTAssertEqual(urlString, expectedUrlString)
    }

    func testUrlString_suggestionsUrl() {
        // Given
        let suggestionsEndpoint = MeliEndpoint.autoSuggestions(searchedWord: "word")
        let expectedUrlString = "https://http2.mlstatic.com/resources/sites/MCO/autosuggest"

        // When
        let urlString = suggestionsEndpoint.urlString

        // Then
        XCTAssertEqual(urlString, expectedUrlString)
    }

    func testUrlString_itemDetailsUrl() {
        // Given
        let itemDetailsEndpoint = MeliEndpoint.itemDetails(id: "MCO_ITEM")
        let expectedUrlString = "https://api.mercadolibre.com/items/MCO_ITEM"

        // When
        let urlString = itemDetailsEndpoint.urlString

        // Then
        XCTAssertEqual(urlString, expectedUrlString)
    }

    func testAsUrl_searchUrl() {
        // Given
        let searchEndpoint = MeliEndpoint.search(item: "item", page: 0)
        let expectedUrl = URL(string: "https://api.mercadolibre.com/sites/MCO/search?q=item&offset=0")

        // When
        let url = try! searchEndpoint.asUrl()

        // Then
        XCTAssertEqual(url, expectedUrl)
    }

    func testAsUrl_autoSuggestionsUrl() {
        // Given
        let suggestionsEndpoint = MeliEndpoint.autoSuggestions(searchedWord: "word")
        let expectedUrl = URL(string: "https://http2.mlstatic.com/resources/sites/MCO/autosuggest?q=word")

        // When
        let url = try! suggestionsEndpoint.asUrl()

        // Then
        XCTAssertEqual(url, expectedUrl)
    }

    func testAsUrl_itemDetailsUrl() {
        // Given
        let itemDetailsEndpoint = MeliEndpoint.itemDetails(id: "MCO_ITEM")
        let expectedUrl = URL(string: "https://api.mercadolibre.com/items/MCO_ITEM")

        // When
        let url = try! itemDetailsEndpoint.asUrl()

        // Then
        XCTAssertEqual(url, expectedUrl)
    }



}
