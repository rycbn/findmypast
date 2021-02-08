// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SearchFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SearchFeature",
            targets: ["SearchFeature"]),
    ],
    dependencies: [
        .package(path: "Shared"),
        .package(path: "SharedUI"),
        .package(path: "Networking"),
        .package(path: "FragmentFeature")
    ],
    targets: [
        .target(
            name: "SearchFeature",
            dependencies: [
                "Shared",
                "SharedUI",
                "Networking",
                "FragmentFeature",
            ]
        ),
        .testTarget(
            name: "SearchFeatureTests",
            dependencies: ["SearchFeature"]),
    ]
)
