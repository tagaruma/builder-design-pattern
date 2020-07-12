//
//  UIButtonBuilder.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 01.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

class UIButtonBuilder {
    private var button: UIButton

    // MARK: - Init

    init() {
        button = UIButton()
    }
}

// MARK: - Actions

extension UIButtonBuilder {
    func setTitle(_ title: String, for state: UIControl.State = .normal) -> UIButtonBuilder {
        button.setTitle(title, for: state)
        return self
    }

    func setTitleColor(_ color: UIColor, for state: UIControl.State = .normal) -> UIButtonBuilder {
        button.setTitleColor(color, for: state)
        return self
    }

    func setTitleFont(_ font: UIFont) -> UIButtonBuilder {
        button.titleLabel?.font = font
        return self
    }

    func setBackgroundColor(_ color: UIColor, for state: UIControl.State = .normal) -> UIButtonBuilder {
        button.setBackgroundImage(UIImage(color: color), for: state)
        return self
    }

    func setImage(_ image: UIImage, for state: UIControl.State = .normal) -> UIButtonBuilder {
        button.setImage(image, for: state)
        return self
    }

    func setTarget(_ target: Any?, action: Selector, for events: UIControl.Event = .touchUpInside) -> UIButtonBuilder {
        button.addTarget(target, action: action, for: events)
        return self
    }

    func setClipsToBounds(_ clipsToBounds: Bool) -> UIButtonBuilder {
        button.clipsToBounds = clipsToBounds
        return self
    }

    func setCornerRadius(_ cornerRadius: CGFloat) -> UIButtonBuilder {
        button.layer.cornerRadius = cornerRadius
        return self
    }

    func setBorderColor(_ color: UIColor) -> UIButtonBuilder {
        button.layer.borderColor = color.cgColor
        return self
    }

    func setBorderWidth(_ width: CGFloat) -> UIButtonBuilder {
        button.layer.borderWidth = width
        return self
    }

    func setAccessibilityIdentifier(_ identifier: String) -> UIButtonBuilder {
        button.accessibilityIdentifier = identifier
        return self
    }

    func build() -> UIButton { button }
}

