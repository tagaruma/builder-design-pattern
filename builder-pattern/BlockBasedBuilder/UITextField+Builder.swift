//
//  UITextField+Builder.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 01.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

 import UIKit

extension UITextField {
    static func build(block: ((UITextField) -> Void)) -> UITextField {
        let textField = UITextField()
        block(textField)

        return textField
    }
}
