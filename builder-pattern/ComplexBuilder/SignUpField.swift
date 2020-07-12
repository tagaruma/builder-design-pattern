//
//  SignUpField.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 02.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

enum SignUpField: BuilderField {
    case name(String?)
    case email(String?)
    case phone(String?)
    case password(String?)
    case confirmPassword(String?)

    var identifier: String {
        switch self {
        case .name:
            return "name"
        case .email:
            return "email"
        case .phone:
            return "phone"
        case .password:
            return "password"
        case .confirmPassword:
            return "confirmPassword"
        }
    }

    var title: String {
        switch self {
        case .name:
            return "Name"
        case .email:
            return "Email"
        case .phone:
            return "Phone"
        case .password:
            return "Password"
        case .confirmPassword:
            return "Confirm Password"
        }
    }

    var value: String? {
        switch self {
        case .name(let text):
            return text
        case .email(let text):
            return text
        case .phone(let text):
            return text
        case .password(let text):
            return text
        case .confirmPassword(let text):
            return text
        }
    }

    var isRequired: Bool {
        switch self {
        case .name:
            return true
        case .email:
            return true
        case .phone:
            return false
        case .password:
            return true
        case .confirmPassword:
            return true
        }
    }

    func validate() throws {
        switch self {
        case .name(let name):
            if let name = name, name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                throw BuilderError.missingInfo(self)
            }
        case .email(let email):
            if let email = email {
                if email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    throw BuilderError.missingInfo(self)
                }

                if !email.isValidEmail {
                    throw BuilderError.invalidInfo(self)
                }
            }
        case .phone(let phone):
            if let phone = phone {
                if !phone.isValidPhone {
                    throw BuilderError.invalidInfo(self)
                }
            }
        case .password(let password):
            if let password = password {
                if password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    throw BuilderError.missingInfo(self)
                }

                let passwordMinCharacters = 5

                if password.count < passwordMinCharacters {
                    throw BuilderError.tooShortValue(self, passwordMinCharacters)
                }
            }
        case .confirmPassword(let confirmPassword):
            if let confirmPassword = confirmPassword {
                if confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    throw BuilderError.missingInfo(self)
                }
                let passwordMinCharacters = 5

                if confirmPassword.count < passwordMinCharacters {
                    throw BuilderError.tooShortValue(self, passwordMinCharacters)
                }

            }
        }
    }
}
