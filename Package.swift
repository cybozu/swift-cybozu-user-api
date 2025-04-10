// swift-tools-version: 6.1

import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("ExistentialAny"),
]

let package = Package(
    name: "CybozuUserAPI",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "CybozuUserAPI",
            targets: ["CybozuUserAPI"]
        ),
    ],
    targets: [
        .target(
            name: "CybozuUserAPI",
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "CybozuUserAPITests",
            dependencies: ["CybozuUserAPI"],
            swiftSettings: swiftSettings
        ),
    ]
)
