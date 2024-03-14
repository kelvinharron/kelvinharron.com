import Plot
import Publish



extension Theme where Site == KelvinHarron {
    static var custom: Self {
        Theme(htmlFactory: BlogHTMLFactory())
    }

    private struct BlogHTMLFactory: HTMLFactory {
        func makeIndexHTML(for index: Index, context: PublishingContext<KelvinHarron>) throws -> HTML {
            try HTML(
                .lang(context.site.language),
                .head(for: index, on: context.site),
                .googleTrackerHead(),
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .div(
                            .section(
                                .h1("Recent Posts"),
                                .itemList(
                                    for: Array(
                                        context.allItems(
                                            sortedBy: \.date,
                                            order: .descending
                                        )
                                        .filter { $0.sectionID == .posts }
                                        .prefix(3)
                                    )
                                )
                            )
                        )
                    ),
                    .footer(for: context.site)
                )
            )
        }

        func makeSectionHTML(for section: Section<KelvinHarron>, context: PublishingContext<KelvinHarron>) throws -> HTML {
            let items = Array(
                context.allItems(
                    sortedBy: \.date,
                    order: .descending
                )
                .filter { $0.sectionID == section.id }
            )

            let sectionContent: Node<HTML.BodyContext>
            switch section.id {
            case .posts:
                sectionContent = .wrapper(
                    .section(
                        .h1(.text(section.title)),
                        try! .itemList(
                            for: items
                        )
                    )
                )
            case .about, .talks:
                sectionContent = .wrapper(
                    .section(
                        .article(
                            section.content.body.node
                        )
                    )
                )
            }

            return HTML(
                .lang(context.site.language),
                .head(for: section, on: context.site),
                .body(
                    .header(for: context, selectedSection: section.id),
                    sectionContent,
                    .footer(for: context.site)
                )
            )
        }

        func makeItemHTML(for item: Item<KelvinHarron>, context: PublishingContext<KelvinHarron>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: item, on: context.site),
                .body(
                    .class("item-page"),
                    .header(for: context, selectedSection: item.sectionID),
                    .wrapper(
                        .section(
                            .itemDetail(for: item, on: context.site)
                        )
                    ),
                    .footer(for: context.site)
                )
            )
        }

        func makePageHTML(for page: Page, context: PublishingContext<KelvinHarron>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        "Hello"
                    ),
                    .footer(for: context.site)
                )
            )
        }

        func makeTagListHTML(for page: TagListPage, context: PublishingContext<KelvinHarron>) throws -> HTML? {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .section(
                            .h1("Browse all tags"),
                            .ul(
                                .class("all-tags"),
                                .forEach(page.tags.sorted()) { tag in
                                    .li(
                                        .class("tag"),
                                        .a(
                                            .href(context.site.path(for: tag)),
                                            .text(tag.string)
                                        )
                                    )
                                }
                            )
                        )
                    ),
                    .footer(for: context.site)
                )
            )
        }

        func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<KelvinHarron>) throws -> HTML? {
            try HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .section(
                            .h1(
                                "Tagged with ",
                                .span(
                                    .class("tag"),
                                    .text(page.tag.string)
                                )
                            ),
                            .a(
                                .class("browse-all"),
                                .text("Browse all tags"),
                                .href(context.site.tagListPath)
                            ),
                            .itemList(
                                for: context.items(
                                    taggedWith: page.tag,
                                    sortedBy: \.date,
                                    order: .descending
                                )
                            )
                        )
                    ),
                    .footer(for: context.site)
                )
            )
        }
    }
}
