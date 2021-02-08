// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FragmentFeature",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "FragmentFeature",
            targets: ["FragmentFeature"]),
    ],
    dependencies: [
        .package(path: "Shared"),
        .package(path: "SharedUI"),
        .package(path: "Networking")
    ],
    targets: [
        .target(
            name: "FragmentFeature",
            dependencies: ["Shared", "SharedUI", "Networking"]),
        .testTarget(
            name: "FragmentFeatureTests",
            dependencies: ["FragmentFeature"]),
    ]
)
