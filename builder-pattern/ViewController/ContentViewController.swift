//
//  ContentViewController.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 03.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

class ContentViewController: BaseViewController {
    private let content: Content

    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = content.image
        

        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20.0, weight: content.textWeight)
        label.textAlignment = content.textAlignment
        label.textColor = content.textColor
        label.text = content.text
        label.numberOfLines = 0

        return label
    }()

    // MARK: - Init

    init(content: Content) {
        self.content = content

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Life Cycle

extension ContentViewController {
    override func loadView() {
        super.loadView()

        setUpSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = content.title
        view.backgroundColor = content.backgroundColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationItem.largeTitleDisplayMode = .never
    }
}

// MARK: - Layout

extension ContentViewController {
    private func setUpSubviews() {
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)

        imageView.addAnchors(
            top: view.layoutGuide.topAnchor, topPadding: 15.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            heightAnchor: imageView.widthAnchor,
            centerX: view.centerXAnchor
        )
        descriptionLabel.addAnchors(
            top: imageView.bottomAnchor, topPadding: 10.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            centerX: view.centerXAnchor
        )
    }
}
