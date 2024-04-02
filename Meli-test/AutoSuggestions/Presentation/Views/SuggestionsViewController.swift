//
//  SuggestionsViewController.swift
//  Meli-test
//
//  Created by Andres Mendieta on 24/03/24.
//

import UIKit

class SuggestionsViewController: UIViewController {
    
    private let viewModel: SuggestionsViewModel

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.placeholder = AppConstants.searchBarPlaceholder
        return searchController
    }()

    init(viewModel: SuggestionsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = AppConstants.searchViewTitle
        setupSearchBar()
        setupTableView()
    }

    private func setupSearchBar() {
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = AppConstants.searchBarCancelText
        navigationItem.searchController = searchController
    }

    private func setupTableView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

// MARK: - SearchBar Protocols
extension SuggestionsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else {
            viewModel.clearSuggestions()
            tableView.reloadData()
            return
        }
        Task.init {
            await viewModel.fetchSuggestions(for: text)
            tableView.reloadData()
        }
    }
}

extension SuggestionsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.showResultsFor(searchedText: searchBar.text)
    }
}

// MARK: - TableView Protocols
extension SuggestionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.suggestions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        var content = cell.defaultContentConfiguration()
        content.text = viewModel.model.suggestions[indexPath.row]
        cell.contentConfiguration = content

        return cell
    }
}

extension SuggestionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.searchBar.searchTextField.text = viewModel.model.suggestions[indexPath.row]
        viewModel.showResultsFor(searchedText: viewModel.model.suggestions[indexPath.row])
    }
}

