// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "KelvinharronCom",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "KelvinharronCom",
            targets: ["KelvinharronCom"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.8.0")
    ],
    targets: [
        .executableTarget(
            name: "KelvinharronCom",
            dependencies: ["Publish"]
        )
    ]
)