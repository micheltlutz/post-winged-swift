// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MeuSite",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: [
        .package(url: "https://github.com/micheltlutz/Winged-Swift.git", from: "1.3.3")
    ],
    targets: [
        .executableTarget(
            name: "MeuSite",
            dependencies: [
                .product(name: "WingedSwift", package: "Winged-Swift")
            ]
        ),
    ]
)