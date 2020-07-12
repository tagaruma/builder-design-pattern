//
//  UILabel+Builder.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 01.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

extension UILabel {
    static func build(block: ((UILabel) -> Void)) -> UILabel {
        let label = UILabel()
        block(label)

        return label
    }
}
