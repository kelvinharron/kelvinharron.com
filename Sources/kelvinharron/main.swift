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
    var description: String {
        """
        Hey, I’m Kelvin.

        My blog will focus on my day-to-day learnings and protips from working on mobile app development, primarily in native Android. My goals in 2022 2023 are to gain a strong understanding of the alternatives to native iOS and Android development, including KMM, Flutter and more. Check my Twitter where I’ll share my updates.
        """
    }
}

// This will generate your website using the built-in Foundation theme:
try KelvinHarron().publish(using: [
    .addMarkdownFiles(),
    .copyResources(),
    .generateSiteMap(),
    .generateHTML(withTheme: .foundation),
    .generateRSSFeed(including: [.about, .posts, .talks]),
    .unwrap(.gitHub("kelvinharron/kelvinharron.com", useSSH: false), PublishingStep.deploy)
])

