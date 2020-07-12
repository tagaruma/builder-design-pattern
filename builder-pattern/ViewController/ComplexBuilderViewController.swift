//
//  ComplexBuilderViewController.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 03.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

class ComplexBuilderViewController: BaseViewController {
    private lazy var nameTextField: UITextField = { // Built via Chained Builder
        UITextFieldBuilder()
            .setPlaceholder("Name")
            .setFont(.systemFont(ofSize: 17.0))
            .setAutocapitalizationType(.words)
            .setAutocorrectionType(.no)
            .setReturnKeyType(.next)
            .setDelegate(self)
            .build()
    }()

    private lazy var emailTextField: UITextField = { // Built via Chained Builder
        UITextFieldBuilder()
            .setPlaceholder("Email")
            .setFont(.systemFont(ofSize: 17.0))
            .setKeyboardType(.emailAddress)
            .setAutocorrectionType(.no)
            .setReturnKeyType(.next)
            .setDelegate(self)
            .build()
    }()

    private lazy var phoneTextField: UITextField = { // Built via Chained Builder
        UITextFieldBuilder()
            .setPlaceholder("Phone Number")
            .setFont(.systemFont(ofSize: 17.0))
            .setKeyboardType(.phonePad)
            .setAutocorrectionType(.no)
            .setReturnKeyType(.next)
            .setDelegate(self)
            .build()
    }()

    private lazy var passwordTextField = UITextField.build { textField in // Built via Block Basec Builder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.font = .systemFont(ofSize: 17.0)
        textField.isSecureTextEntry = true
        textField.autocorrectionType = .no
        textField.returnKeyType = .next
        textField.delegate = self
    }

    private lazy var confirmPasswordTextField = UITextField.build { textField in // Built via Block Basec Builder
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Confirm Password"
        textField.font = .systemFont(ofSize: 17.0)
        textField.isSecureTextEntry = true
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.delegate = self
    }

    private lazy var signUpButton = UIButton.build { button in // Built via Block Basec Builder
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(color: .rgb(red: 0.0, green: 117.0, blue: 255.0)), for: .normal)
        button.setBackgroundImage(UIImage(color: .rgb(red: 0.0, green: 80.0, blue: 178.0)), for: .highlighted)
        button.setBackgroundImage(UIImage(color: .rgb(red: 168.0, green: 209.0, blue: 255.0)), for: .disabled)
        button.addTarget(self, action: #selector(touchUpInside(signUpButton:)), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 18.0, weight: .semibold)
        button.setTitleColor(.rgb(value: 230.0), for: .disabled)
        button.setTitleColor(.rgb(value: 220.0), for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5.0
        button.clipsToBounds = true
    }

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        var activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.style = .large

        return activityIndicatorView
    }()
}

// MARK: - Life Cycle

extension ComplexBuilderViewController {
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

extension ComplexBuilderViewController {
    private func setUpSubviews() {
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(phoneTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(signUpButton)
        view.addSubview(activityIndicatorView)

        nameTextField.addAnchors(
            top: view.layoutGuide.topAnchor, topPadding: 15.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0
        )
        emailTextField.addAnchors(
            top: nameTextField.bottomAnchor, topPadding: 20.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0
        )
        phoneTextField.addAnchors(
            top: emailTextField.bottomAnchor, topPadding: 20.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0
        )
        passwordTextField.addAnchors(
            top: phoneTextField.bottomAnchor, topPadding: 20.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0
        )
        confirmPasswordTextField.addAnchors(
            top: passwordTextField.bottomAnchor, topPadding: 20.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0
        )
        signUpButton.addAnchors(
            top: confirmPasswordTextField.bottomAnchor, topPadding: 20.0,
            leading: view.leadingAnchor, leadingPadding: 15.0,
            trailing: view.trailingAnchor, trailingPadding: 15.0,
            height: 45.0
        )
        activityIndicatorView.addAnchors(
            centerX: view.centerXAnchor,
            centerY: view.centerYAnchor
        )
    }
}

// MARK: - UIButton

extension ComplexBuilderViewController {
    @objc private func touchUpInside(signUpButton: UIButton) {
        signUpButtonPressed()
    }
}

// MARK: - Actions

extension ComplexBuilderViewController {
    private func signUpButtonPressed() {
        signUpButton.isEnabled = false
        activityIndicatorView.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.activityIndicatorView.stopAnimating()
            self.signUpButton.isEnabled = true
            self.createSignUpModel()
        }
    }

    private func createSignUpModel() {
        do {
            let signUpModel = try SignUpModelBuilder()
                .set(field: .name(nameTextField.text))
                .set(field: .email(emailTextField.text))
                .set(field: .phone(phoneTextField.text))
                .set(field: .password(passwordTextField.text))
                .set(field: .confirmPassword(confirmPasswordTextField.text))
                .build()

            let message = """
            The following Sign Up Model was created using Builder Pattern
            name: \(signUpModel.name ?? ""))
            email: \(signUpModel.email ?? ""))
            phone: \(signUpModel.phone ?? ""))
            password: \(signUpModel.password ?? ""))
            """
            showAlertController(with: "Success", message: message)
        } catch let error {
            showAlertController(with: "Error", message: "\(error)")
        }
    }
}

// MARK: - UIAlertController

extension ComplexBuilderViewController {
    private func showAlertController(with title: String, message: String) {
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITextFieldDelegate

extension ComplexBuilderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            phoneTextField.becomeFirstResponder()
        case phoneTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField:
            textField.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
}
