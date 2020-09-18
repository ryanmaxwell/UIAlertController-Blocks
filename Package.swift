// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIAlertController_Blocks",
    products: [
        .library(
            name: "UIAlertController_Blocks",
            targets: ["UIAlertController_Blocks"]),
    ],
    targets: [
        .target(
            name: "UIAlertController_Blocks",
            path: "UIAlertController_Blocks",
            publicHeadersPath: "")
    ]
)
