// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AssetCatalogAware",
    platforms: [
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "AssetCatalogAware",
            targets: ["AssetCatalogAware"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AssetCatalogAware",
            dependencies: []),
    ]
)
