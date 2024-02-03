import Foundation
import Plot
import Publish

struct KelvinHarron: Website {
    enum SectionID: String, WebsiteSectionID {
        case about
        case posts
        case talks
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    var url = URL(string: "https://kelvinharron.com")!
    var name = "Kelvin Harron"
    var language: Language { .english }
    var imagePath: Path? { nil }
    var description: String = ""
}

// This will generate your website using the built-in Foundation theme:
try KelvinHarron().publish(withTheme: .foundation)
