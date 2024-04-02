//
//  Coordinator.swift
//  Meli-test
//
//  Created by Andres Mendieta on 25/03/24.
//

import UIKit

class Coordinator: CoordinatorProtocol {

    var navigationController: UINavigationController
    private let repository = Repository()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let useCase = FetchSuggestionsUseCase(repository: repository)
        let vm = SuggestionsViewModel(coordinator: self, useCase: useCase)
        let vc = SuggestionsViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }

    func list(searchText: String) {
        let useCase = FetchResultsUseCase(repository: repository)
        let vm = ListViewModel(coordinator: self, useCase: useCase)
        let vc = ListViewController(searchText: searchText, viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }

    func detailOf(itemId: String) {
        let useCase = FetchItemUseCase(repository: repository)
        let vm = DetailViewModel(coordinator: self, useCase: useCase)
        let vc = DetailViewController(itemId: itemId, viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAlert(for error: ApiError?) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }

            let alert = ErrorAlertFactory.make(for: error)
            navigationController.present(alert, animated: true)
        }
    }
}
