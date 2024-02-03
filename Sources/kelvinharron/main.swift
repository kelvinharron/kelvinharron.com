import Foundation
import Plot
import Publish

struct KelvinHarron: Website {
    enum SectionID: String, WebsiteSectionID {
        case posts
        case about
        case talks
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    var url = URL(string: "https://kelvinharron.com")!
    var name = "kelvinharron"
    var language: Language { .english }
    var imagePath: Path? { nil }
    var description: String = ""
}

// This will generate your website using the built-in Foundation theme:
try KelvinHarron().publish(using: [
    .addMarkdownFiles(),
    .copyResources(),
    .generateSiteMap(),
    .generateHTML(withTheme: .foundation),
    .generateRSSFeed(including: [.about, .posts, .talks]),
    .unwrap(.gitHub("kelvinharron/kelvinharron.com", branch: "master", useSSH: false), PublishingStep.deploy)
])
