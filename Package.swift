// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-web",
    dependencies: [
        .package(
            url: "https://github.com/hummingbird-project/hummingbird.git",
            from: "2.0.0")
    ],
    targets: [
        .executableTarget(
            name: "WebServer",
            dependencies: [
                .product(name: "Hummingbird", package: "hummingbird")
            ])
    ]
)
