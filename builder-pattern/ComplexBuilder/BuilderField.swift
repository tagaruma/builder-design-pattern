//
//  BuilderField.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 01.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import Foundation

protocol BuilderField: Hashable {
    var identifier: String { get }
    var title: String { get }
    var value: String? { get }
    var isRequired: Bool { get }

    func validate() throws
}
