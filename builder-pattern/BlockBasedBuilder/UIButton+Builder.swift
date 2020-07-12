//
//  UIButton+Builder.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 01.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

extension UIButton {
    static func build(block: ((UIButton) -> Void)) -> UIButton {
        let button = UIButton()
        block(button)

        return button
    }
}
