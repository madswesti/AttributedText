// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "AttributedText",
	platforms: [.iOS(.v13)],
    products: [
        .library(name: "AttributedText", targets: ["AttributedText"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "AttributedText", dependencies: [])
    ]
)
