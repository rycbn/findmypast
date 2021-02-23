// swift-tools-version:5.3

import PackageDescription

private let targets: [String] = [
    "Shared",
    "SharedUI",
    "AsyncImage",
    "Networking",
    "PersonsClient",
    "PersonsClientLive",
    "PersonsFeature",
    "ProfileClient",
    "ProfileClientLive",
    "ProfileFeature",
]

let package = Package(
    name: "findmypast",
    platforms: [.iOS(.v14)],
    products: targets.map { .library(name: $0, targets: [$0]) },
    dependencies: [],
    targets: [
        .target(
            name: "Shared",
            dependencies: [],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "SharedUI",
            dependencies: [
                "Shared",
                "AsyncImage"
            ]
        ),
        .target(
            name: "AsyncImage",
            dependencies: []
        ),
        .target(
            name: "Networking",
            dependencies: []
        ),
        .target(
            name: "PersonsClient",
            dependencies: [
                "Shared"
            ]
        ),
        .target(
            name: "PersonsClientLive",
            dependencies: [
                "PersonsClient"
            ]
        ),
        .target(
            name: "PersonsFeature",
            dependencies: [
                "SharedUI",
                "Networking",
                "PersonsClientLive",
                "ProfileFeature"
            ]
        ),
        .target(
            name: "ProfileClient",
            dependencies: [
                "Shared"
            ]
        ),
        .target(
            name: "ProfileClientLive",
            dependencies: [
                "ProfileClient"
            ]
        ),
        .target(
            name: "ProfileFeature",
            dependencies: [
                "SharedUI",
                "Networking",
                "ProfileClientLive"
            ]
        ),
        .testTarget(
            name: "SharedTests",
            dependencies: [
                "Shared",
                "PersonsClient",
                "ProfileClient"
            ]
        ),
        .testTarget(
            name: "SharedUITests",
            dependencies: [
                "SharedUI"
            ]
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: [
                "Networking"
            ]
        ),
        .testTarget(
            name: "PersonsFeatureTests",
            dependencies: [
                "PersonsFeature"
            ]
        ),
        .testTarget(
            name: "ProfileFeatureTests",
            dependencies: [
                "ProfileFeature",
                "PersonsClient"
            ]
        ),
    ]
)
