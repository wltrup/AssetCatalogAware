// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AssetCatalogAware",
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
