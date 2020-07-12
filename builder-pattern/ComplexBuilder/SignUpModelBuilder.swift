//
//  SignUpModelBuilder.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 02.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import Foundation

class SignUpModelBuilder: Builder {
    typealias FieldType = SignUpField
    typealias Model = SignUpModel

    var fields: Set<SignUpField> = []

    func matchPasswords() throws {
        if let password = getField(with: SignUpField.password(nil).identifier),
            let confirmPassword = getField(with: SignUpField.confirmPassword(nil).identifier),
            password.value != confirmPassword.value {
            throw BuilderError.failedMatching(confirmPassword)
        }
    }

    func build() throws -> SignUpModel {
        try validateAll()
        try matchPasswords()

        let name = getField(with: SignUpField.name(nil).identifier)?.value
        let email = getField(with: SignUpField.email(nil).identifier)?.value
        let phone = getField(with: SignUpField.phone(nil).identifier)?.value
        let password = getField(with: SignUpField.password(nil).identifier)?.value


        return SignUpModel(name: name, email: email, phone: phone, password: password)
    }
}
