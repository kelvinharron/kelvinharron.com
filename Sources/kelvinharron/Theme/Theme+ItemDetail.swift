//
//  Theme+ItemDetail.swift
//
//
//  Created by Felizia Bernutz on 26.03.20.
//

import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    static func itemDetail(for item: Item<KelvinHarron>, on site: KelvinHarron) -> Node {
        switch item.sectionID {
        case .posts:
            return .article(
                .blogPostDetail(item),
                .if(item.tags.count > 0,
                    .div(
                        .class("tags"),
                        .span("Tagged with: "),
                        .tagList(for: item, on: site)
                    ))
            )

        case .about, .talks:
            return .article(
                .cvDetail(item)
            )
        }
    }
}

private extension Node where Context == HTML.BodyContext {
    static func blogPostDetail(_ item: Item<KelvinHarron>) -> Self {
        return .div(
            .class("content post-detail"),
            .p(
                .class("release-date")
            ),
            .contentBody(item.body)
        )
    }

    static func cvDetail(_ item: Item<KelvinHarron>) -> Self {
        .div(
            .class("content about"),
            .contentBody(item.body)
        )
    }
}
