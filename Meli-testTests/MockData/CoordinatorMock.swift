//
//  CoordinatorMock.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 2/04/24.
//

import UIKit
@testable import Meli_test

class CoordinatorMock: CoordinatorProtocol {
    
    var navigationController = UINavigationController()
    enum Methods {
        case start
        case list
        case detail
        case alert
    }

    var calledMethods: [Methods] = []

    func start() {
        calledMethods.append(.start)
    }

    func list(searchText: String) {
        calledMethods.append(.list)
    }

    func detailOf(itemId: String) {
        calledMethods.append(.detail)
    }

    func showAlert(for error: Meli_test.ApiError?) {
        calledMethods.append(.alert)
    }
}
