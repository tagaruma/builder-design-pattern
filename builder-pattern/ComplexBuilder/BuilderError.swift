//
//  BuilderError.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 01.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import Foundation

enum BuilderError<Field: BuilderField>: Error, CustomStringConvertible {
    case missingInfo(Field)
    case invalidInfo(Field)
    case tooShortValue(Field, Int)
    case failedMatching(Field)

    var description: String {
        switch self {
        case .missingInfo(let field):
            return "\(field.title) cannot be empty.\nPlease enter your \(field.title)"
        case .invalidInfo(let field):
            return "Please enter a valid \(field.title)."
        case .tooShortValue(let field, let requiredCharacters):
            return "\(field.title) is too short. It should have at least \(requiredCharacters) characters."
        case .failedMatching(let field):
            return "\(field.title) does not match."
        }
    }
}
