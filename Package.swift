// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LaNetworkLayer",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "LaNetworkLayer",
            targets: ["LaNetworkLayer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1"))
    ],
    targets: [
        .target(
            name: "LaNetworkLayer",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
            ],
            path: "Sources"),
        .testTarget(
            name: "LaNetworkLayerTests",
            dependencies: ["LaNetworkLayer"]),
    ]
)
