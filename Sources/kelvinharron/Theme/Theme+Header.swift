//
//  Theme+Header.swift
//
//
//  Created by Felizia Bernutz on 22.03.20.
//

import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    static func header(
        for context: PublishingContext<KelvinHarron>,
        selectedSection: KelvinHarron.SectionID?
    ) -> Node {
        .header(
            .a(
                .class("skip-to-content-link"),
                .href("#main"),
                .text("Skip to main content")
            ),
            .div(
                .class("wrapper"),
                .siteName(for: context),
                .siteDescription(for: context),
                .navigation(for: context, selectedSection: selectedSection)
            )
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func siteName(for context: PublishingContext<KelvinHarron>) -> Self {
        .a(
            .class("site-name"),
            .href("/"),
            .text("Kelvin's Blog")
        )
    }

    static func siteDescription(for context: PublishingContext<KelvinHarron>) -> Self {
        .p(
            .text(context.site.description)
        )
    }

    static func navigation(for context: PublishingContext<KelvinHarron>, selectedSection: KelvinHarron.SectionID?) -> Self {
        return .nav(
            .ul(
                .forEach(KelvinHarron.SectionID.allCases) { section in
                    .li(
                        .a(
                            .class(section == selectedSection ? "selected" : ""),
                            .href(context.sections[section].path),
                            .text(context.sections[section].id == .about ? "About" : context.sections[section].title)
                        )
                    )
                }
            )
        )
    }
}
