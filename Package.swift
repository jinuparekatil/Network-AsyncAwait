// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Network-AsyncAwait",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Network-AsyncAwait",
            targets: ["Network-AsyncAwait"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Network-AsyncAwait"),
        .testTarget(
            name: "Network-AsyncAwaitTests",
            dependencies: ["Network-AsyncAwait"]),
    ]
)
