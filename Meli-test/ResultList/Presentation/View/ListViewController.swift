//
//  ListViewController.swift
//  Meli-test
//
//  Created by Andres Mendieta on 26/03/24.
//

import UIKit
import SDWebImage

class ListViewController: UIViewController {
    private let searchText: String
    private let viewModel: ListViewModel

    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .gray

        return spinner
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()


    init(
        searchText: String,
        viewModel: ListViewModel
    ) {
        self.searchText = searchText
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Resultados"
        view.backgroundColor = .white
        setupTableView()
        setupSpinner()
        showSpinner()
        fetchResults()
    }

    private func fetchResults() {
        Task.init {
            await viewModel.fetchResults(for: searchText)
            tableView.reloadData()
            hideSpinner()
        }
    }

    private func setupTableView() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupSpinner() {
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func showSpinner() {
        spinner.startAnimating()
        spinner.isHidden = false
    }

    private func hideSpinner() {
        spinner.stopAnimating()
        spinner.isHidden = true
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.count
    }

    // TODO: Replace with the itemCell model
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let listCell = ListCellTableViewCell(style: .default, reuseIdentifier: "ListCell")
        let defaultIcon = UIImage(systemName: "shippingbox")
        listCell.iconImageView.image = defaultIcon
        if let imageUrl = URL(string: viewModel.model[indexPath.row].imageUrl) {
            listCell.iconImageView.sd_setImage(with: imageUrl, placeholderImage: defaultIcon)
        }
        listCell.titleLabel.text = viewModel.model[indexPath.row].title
        listCell.subtitleLabel.text = viewModel.model[indexPath.row].formattedPrice
        listCell.selectionStyle = .none

        return listCell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.coordinator?.detailOf(itemId: viewModel.model[indexPath.row].id)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastIndexPath = tableView.indexPathsForVisibleRows?.last {
            if lastIndexPath.row == viewModel.model.count - 1 {
                fetchResults()
            }
        }
    }
}
