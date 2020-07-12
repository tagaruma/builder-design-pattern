//
//  ViewController.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 29.05.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

struct Section {
    let title: String
    let items: [String]
}

class MainViewController: BaseViewController {
    private let cellReuseIdentifier: String = String(describing: UITableViewCell.self)
    private lazy var sections: [Section] = [
        Section(title: "Simple Builder", items: ["Movie", "Music", "Gaming", "Sports"]),
        Section(title: "Chained Builder", items: ["UITextField + UIButton"]),
        Section(title: "Complex Builder with Director", items: ["Sign Up Form"])
    ]

    private lazy var tableView = UITableView.build(style: .grouped) { tableView in
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = 32.0
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
}

// MARK: - Life Cycle

extension MainViewController {
    override func loadView() {
        super.loadView()

        setUpSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Builder Design Pattern"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Layout

extension MainViewController {
    private func setUpSubviews() {
        view.addSubview(tableView)
        tableView.addAnchors(
            top: view.layoutGuide.topAnchor,
            bottom: view.layoutGuide.bottomAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor
        )
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { sections.count }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { sections[section].items.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]

        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.section {
        case 0:
            let builder = ContentBuilder()
            let content: Content

            if indexPath.row == 0 {
                content = builder.build(for: .movie)
            } else if indexPath.row == 1 {
                content = builder.build(for: .music)
            } else if indexPath.row == 2 {
                content = builder.build(for: .gaming)
            } else {
                content = builder.build(for: .sports)
            }

            let viewController = ContentViewController(content: content)
            navigationController?.pushViewController(viewController, animated: true)
        case 1:
            if indexPath.row == 0 {
                let viewController = ChainedBuilderViewController()
                navigationController?.pushViewController(viewController, animated: true)
            }
        case 2:
            if indexPath.row == 0 {
                let viewController = ComplexBuilderViewController()
                navigationController?.pushViewController(viewController, animated: true)
            }
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 20.0, weight: .semibold)
        titleLabel.text = sections[section].title

        view.addSubview(titleLabel)
        titleLabel.addAnchors(
            top: view.topAnchor,
            bottom: view.bottomAnchor,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0
        )

        return view
    }
}
