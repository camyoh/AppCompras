//
//  ListViewModel.swift
//  Meli-test
//
//  Created by Andres Mendieta on 27/03/24.
//

import Foundation

class ListViewModel {
    weak var coordinator: CoordinatorProtocol?
    private let useCase: FetchResultsUseCaseProtocol
    private var pagination = 0
    var model = [ItemModel]()


    init(
        coordinator: CoordinatorProtocol? = nil,
        useCase: FetchResultsUseCaseProtocol
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
    }

    func fetchResults(for word: String) async {
        do {
            let data = try await useCase.getResults(for: word, page: pagination)
            let newItems = mapToListModel(from: data)
            model.append(contentsOf: newItems)
            pagination += 1
        } catch {
            if let error = error as? ApiError {
                coordinator?.showAlert(for: error)
            }
        }
    }

    private func mapToListModel(from resultsModel: ResultsEntity) -> [ItemModel] {
        let results = resultsModel.results.map { item in
            ItemModel(id: item.id,
                      title: item.title,
                      price: item.price,
                      imageUrl: item.thumbnail,
                      imageID: item.thumbnailID,
                      store: item.officialStoreName)
        }
        return results
    }
}
