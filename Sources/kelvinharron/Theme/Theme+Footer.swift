//
//  Theme+Footer.swift
//
//
//  Created by Felizia Bernutz on 22.03.20.
//

import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    static func footer<T: Website>(for site: T) -> Node {
        return .footer(
            .p(
                .text("Made by Kelvin Harron using "),
                .linkToPublish,
                .text(". This site is "),
                .linkToOpenSourceRepo,
                .text(".")
            ),
            .p(
                .linkToTwitter,
                .separator,
                .linkToMastodon,
                .separator,
                .linkToGithub,
                .separator
            )
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static let separator: Self = .text(" | ")

    static let linkToPublish: Self =
        .a(
            .text("Publish"),
            .href("https://github.com/johnsundell/publish"),
            .target(.blank),
            .rel(.noreferrer)
        )

    static let linkToOpenSourceRepo: Self =
        .a(
            .text("open source"),
            .href("https://github.com/kelvinharron/kelvinharron.com"),
            .target(.blank),
            .rel(.noreferrer)
        )

    static let linkToTwitter: Self =
        .a(
            .text("X"),
            .href("https://twitter.com/kelvinharron"),
            .target(.blank),
            .rel(.noreferrer)
        )

    static let linkToMastodon: Self =
        .a(
            .text("Mastodon"),
            .href("https://iosdev.space/@kelvinharron"),
            .target(.blank),
            .attribute(named: "rel", value: "me noreferrer")
        )

    static let linkToGithub: Self =
        .a(
            .text("GitHub"),
            .href("https://github.com/kelvinharron"),
            .target(.blank),
            .rel(.noreferrer)
        )
}
