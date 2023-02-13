// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LayoutSugar",
    products: [
        .library(
            name: "LayoutSugar",
            targets: ["LayoutSugar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.6.0"),
    ],
    targets: [
        .target(
            name: "LayoutSugar",
            dependencies: [
                .product(name: "SnapKit", package: "SnapKit")
            ]),
        .testTarget(
            name: "LayoutSugarTests",
            dependencies: ["LayoutSugar"]),
    ]
)
