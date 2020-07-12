//
//  UITableView+Builder.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 01.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

extension UITableView {
    static func build(
        frame: CGRect = .zero,
        style: UITableView.Style = .plain,
        block: ((UITableView) -> Void)
    ) -> UITableView {
        let tableView = UITableView(frame: frame, style: style)
        block(tableView)

        return tableView
    }

}
