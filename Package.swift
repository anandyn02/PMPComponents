// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PMPComponents",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PMPComponents",
            targets: ["PMPComponents"]),
    ],
    dependencies: [
        .package(url: "https://github.com/freshOS/Stevia", exact: "5.1.2"),
        .package(url: "https://github.com/anandyn02/PMP_Component", exact: "1.0.1"),
        .package(url:"https://github.com/onevcat/Kingfisher", exact: "7.9.1"),
        .package(url:"https://github.com/RNCryptor/RNCryptor", exact: "5.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PMPComponents",
            dependencies: ["Stevia", "PMP_Component", "Kingfisher", "RNCryptor"],path: "Sources"),
        .testTarget(
            name: "PMPComponentsTests",
            dependencies: ["PMPComponents"]),
    ]
)
