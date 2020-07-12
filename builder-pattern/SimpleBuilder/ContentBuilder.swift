//
//  ContentBuilder.swift
//  builder-pattern
//
//  Created by Ruslan Garifulin on 01.06.2020.
//  Copyright © 2020 Ruslan Garifulin. All rights reserved.
//

import UIKit

class ContentBuilder {
    enum Genre {
        case movie
        case music
        case gaming
        case sports
    }

    func build(for genre: Genre) -> Content {
        switch genre {
        case .movie:
            return Content(
                title: "Movie Content",
                image: UIImage(named: "ic-movie"),
                text: "This is an example of Content screen made with the help of Content Builder",
                textColor: .rgb(red: 120.0, green: 115.0, blue: 110.0),
                textWeight: .regular,
                textAlignment: .center,
                backgroundColor: .rgb(red: 240.0, green: 235.0, blue: 230.0)
            )
        case .music:
            return Content(
                title: "Music Content",
                image: UIImage(named: "ic-music"),
                text: "This content screen data object is built with the help of Builder Pattern",
                textColor: .rgb(red: 120.0, green: 130.0, blue: 200.0),
                textWeight: .semibold,
                textAlignment: .center,
                backgroundColor: .rgb(red: 210.0, green: 240.0, blue: 250.0)
            )
        case .gaming:
            return Content(
                title: "Gaming Content",
                image: UIImage(named: "ic-gaming"),
                text: "Content object for this screen was made via Simple Builder Pattern",
                textColor: .rgb(value: 50.0),
                textWeight: .thin,
                textAlignment: .center,
                backgroundColor: .rgb(value: 220.0)
            )
        case .sports:
            return Content(
                title: "Sports Content",
                image: UIImage(named: "ic-sports"),
                text: "Content in this screen is a result of build function in Builder Class",
                textColor: .black,
                textWeight: .regular,
                textAlignment: .center,
                backgroundColor: .white
            )
        }
    }
}
