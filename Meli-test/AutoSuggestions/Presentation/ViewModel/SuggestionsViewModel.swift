//
//  SuggestionsViewModel.swift
//  Meli-test
//
//  Created by Andres Mendieta on 27/03/24.
//

import Foundation

class SuggestionsViewModel {
    weak var coordinator: CoordinatorProtocol?
    private let useCase: FetchSuggestionsUseCaseProtocol
    private var error: ApiError? = nil
    var model = SuggestionsModel()

    init(
        coordinator: CoordinatorProtocol? = nil,
        useCase: FetchSuggestionsUseCaseProtocol
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
    }

    func fetchSuggestions(for word: String) async {
        do {
            let data = try await useCase.getSuggestions(for: word)
            model = mapToSearchModel(from: data)
        } catch {
            self.error = error as? ApiError
            coordinator?.showAlert(for: self.error)
        }
    }

    func clearSuggestions() {
        model.suggestions = []
    }

    func showResultsFor(searchedText: String?) {
        guard let searchedText, !searchedText.isEmpty else { return }
        coordinator?.list(searchText: searchedText)
    }

    private func mapToSearchModel(from suggestionsModel: SuggestionEntity) -> SuggestionsModel {
        let suggestions = suggestionsModel.suggestedQueries.map { suggestion in
            suggestion.q
        }
        return SuggestionsModel(suggestions: suggestions)
    }
}
