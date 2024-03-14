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
    static func clickyTrackerHead() -> Node {
        .head(.script(.raw(
            """
            <a title="Google Analytics Alternative" href="https://clicky.com/101443661"><img alt="Clicky" src="//static.getclicky.com/media/links/badge.gif" border="0" /></a>
            <script async data-id="101443661" src="//static.getclicky.com/js"></script>
            """
        )
        )
        )
    }
}
