
import Plot

public extension Node where Context == HTML.DocumentContext {
    static func googleTrackerHead() -> Node {
        .head(
            .script(
                .src("https://www.googletagmanager.com/gtag/js?id=UA-111111111-1")),
            .script(
                """
                <!-- Google tag (gtag.js) -->
                <script async src="https://www.googletagmanager.com/gtag/js?id=G-2X3D6YQR8G"></script>
                <script>
                  window.dataLayer = window.dataLayer || [];
                  function gtag(){dataLayer.push(arguments);}
                  gtag('js', new Date());

                  gtag('config', 'G-2X3D6YQR8G');
                </script>

                """
            ))
    }
}
