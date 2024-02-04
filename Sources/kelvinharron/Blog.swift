import Foundation
import Plot
import Publish

struct KelvinHarron: Website {
    enum SectionID: String, WebsiteSectionID {
        case posts
        case about
        case talks
    }

    struct ItemMetadata: WebsiteItemMetadata {}

    var url = URL(string: "https://kelvinharron.com")!
    var name = "Kelvin Harron"
    var description = "iOS Development + ramblings"
    var language: Language { .english }
    var imagePath: Path? { nil }
}
