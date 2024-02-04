import Foundation
import Plot
import Publish

// This type acts as the configuration for your website.
struct KelvinHarron: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://kelvinharron.com")!
    var name = "Kelvin Harron"
    var description = "A Staff Engineer figuring it all out"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try KelvinHarron()
    .publish(withTheme: .foundation)