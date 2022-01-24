// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AirKit",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "AirKit", targets: ["AirKit"])
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "AirKit", path: "AirKit/Source"),
        .testTarget(name: "AirKitTests", dependencies: ["AirKit"], path: "AirKitTests/Source")
    ],
    swiftLanguageVersions: [.v5]
)
