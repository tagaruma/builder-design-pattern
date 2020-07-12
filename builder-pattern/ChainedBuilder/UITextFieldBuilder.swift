//
//  UITextFieldBuilder.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 01.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

class UITextFieldBuilder {
    private var textField: UITextField

    // MARK: - Init

    init() {
        textField = UITextField()
    }
}

// MARK: - Actions

extension UITextFieldBuilder {
    func setText(_ text: String) -> UITextFieldBuilder {
        textField.text = text
        return self
    }

    func setPlaceholder(_ placeholder: String) -> UITextFieldBuilder {
        textField.placeholder = placeholder
        return self
    }

    func setFont(_ font: UIFont) -> UITextFieldBuilder {
        textField.font = font
        return self
    }

    func setTextAlignment(_ alignment: NSTextAlignment) -> UITextFieldBuilder {
        textField.textAlignment = alignment
        return self
    }

    func setDelegate(_ delegate: UITextFieldDelegate) -> UITextFieldBuilder {
        textField.delegate = delegate
        return self
    }

    func setKeyboardType(_ keyboardType: UIKeyboardType) -> UITextFieldBuilder {
        textField.keyboardType = keyboardType
        return self
    }

    func setReturnKeyType(_ returnKeyType: UIReturnKeyType) -> UITextFieldBuilder {
        textField.returnKeyType = returnKeyType
        return self
    }

    func setAutocorrectionType(_ autocorrectionType: UITextAutocorrectionType) -> UITextFieldBuilder {
        textField.autocorrectionType = autocorrectionType
        return self
    }

    func setAutocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) -> UITextFieldBuilder {
        textField.autocapitalizationType = autocapitalizationType
        return self
    }

    func setClearButtonMode(_ clearButtonMode: UITextField.ViewMode) -> UITextFieldBuilder {
        textField.clearButtonMode = clearButtonMode
        return self
    }

    func setIsSecureTextEntry(_ isSecureTextEntry: Bool) -> UITextFieldBuilder {
        textField.isSecureTextEntry = isSecureTextEntry
        return self
    }

    func build() -> UITextField { textField }
}
