// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "findmypast",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Shared",
            targets: ["Shared"]
        ),
        .library(
            name: "SharedUI",
            targets: ["SharedUI"]
        ),
        .library(
            name: "Networking",
            targets: ["Networking"]
        ),
        .library(
            name: "PersonsClient",
            targets: ["PersonsClient"]
        ),
        .library(
            name: "PersonsClientLive",
            targets: ["PersonsClientLive"]
        ),
        .library(
            name: "PersonsFeature",
            targets: ["PersonsFeature"]
        ),
        .library(
            name: "ProfileClient",
            targets: ["ProfileClient"]
        ),
        .library(
            name: "ProfileClientLive",
            targets: ["ProfileClientLive"]
        ),
        .library(
            name: "ProfileFeature",
            targets: ["ProfileFeature"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/onevcat/Kingfisher",
            from: "6.1.0"
        ),
    ],
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
                "Kingfisher"
            ]
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
