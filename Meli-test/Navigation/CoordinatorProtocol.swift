//
//  CoordinatorProtocol.swift
//  Meli-test
//
//  Created by Andres Mendieta on 25/03/24.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }

    func start()
    func list(searchText: String)
    func detailOf(itemId: String)
    func showAlert(for error: ApiError?)
}
