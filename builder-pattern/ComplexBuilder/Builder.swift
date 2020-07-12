//
//  Builder.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 01.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import Foundation

protocol Builder: class {
    associatedtype FieldType: BuilderField
    associatedtype Model: BuildableModel

    var fields: Set<FieldType> { get set }

    func build() throws -> Model
}

extension Builder {
    func set(field: FieldType) -> Self {
        fields.update(with: field)
        return self
    }

    func getField(with identifier: String) -> FieldType? {
        guard let index = fields.firstIndex(where: { $0.identifier == identifier } ) else { return nil }
        return fields[index]
    }

    func validateAll() throws {
        for field in fields {
            try field.validate()
        }
    }
}
