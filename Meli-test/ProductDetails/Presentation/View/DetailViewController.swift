//
//  DetailViewController.swift
//  Meli-test
//
//  Created by Andres Mendieta on 26/03/24.
//

import UIKit

class DetailViewController: UIViewController {
    private let itemId: String
    private let viewModel: DetailViewModel

    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.numberOfLines = 0

        return title
    }()

    private lazy var priceLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 22)
        title.numberOfLines = 1

        return title
    }()

    private lazy var warrantyLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 14)
        title.numberOfLines = 1

        return title
    }()

    private lazy var attributesText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false

        return textView
    }()

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "shippingbox")
        return image
    }()

    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 15
        stack.isHidden = true
        return stack
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false

        return spinner
    }()

    init(
        itemId: String,
        viewModel: DetailViewModel
    ) {
        self.itemId = itemId
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Detalles"

        setupViews()
        showSpinner()
        fetchItem()
    }

    private func setupViews() {
        view.addSubview(scrollView)
        view.addSubview(spinner)
        scrollView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(image)
        verticalStack.addArrangedSubview(priceLabel)
        verticalStack.addArrangedSubview(attributesText)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            verticalStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            verticalStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            verticalStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            image.heightAnchor.constraint(equalToConstant: 300),

            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func fetchItem() {
        Task.init {
            await viewModel.fetchItemWith(id: itemId)
            titleLabel.text = viewModel.model.title
            priceLabel.text = viewModel.model.formattedPrice
            attributesText.text = viewModel.attributesText
            if let imageUrl = URL(string: viewModel.model.pictureUrl) {
                image.sd_setImage(with: imageUrl) { [weak self] _, _, _, _ in
                    guard let self else { return }
                    self.showDetails()
                    self.hideSpinner()
                }
            }
        }
    }

    private func showSpinner() {
        spinner.startAnimating()
        spinner.isHidden = false
    }

    private func hideSpinner() {
        spinner.stopAnimating()
        spinner.isHidden = true
    }

    private func showDetails() {
        verticalStack.isHidden = false
    }
}
