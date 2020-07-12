//
//  ChainedBuilderViewController.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 03.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

class ChainedBuilderViewController: BaseViewController {
    private lazy var defaultTextField: UITextField = {
        UITextFieldBuilder()
            .setPlaceholder("Default TextField")
            .setFont(.systemFont(ofSize: 17.0))
            .setClearButtonMode(.never)
            .setReturnKeyType(.next)
            .setAutocorrectionType(.no)
            .setAutocapitalizationType(.words)
            .setDelegate(self)
            .build()
    }()

    private lazy var secureTextEntryTextField: UITextField = {
        UITextFieldBuilder()
            .setPlaceholder("Secure Text Entry TextField")
            .setFont(.systemFont(ofSize: 17.0))
            .setClearButtonMode(.whileEditing)
            .setReturnKeyType(.done)
            .setIsSecureTextEntry(true)
            .build()
    }()

    private lazy var primaryButton: UIButton = {
        UIButtonBuilder()
            .setTitle("Primary Button")
            .setTitleColor(.white)
            .setTitleColor(.rgb(value: 200.0), for: .highlighted)
            .setTitleFont(.systemFont(ofSize: 17.0, weight: .semibold))
            .setBackgroundColor(.rgb(red: 0.0, green: 117.0, blue: 255.0))
            .setBackgroundColor(.rgb(red: 0.0, green: 80.0, blue: 178.0), for: .highlighted)
            .setBackgroundColor(.rgb(red: 168.0, green: 209.0, blue: 255.0), for: .disabled)
            .setTarget(self, action: #selector(touchUpInside(defaultButton:)))
            .setClipsToBounds(true)
            .setCornerRadius(5.0)
            .setAccessibilityIdentifier("PrimaryButton")
            .build()
    }()

    private lazy var secondaryButton: UIButton = {
        UIButtonBuilder()
            .setTitle("Secondary Button")
            .setTitleColor(.rgb(red: 0.0, green: 117.0, blue: 255.0))
            .setTitleColor(.rgb(red: 0.0, green: 80.0, blue: 178.0), for: .highlighted)
            .setBorderWidth(1.0)
            .setBorderColor(.rgb(red: 0.0, green: 117.0, blue: 255.0))
            .setBackgroundColor(.rgb(value: 240.0), for: .highlighted)
            .setTitleFont(.systemFont(ofSize: 18.0))
            .setTarget(self, action: #selector(touchUpInside(secondaryButton:)))
            .setClipsToBounds(true)
            .setCornerRadius(5.0)
            .setAccessibilityIdentifier("SecondaryButton")
            .build()
    }()
}

// MARK: - Life Cycle

extension ChainedBuilderViewController {
    override func loadView() {
        super.loadView()

        setUpSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Chained Builder Example"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationItem.largeTitleDisplayMode = .never
    }
}

// MARK: - Layout

extension ChainedBuilderViewController {
    private func setUpSubviews() {
        view.addSubview(defaultTextField)
        view.addSubview(secureTextEntryTextField)
        view.addSubview(primaryButton)
        view.addSubview(secondaryButton)

        defaultTextField.addAnchors(
            top: view.layoutGuide.topAnchor, topPadding: 15.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0
        )
        secureTextEntryTextField.addAnchors(
            top: defaultTextField.bottomAnchor, topPadding: 20.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0
        )
        primaryButton.addAnchors(
            top: secureTextEntryTextField.bottomAnchor, topPadding: 20.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            height: 40.0
        )
        secondaryButton.addAnchors(
            top: primaryButton.bottomAnchor, topPadding: 15.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            height: 40.0
        )
    }
}

// MARK: - UIButton

extension ChainedBuilderViewController {
    @objc private func touchUpInside(defaultButton: UIButton) {
        defaultButtonPressed()
    }

    @objc private func touchUpInside(secondaryButton: UIButton) {
        secondaryButtonPressed()
    }
}

// MARK: - Actions

extension ChainedBuilderViewController {
    private func defaultButtonPressed() {
        UIView.animate(withDuration: 0.5, animations: {
            self.primaryButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.primaryButton.transform = CGAffineTransform.identity
            }
        })
    }

    private func secondaryButtonPressed() {
        UIView.animate(withDuration: 0.5, animations: {
            self.secondaryButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }, completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.secondaryButton.transform = CGAffineTransform.identity
            }
        })
    }
}

// MARK: - UITextFieldDelegate

extension ChainedBuilderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == defaultTextField { secureTextEntryTextField.becomeFirstResponder() }
        return true
    }
}
