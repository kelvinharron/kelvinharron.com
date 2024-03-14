//
//  File.swift
//
//
//  Created by Kelvin Harron on 14/03/2024.
//

import Foundation
import Plot
import Publish

public extension Node where Context == HTML.DocumentContext {
    static func googleTrackerHead() -> Node {
        .head(
            .script(
                .src("https://www.googletagmanager.com/gtag/js?id=G-7P22WBBM3H")),
            .script(
                """
                  window.dataLayer = window.dataLayer || [];
                  function gtag(){dataLayer.push(arguments);}
                  gtag('js', new Date());

                  gtag('config', 'G-7P22WBBM3H');
                """
            ))
    }
}
