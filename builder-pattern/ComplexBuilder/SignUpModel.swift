//
//  SignUpModel.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 02.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import Foundation

struct SignUpModel: BuildableModel {
    var name: String?
    var email: String?
    var phone: String?
    var password: String?
}
