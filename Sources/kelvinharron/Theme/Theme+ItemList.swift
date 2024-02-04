//
//  Theme+ItemList.swift
//
//
//  Created by Felizia Bernutz on 22.03.20.
//

import Foundation
import Plot
import Publish
import ShellOut

extension Node where Context == HTML.BodyContext {
    static func itemList(for items: [Item<KelvinHarron>]) throws -> Node {
        let postItems = items.filter { $0.sectionID == .posts }

        return .div(
            .if(postItems.count > 0,
                .ul(
                    .class("grid posts"),
                    .forEach(postItems) { item in
                        .li(
                            .class("item posts"),
                            .blogPostItem(item)
                        )
                    }
                ))
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func blogPostItem(_ item: Item<KelvinHarron>) -> Self {
        return .article(
            .p(
                .class("release-date")
            ),
            .h1(
                .a(
                    .href(item.path),
                    .text(item.title)
                )
            ),
            .p(.text(item.description))
        )
    }

    static func sketchnoteItem(_ item: Item<KelvinHarron>) throws -> Self {
        guard let imagePath = item.imagePath else {
            throw PublishingError(
                infoMessage: "🖼💥 Missing imagePath on: \(item.title)"
            )
        }

        return .article(
            .class("sketchnote-item"),
            .a(
                .href(item.path),
                .img(
                    .class("sketchnote-image"),
                    .src(imagePath),
                    .alt(item.description)
                ),
                .p(
                    .class("sketchnote-title"),
                    .text(item.title)
                )
            )
        )
    }
}
