//
//  DetailViewModel.swift
//  Meli-test
//
//  Created by Andres Mendieta on 30/03/24.
//

import Foundation

class DetailViewModel {
    weak var coordinator: CoordinatorProtocol?
    private let useCase: FetchItemUseCaseProtocol
    private var error: ApiError? = nil
    var model = DetailModel()

    var attributesText: String {
        var text = ""
        model.attributes.forEach { attributed in
            text.append("- \(attributed.name)")
            if let value = attributed.value {
                text.append(": \(value)\n")
            } else {
                text.append("\n")
            }
        }
        return text
    }

    init(
        coordinator: CoordinatorProtocol? = nil,
        useCase: FetchItemUseCaseProtocol
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
    }

    func fetchItemWith(id: String) async {
        do {
            let data = try await useCase.getItemWith(id: id)
            model = mapToDetailModel(from: data)
        } catch {
            self.error = error as? ApiError
            coordinator?.showAlert(for: self.error)
        }
    }

    private func mapToDetailModel(from item: ItemEntity) -> DetailModel {
        var attributes = [DetailAttributeModel]()

        if let newAttribute = item.attributes {
            attributes = newAttribute.map({ attribute in
                DetailAttributeModel(name: attribute.name,
                                     value: attribute.valueName)
            })
        }

        return DetailModel(id: item.id,
                    title: item.title,
                    price: item.price,
                    warranty: item.warranty,
                    pictureUrl: item.pictures.first?.secureURL ?? "",
                    attributes: attributes)
    }
}
