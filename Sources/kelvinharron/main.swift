import Ink
import Plot
import Publish
import SplashPublishPlugin

try KelvinHarron().publish(
    using: [
        .installPlugin(.splash(withClassPrefix: "")),
        .addMarkdownFiles(),
        .copyResources(),
        .generateHTML(withTheme: .custom, indentation: .tabs(2)),
        .generateRSSFeed(including: [.posts]),
        .generateSiteMap(indentedBy: .tabs(2))
    ]
)
